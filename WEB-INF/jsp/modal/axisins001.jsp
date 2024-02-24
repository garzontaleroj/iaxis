<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="pantalla" value="axisins001"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="${param.f}"/>
    </c:otherwise>
</c:choose>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title><axis:alt f="axis" c="TITULO" lit="9905244"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp" />
    
    <script type="text/javascript">
        
        function f_but_salir() {            
            parent.f_cerrar_${pantalla}();
        }
        
        function f_on_load() {            
       
            var listaordenes = "${fn:length(requestScope.IRORDENES)}";
           
            if (listaordenes >0){
                objEstilos.toggleDisplay("DSP_IRORDENES", document.getElementById("DSP_IRORDENES_parent"));
                var ninspeccion = document.getElementById("NINSPECCION").value;
                var sorden = document.getElementById("SORDEN").value;           
                if (ninspeccion!='null' ){ 
                    objEstilos.toggleDisplay("DSP_IRINSPECCIONES", document.getElementById("DSP_IRINSPECCIONES_parent"));
                    f_cargar_inspecciones(sorden, ninspeccion);                
                }
            }
        }
        
        function f_cargar_detalle(SORDEN, NINSPECCION){             
             objAjax.invokeAsyncCGI("modal_${pantalla}.do",callbackAjaxCargarDetalle, "operation=cargar_detalle&SORDEN=" + SORDEN+ "&NINSPECCION="+NINSPECCION,  this);
        }
        
        function callbackAjaxCargarDetalle(ajaxResponseText) {
            //alert(ajaxResponseText);
            var doc = objAjax.domParse(ajaxResponseText);
            omplirInspecciones_dveh(ajaxResponseText);
            omplirGridAccesorios(ajaxResponseText);
            omplirGridDocuments(ajaxResponseText)
           
        }
        
        function f_cargar_inspecciones(SORDEN, NINSPECCION) {
            document.getElementById("SORDEN").value = SORDEN;
            document.getElementById("NINSPECCION").value = NINSPECCION;
            objAjax.invokeAsyncCGI("modal_${pantalla}.do",callbackAjaxCargarInspecciones, "operation=cargar_inspecciones&SORDEN="+SORDEN+"&NINSPECCION="+ NINSPECCION,  this);
        }        
        
        function callbackAjaxCargarInspecciones (ajaxResponseText) {
            //alert(ajaxResponseText);
            var doc = objAjax.domParse(ajaxResponseText);
            omplirGridInspecciones(ajaxResponseText);
            callbackAjaxCargarDetalle(ajaxResponseText)
        }
        
        function omplirGridInspecciones(ajaxResponseText){
          
          var doc = objAjax.domParse(ajaxResponseText);              
          
          if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
           
            var tableM = document.getElementById("IRINSPECCIONES");
            var tbodyM = tableM.getElementsByTagName("tbody")[0];
            var trM = tbodyM.getElementsByTagName("tr");
            
            objLista.borrarFilasDeLista ("IRINSPECCIONES", "11", "<axis:alt f='${pantalla}' c='BORRAR' lit='1000254' />");
            var size = objDom.numeroDeTags(doc, "IRINSPECCIONES");
            
            for (var i = 0; i < size ; i++) {
                // Como hay resultados, borramos la fila vacia
                if (i==0) objLista.borrarFilaVacia(tbodyM, trM);
                // Obtenemos el estilo para la fila que insertaremos
                var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                // Creamos una nueva fila vacia y le damos el estilo obtenido
                var newtr = objLista.crearNuevaFila(rowstyle);
                // Creamos un array de columnas a añadir a la nueva fila del displayTag                
                var newtd = new Array(11);          
                //NINSPECCION,FINSPECCION,TESTADO,CRESULTADO,CREINSPECCION,HLLEGADA,HSALIDA,CCENTROINSPEC,CINSPDOMI,CPISTA
                
                // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando                    
                var NINSPECCION = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NINSPECCION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NINSPECCION"), i, 0) : "");
                var FINSPECCION = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FINSPECCION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FINSPECCION"), i, 0) : "");
                var TESTADO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TESTADO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TESTADO"), i, 0) : "");
                var TRESULTADO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TRESULTADO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRESULTADO"), i, 0) : "");
                var TREINSPECCION = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TREINSPECCION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TREINSPECCION"), i, 0) : "");
                var HLLEGADA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HLLEGADA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HLLEGADA"), i, 0) : "");
                var HSALIDA= ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HSALIDA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HSALIDA"), i, 0) : ""); 
                var CCENTROINSP= ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCENTROINSP")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCENTROINSP"), i, 0) : "");
                var TINSPDOMI= ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINSPDOMI")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINSPDOMI"), i, 0) : "");
                var TPISTA= ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPISTA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPISTA"), i, 0) : ""); 
                
                //Cargamos los valores del registro de la tabla
                var SORDEN = document.getElementById("SORDEN").value;                
                newtd[0] = objLista.addRadioButtonEnLista("radioNINSPECCION", "radioNINSPECCION_"+NINSPECCION , "javascript:f_cargar_detalle('" + SORDEN + "','" + NINSPECCION + "')");
                newtd[1] = objLista.addTextoEnLista(NINSPECCION);                
                newtd[2] = objLista.addTextoEnLista(objUtiles.formateaTimeStamp2(FINSPECCION));
                newtd[3] = objLista.addTextoEnLista(TESTADO);
                newtd[4] = objLista.addTextoEnLista(TRESULTADO);
                newtd[5] = objLista.addTextoEnLista(TREINSPECCION);
                newtd[6] = objLista.addTextoEnLista(HLLEGADA);
                newtd[7] = objLista.addTextoEnLista(HSALIDA);
                newtd[8] = objLista.addTextoEnLista(CCENTROINSP);
                newtd[9] = objLista.addTextoEnLista(TINSPDOMI);
                newtd[10] = objLista.addTextoEnLista(TPISTA);
                
                // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                objLista.addNuevaFila(newtd, newtr, tbodyM);
                
                if (size==1 && !objUtiles.estaVacio(document.getElementById("NINSPECCION").value)){
                    document.getElementById("radioNINSPECCION").checked=true;
                    document.getElementById("radioNINSPECCION").disabled=true;  
                }
            } // Fi for            
            }
        }
        
        function omplirInspecciones_dveh(ajaxResponseText){
          
          var doc = objAjax.domParse(ajaxResponseText);              
          
          if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {           
            
            if ( objDom.numeroDeTags(doc, "IRINSPECCIONESDVEH")>0){
                var i=0;
                // Recuperamos los valores.              
                var CVERSION = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CVERSION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CVERSION"), i, 0) : "");
                var CPAISORIGEN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAISORIGEN")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAISORIGEN"), i, 0) : "");
                var NPMA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NPMA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPMA"), i, 0) : "");
                var CCILINDRAJE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCILINDRAJE")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCILINDRAJE"), i, 0) : "");
                var ANYO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("ANYO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("ANYO"), i, 0) : "");
                               
                document.getElementById("CVERSION").value = CVERSION; 
                document.getElementById("CPAISORIGEN").value = CPAISORIGEN;
                if (!objUtiles.estaVacio(NPMA)){NPMA= objNumero.formateaNumeroCero(NPMA,true);}
                document.getElementById("NPMA").value = NPMA;
                if (!objUtiles.estaVacio(CCILINDRAJE)){CCILINDRAJE= objNumero.formateaNumeroCero(CCILINDRAJE,true);}
                document.getElementById("CCILINDRAJE").value = CCILINDRAJE;
                if (!objUtiles.estaVacio(ANYO)){ANYO= objNumero.formateaNumero(ANYO,false);}
                document.getElementById("ANYO").value = ANYO;
                
                var NPLAZAS = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NPLAZAS")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPLAZAS"), i, 0) : "");
                var TSERVICIO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TSERVICIO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TSERVICIO"), i, 0) : "");
                var TBLINDADO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TBLINDADO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TBLINDADO"), i, 0) : "");
                var TCAMPERO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCAMPERO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCAMPERO"), i, 0) : "");
                var TGAMA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TGAMA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGAMA"), i, 0) : "");
                
                if (!objUtiles.estaVacio(NPLAZAS)){NPLAZAS= objNumero.formateaNumero(NPLAZAS,false);}
                document.getElementById("NPLAZAS").value = NPLAZAS; 
                document.getElementById("TSERVICIO").value = TSERVICIO;
                document.getElementById("TBLINDADO").value = TBLINDADO;
                document.getElementById("TCAMPERO").value = TCAMPERO;
                document.getElementById("TGAMA").value = TGAMA;
                 
                var TMATCABINA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TMATCABINA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TMATCABINA"), i, 0) : "");
                var TIVEHINUE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TIVEHINUE")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TIVEHINUE"), i, 0) : "");
                var CUSO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CUSO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CUSO"), i, 0) : "");
                var TCOLOR = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCOLOR")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCOLOR"), i, 0) : "");
                var NKILOMETRAJE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NKILOMETRAJE")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NKILOMETRAJE"), i, 0) : "");
                        
                document.getElementById("TMATCABINA").value = TMATCABINA; 
                document.getElementById("TIVEHINUE").value = TIVEHINUE;
                document.getElementById("CUSO").value = CUSO;
                document.getElementById("TCOLOR").value = TCOLOR;
                if (!objUtiles.estaVacio(NKILOMETRAJE)){NKILOMETRAJE= objNumero.formateaNumeroCero(NKILOMETRAJE,true);}
                document.getElementById("NKILOMETRAJE").value = NKILOMETRAJE;
                
                var TTIPMOTOR = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TTIPMOTOR")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTIPMOTOR"), i, 0) : "");              
                var NTARA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NTARA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NTARA"), i, 0) : "");
                var TPINTURA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPINTURA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPINTURA"), i, 0) : "");
                var TCAJA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCAJA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCAJA"), i, 0) : "");
                var TTRANSPORTE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TTRANSPORTE")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTRANSPORTE"), i, 0) : "");
                               
                document.getElementById("TTIPMOTOR").value = TTIPMOTOR;
                if (!objUtiles.estaVacio(NTARA)){NTARA=  objNumero.formateaNumeroCero(NTARA,true);}
                document.getElementById("NTARA").value =NTARA; 
                document.getElementById("TPINTURA").value = TPINTURA;
                document.getElementById("TCAJA").value = TCAJA;
                document.getElementById("TTRANSPORTE").value = TTRANSPORTE;
                
                var TTIPCARROCERIA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TTIPCARROCERIA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTIPCARROCERIA"), i, 0) : "");
                
                document.getElementById("TTIPCARROCERIA").value = TTIPCARROCERIA; 
            }else{
                cleanForm();
            }            
            }
        }
        
        function omplirGridAccesorios(ajaxResponseText){
          
          var doc = objAjax.domParse(ajaxResponseText);              
          
          if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
           
            var tableM = document.getElementById("IRINSPECCIONESACC");
            var tbodyM = tableM.getElementsByTagName("tbody")[0];
            var trM = tbodyM.getElementsByTagName("tr");
            
            objLista.borrarFilasDeLista ("IRINSPECCIONESACC", "5", "<axis:alt f='${pantalla}' c='BORRAR' lit='1000254' />");
            var size =  objDom.numeroDeTags(doc, "IRINSPECCIONESACC");       
            for (var i = 0; i < size ; i++) {
                // Como hay resultados, borramos la fila vacia               
                if (i==0) objLista.borrarFilaVacia(tbodyM, trM);
                // Obtenemos el estilo para la fila que insertaremos
                var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                // Creamos una nueva fila vacia y le damos el estilo obtenido
                var newtr = objLista.crearNuevaFila(rowstyle);
                // Creamos un array de columnas a añadir a la nueva fila del displayTag                
                var newtd = new Array(5);          
               
                // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando                    
                var TACCESORIO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TACCESORIO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TACCESORIO"), i, 0) : "");
                var TTIPACC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TTIPACC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTIPACC"), i, 0) : "");
                var TDESACC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TDESACC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TDESACC"), i, 0) : "");
                var IVALACC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("IVALACC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("IVALACC"), i, 0) : "");
                var CASEGURABLE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CASEGURABLE")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CASEGURABLE"), i, 0) : "");
                
                //Cargamos los valores del registro de la tabla
                newtd[0] = objLista.addTextoEnLista(TACCESORIO);  
                newtd[1] = objLista.addTextoEnLista(TTIPACC);                
                newtd[2] = objLista.addTextoEnLista(TDESACC);
                var checkasegurable=false;
                if (!objUtiles.estaVacio(CASEGURABLE) && CASEGURABLE == 1) checkasegurable =  true;
                newtd[3] = objLista.addCheckBoxEnLista("CASEGURABLE_"+i, CASEGURABLE, "",checkasegurable);
                newtd[3].style.width="10%";
                if (!objUtiles.estaVacio(IVALACC)){IVALACC= objNumero.formateaNumeroCero(IVALACC,true);}
                newtd[4] = objLista.addTextoEnLista(IVALACC);               
                // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                objLista.addNuevaFila(newtd, newtr, tbodyM);
                document.getElementById("CASEGURABLE_"+i).disabled = true;
            } // Fi for
            }
        }
        
        function omplirGridDocuments(ajaxResponseText){
          
          var doc = objAjax.domParse(ajaxResponseText);              
          
          if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
           
            var tableM = document.getElementById("IRINSPECCIONESDOC");
            var tbodyM = tableM.getElementsByTagName("tbody")[0];
            var trM = tbodyM.getElementsByTagName("tr");
            
            objLista.borrarFilasDeLista ("IRINSPECCIONESDOC", "7", "<axis:alt f='${pantalla}' c='BORRAR' lit='1000254' />");
            var size = objDom.numeroDeTags(doc, "IRINSPECCIONESDOC");       
            for (var i = 0; i < size ; i++) {
                // Como hay resultados, borramos la fila vacia               
                if (i==0) objLista.borrarFilaVacia(tbodyM, trM);
                // Obtenemos el estilo para la fila que insertaremos
                var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                // Creamos una nueva fila vacia y le damos el estilo obtenido
                var newtr = objLista.crearNuevaFila(rowstyle);
                // Creamos un array de columnas a añadir a la nueva fila del displayTag                
                var newtd = new Array(7);
                
                // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando                    
                var NDOCUME = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NDOCUME")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NDOCUME"), i, 0) : "");
                var CDOCUME = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CDOCUME")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CDOCUME"), i, 0) : "");
                var TGENERADO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TGENERADO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGENERADO"), i, 0) : "");
                var TOBLIGA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TOBLIGA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TOBLIGA"), i, 0) : "");
                var TADJUNTADO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TADJUNTADO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TADJUNTADO"), i, 0) : "");
                var IDDOCGEDOX = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("IDDOCGEDOX")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("IDDOCGEDOX"), i, 0) : "");
                
                //Cargamos los valores del registro de la tabla
                newtd[0] = objLista.addTextoEnLista(NDOCUME);  
                newtd[1] = objLista.addTextoEnLista(CDOCUME);                
                newtd[2] = objLista.addTextoEnLista(TGENERADO);
                newtd[3] = objLista.addTextoEnLista(TOBLIGA);
                newtd[4] = objLista.addTextoEnLista(TADJUNTADO);
                newtd[5] = objLista.addTextoEnLista(IDDOCGEDOX);                
                newtd[6] = objLista.addImagenEnLista("javascript:f_ver_doc('"+ IDDOCGEDOX +"')","0", "<axis:alt f="${pantalla}" c="BT_GEDOX" lit="9001357"/>", "<axis:alt f="${pantalla}" c="BT_GEDOX" lit="9001357"/>", "images/file.gif");
                               
                // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                objLista.addNuevaFila(newtd, newtr, tbodyM);                
            } // Fi for
            }
        }
        
        
        
        function cleanForm(){
            var inputs = document.getElementsByTagName("input");            
            for(var i=0;i<inputs.length;i++){
                if(inputs[i].type=='text'){
                    inputs[i].value = "";
                }
            }
        }
    </script>
    
  </head>
  
  <body onload="javascript:f_on_load();">
  
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="modalidad">
            <axis:visible f="${pantalla}" c="ETIQ_PANTALLA">
                <axis:alt f="${pantalla}" c="ETIQ_PANTALLA" lit="9905244"></axis:alt>
            </axis:visible>
        </c:param>
        <c:param name="formulario">
            <axis:visible f="${pantalla}" c="ETIQ_TITULO">
                <axis:alt f="${pantalla}" c="ETIQ_TITULO" lit="9905244"></axis:alt>
            </axis:visible>
        </c:param>
        <c:param name="form">${pantalla}</c:param>
    </c:import>
       
  <input type="hidden" id="SORDEN" name="SORDEN" value="<%=request.getAttribute("SORDEN") %>"/>
  <input type="hidden" id="NINSPECCION" name="NINSPECCION" value="<%=request.getAttribute("NINSPECCION") %>"/>
  <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td class="campocaja" align="left">
     <div class="separador">&nbsp;</div>
      <table class="seccion">
                            
                <tr>
                    <td class="campocaja">               
                        <img id="DSP_IRORDENES_parent" src="images/mes.gif"  onclick="objEstilos.toggleDisplay('DSP_IRORDENES', this)" style="cursor:pointer"/> 
                        <b><axis:alt f="axis" c="DSP_IRORDENES" lit="9905403"></axis:alt></b>
                        <hr class="titulo"></hr>
                    </td>
                </tr>
                <tr id="DSP_IRORDENES_children" style="display:none">           
                    <td class="campocaja" >                      
                        <div class="displayspace">
               
                                <c:set var="title0"><axis:alt f="${pantalla}" c="ORDEN" lit="500102"/></c:set>   <%-- ORDEN --%>
                                <c:set var="title1"><axis:alt f="${pantalla}" c="FSOLICITUD" lit="9001983"/></c:set>   <%-- FECHA SOLICITUD --%>                                 
                                <c:set var="title2"><axis:alt f="${pantalla}" c="TRIESGO" lit="1000465" /></c:set>  <%-- Tipo riesgo --%>              
                                <c:set var="title3"><axis:alt f="${pantalla}" c="TESTADO" lit="9905248"/></c:set>  <%-- ESTADO --%>
                                <c:set var="title4"><axis:alt f="${pantalla}" c="TCLASE" lit="9905249"/></c:set>  <%-- CLASE --%>
                                <c:set var="title5"><axis:alt f="${pantalla}" c="TPRODUCTO" lit="9902909"/></c:set>  <%-- PRODUCTO --%>
                                <c:set var="title6"><axis:alt f="${pantalla}" c="TTIPMAT" lit="9904875"/></c:set>   <%-- TIPO MATRICULA --%>
                                <c:set var="title7"><axis:alt f="${pantalla}" c="CMATRIC" lit="9904876"/></c:set>   <%-- MATRICULA --%>
                                <c:set var="title8"><axis:alt f="${pantalla}" c="CODMOTOR" lit="9904654"/></c:set>   <%-- MOTOR --%>             
                                <c:set var="title9"><axis:alt f="${pantalla}" c="CCHASIS" lit="9904655"/></c:set>   <%-- CHASIS --%>   
                                <c:set var="title10"><axis:alt f="${pantalla}" c="NBASTID" lit="9001061"/></c:set>   <%-- NUM BASTIDOR --%>
                                
                                <display:table name="${requestScope.IRORDENES}" id="IRORDENES" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >
                                        <div class="dspIcons">
                                            <input type="radio" id="radioSORDEN_${IRORDENES.SORDEN}" name="radioSORDEN"  
                                            <c:if test="${requestScope.SORDEN==IRORDENES.SORDEN}">checked disabled</c:if> value="${IRORDENES.SORDEN}" onclick="f_cargar_inspecciones(this.value,null)" />
                                        </div>
                                    </display:column>
                                    <display:column title="${title0}" sortable="false" sortProperty="IRORDENES.SORDEN" headerClass="sortable fixed"  media="html" autolink="false" >
                                        <div class="dspText">
                                            ${IRORDENES.SORDEN}
                                        </div>
                                    </display:column>                                       
                                    <display:column title="${title1}" sortable="false" sortProperty="IRORDENES.FSOLICITUD" headerClass="fixed sortable"  media="html" autolink="false" >
                                        <div class="dspDate"><fmt:formatDate value="${IRORDENES.FSOLICITUD}" pattern="dd/MM/yyyy"/></div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="false" sortProperty="IRORDENES.TRIESGO" headerClass="sortable fixed"  media="html" autolink="false" >
                                        <div class="dspText">
                                            ${IRORDENES.TRIESGO}
                                        </div>
                                    </display:column>
                                    <display:column title="${title3}" sortable="false" sortProperty="IRORDENES.TESTADO" headerClass="sortable fixed"  media="html" autolink="false" >
                                        <div class="dspText">
                                            ${IRORDENES.TESTADO}
                                        </div>
                                    </display:column>
                                    <display:column title="${title4}" sortable="false" sortProperty="IRORDENES.TCLASE" headerClass="sortable fixed"  media="html" autolink="false" >
                                        <div class="dspText">
                                            ${IRORDENES.TCLASE}
                                        </div>
                                    </display:column> 
                                    <display:column title="${title5}" sortable="false" sortProperty="IRORDENES.TPRODUCTO" headerClass="sortable fixed"  media="html" autolink="false" >
                                        <div class="dspText">
                                            ${IRORDENES.TPRODUCTO}
                                        </div>
                                    </display:column>
                                    <display:column title="${title6}" sortable="false" sortProperty="IRORDENES.TTIPMAT" headerClass="sortable fixed"  media="html" autolink="false" >
                                        <div class="dspText">
                                            ${IRORDENES.TTIPMAT}
                                        </div>
                                    </display:column>
                                    <display:column title="${title7}" sortable="false" sortProperty="IRORDENES.CMATRIC" headerClass="sortable fixed"  media="html" autolink="false" >
                                        <div class="dspText">
                                            ${IRORDENES.CMATRIC}
                                        </div>
                                    </display:column>
                                    <display:column title="${title8}" sortable="false" sortProperty="IRORDENES.CODMOTOR" headerClass="sortable fixed"  media="html" autolink="false" >
                                        <div class="dspText">
                                            ${IRORDENES.CODMOTOR}
                                        </div>
                                    </display:column>
                                    <display:column title="${title9}" sortable="false" sortProperty="IRORDENES.CCHASIS" headerClass="sortable fixed"  media="html" autolink="false" >
                                        <div class="dspText">
                                            ${IRORDENES.CCHASIS}
                                        </div>
                                    </display:column>
                                    <display:column title="${title10}" sortable="false" sortProperty="IRORDENES.NBASTID" headerClass="sortable fixed"  media="html" autolink="false" >
                                        <div class="dspText">
                                            ${IRORDENES.NBASTID}
                                        </div>
                                    </display:column>
                                </display:table>
                            </div>
                            <div class="separador">&nbsp;</div>
                </td></tr>                                
                
                <tr>
                    <td class="campocaja">               
                        <img id="DSP_IRINSPECCIONES_parent" src="images/mes.gif"  onclick="objEstilos.toggleDisplay('DSP_IRINSPECCIONES', this)" style="cursor:pointer"/> 
                        <b><axis:alt f="axis" c="DSP_IRINSPECCIONES" lit="9905404"></axis:alt></b>
                        <hr class="titulo"></hr>
                    </td>
                </tr>
                <tr id="DSP_IRINSPECCIONES_children" style="display:none">           
                    <td class="campocaja" >                      
                        <div class="displayspace">   
       
                             <c:set var="title0"><axis:alt f="${pantalla}" c="NINSPECCION" lit="9905246" /></c:set>
                             <c:set var="title1"><axis:alt f="${pantalla}" c="FINSPECCION" lit="9905251" /></c:set>                               
                             <c:set var="title2"><axis:alt f="${pantalla}" c="TESTADO" lit="101510" /></c:set>
                             <c:set var="title3"><axis:alt f="${pantalla}" c="TRESULTADO" lit="111046" /></c:set>                         
                             <c:set var="title4"><axis:alt f="${pantalla}" c="TREINSPECCION" lit="9905388" /></c:set>
                             <c:set var="title5"><axis:alt f="${pantalla}" c="HLLEGADA" lit="9905389" /></c:set>
                             <c:set var="title6"><axis:alt f="${pantalla}" c="HSALIDA" lit="9905390" /></c:set>
                             <c:set var="title7"><axis:alt f="${pantalla}" c="CCENTROINSP" lit="9905391" /></c:set>
                             <c:set var="title8"><axis:alt f="${pantalla}" c="TINSPDOMI" lit="9905392" /></c:set>
                             <c:set var="title9"><axis:alt f="${pantalla}" c="TPISTA" lit="9905393" /></c:set>                             
                                 
                             <display:table name="${requestScope.IRINSPECCIONES}" id="IRINSPECCIONES" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0">
                               <%@ include file="../include/displaytag.jsp"%>
                               <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" ></display:column>                           
                               <display:column title="${title0}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>                           
                               <display:column title="${title1}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>
                               <display:column title="${title2}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>                           
                               <display:column title="${title3}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>                           
                               <display:column title="${title4}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>                           
                               <display:column title="${title5}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>                           
                               <display:column title="${title6}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>                           
                               <display:column title="${title7}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>                           
                               <display:column title="${title8}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>                           
                               <display:column title="${title9}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>                    
                            </display:table>
                        </div>
                        <div class="separador" style="align:right">&nbsp;</div>
                        <table class="area" align="center" >                        
                        
                            <tr>
                                <td class="campocaja">               
                                    <img id="DSP_IRINSPECCIONESDVEH_parent" src="images/mes.gif"  onclick="objEstilos.toggleDisplay('DSP_IRINSPECCIONESDVEH', this)" style="cursor:pointer"/> 
                                    <b><axis:alt f="axis" c="DSP_IRINSPECCIONESDVEH" lit="1000199"></axis:alt></b>
                                    <hr class="titulo"></hr>
                                </td>
                            </tr>
                            
                            <tr id="DSP_IRINSPECCIONESDVEH_children" style="display:none">           
                                <td class="campocaja" >           
                                    
                                    <div style="scroll=no">                                    
                                      <table class="seccion" align="center" style="scroll=no">
                                       
                                        <tr>                                            
                                            <td class="titulocaja">
                                                <b><axis:alt c="CVERSION" f="${pantalla}" lit="9001146" /></b>
                                            </td>
                                            <td class="titulocaja" >
                                                <b><axis:alt c="CPAISORIGEN" f="${pantalla}" lit="100816"/></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="NPMA" f="${pantalla}" lit="9001063" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="CCILINDRAJE" f="${pantalla}" lit="9904725" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="ANYO" f="${pantalla}" lit="101606" /></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="CVERSION" lit="9001146"/>" 
                                              name="CVERSION" id="CVERSION"  <axis:atr f="${pantalla}" c="CVERSION" a="modificable=false&obligatorio=true"/> />
                                           </td>
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="CPAISORIGEN" lit="100816"/>"
                                              name="CPAISORIGEN" id="CPAISORIGEN"  <axis:atr f="${pantalla}" c="CPAISORIGEN" a="modificable=false&obligatorio=true"/> />
                                           </td>   
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="NPMA" lit="9001063"/>" 
                                              name="NPMA" id="NPMA"  <axis:atr f="${pantalla}" c="NPMA" a="modificable=false&obligatorio=true"/> />
                                           </td>   
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="CCILINDRAJE" lit="9904725"/>"
                                              name="CCILINDRAJE" id="CCILINDRAJE"  <axis:atr f="${pantalla}" c="CCILINDRAJE" a="modificable=false&obligatorio=true"/> />
                                           </td>   
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="ANYO" lit="101606"/>" 
                                              name="ANYO" id="ANYO"  <axis:atr f="${pantalla}" c="ANYO" a="modificable=false&obligatorio=true"/>  />
                                           </td> 
                                        </tr>
                                        
                                        <tr>                                            
                                            <td class="titulocaja">
                                                <b><axis:alt c="NPLAZAS" f="${pantalla}" lit="9001065" /></b>
                                            </td>
                                            <td class="titulocaja" >
                                                <b><axis:alt c="TSERVICIO" f="${pantalla}" lit="9904732"/></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="TBLINDADO" f="${pantalla}" lit="9905399" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="TCAMPERO" f="${pantalla}" lit="9904730" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="TGAMA" f="${pantalla}" lit="9905400" /></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="NPLAZAS" lit="9001065"/>" 
                                              name="NPLAZAS" id="NPLAZAS"  <axis:atr f="${pantalla}" c="NPLAZAS" a="modificable=false&obligatorio=true"/> />
                                           </td>
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="TSERVICIO" lit="9904732"/>"
                                              name="TSERVICIO" id="TSERVICIO"  <axis:atr f="${pantalla}" c="TSERVICIO" a="modificable=false&obligatorio=true"/> />
                                           </td>   
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="TBLINDADO" lit="9905399"/>" 
                                              name="TBLINDADO" id="TBLINDADO"  <axis:atr f="${pantalla}" c="TBLINDADO" a="modificable=false&obligatorio=true"/> />
                                           </td>   
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="TCAMPERO" lit="9904730"/>"
                                              name="TCAMPERO" id="TCAMPERO"  <axis:atr f="${pantalla}" c="TCAMPERO" a="modificable=false&obligatorio=true"/> />
                                           </td>   
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="TGAMA" lit="9905400"/>" 
                                              name="TGAMA" id="TGAMA"  <axis:atr f="${pantalla}" c="TGAMA" a="modificable=false&obligatorio=true"/> />
                                           </td> 
                                        </tr>
                                        
                                        <tr>                                            
                                            <td class="titulocaja">
                                                <b><axis:alt c="TMATCABINA" f="${pantalla}" lit="9905401" /></b>
                                            </td>
                                            <td class="titulocaja" >
                                                <b><axis:alt c="TIVEHINUE" f="${pantalla}" lit="9904722"/></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="CUSO" f="${pantalla}" lit="9904883" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="TCOLOR" f="${pantalla}" lit="9001062" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="NKILOMETRAJE" f="${pantalla}" lit="9904723" /></b>
                                            </td>
                                        </tr>                                        
                                        <tr>
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="TMATCABINA" lit="9905401"/>" 
                                              name="TMATCABINA" id="TMATCABINA"  <axis:atr f="${pantalla}" c="TMATCABINA" a="modificable=false&obligatorio=true"/> />
                                           </td>
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="TIVEHINUE" lit="9904722"/>"
                                              name="TIVEHINUE" id="TIVEHINUE"  <axis:atr f="${pantalla}" c="TIVEHINUE" a="modificable=false&obligatorio=true"/> />
                                           </td>   
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="CUSO" lit="9904883"/>" 
                                              name="CUSO" id="CUSO"  <axis:atr f="${pantalla}" c="CUSO" a="modificable=false&obligatorio=true"/> />
                                           </td>   
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="TCOLOR" lit="9001062"/>"
                                              name="TCOLOR" id="TCOLOR"  <axis:atr f="${pantalla}" c="TCOLOR" a="modificable=false&obligatorio=true"/> />
                                           </td>   
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="NKILOMETRAJE" lit="9904723"/>" 
                                              name="NKILOMETRAJE" id="NKILOMETRAJE"  <axis:atr f="${pantalla}" c="NKILOMETRAJE" a="modificable=false&obligatorio=true"/> />
                                           </td> 
                                        </tr>
                                        
                                        <tr>                                            
                                            <td class="titulocaja">
                                                <b><axis:alt c="TTIPMOTOR" f="${pantalla}" lit="9001054" /></b>
                                            </td>
                                            <td class="titulocaja" >
                                                <b><axis:alt c="NTARA" f="${pantalla}" lit="9001064"/></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="TPINTURA" f="${pantalla}" lit="9904728" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="TCAJA" f="${pantalla}" lit="9904729" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="TTRANSPORTE" f="${pantalla}" lit="9904733" /></b>
                                            </td>
                                        </tr>                                        
                                        <tr>
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="TTIPMOTOR" lit="9001054"/>" 
                                              name="TTIPMOTOR" id="TTIPMOTOR"  <axis:atr f="${pantalla}" c="TTIPMOTOR" a="modificable=false&obligatorio=true"/> />
                                           </td>
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="NTARA" lit="9001064"/>"
                                              name="NTARA" id="NTARA"  <axis:atr f="${pantalla}" c="NTARA" a="modificable=false&obligatorio=true"/> />
                                           </td>   
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="TPINTURA" lit="9904728"/>" 
                                              name="TPINTURA" id="TPINTURA"  <axis:atr f="${pantalla}" c="TPINTURA" a="modificable=false&obligatorio=true"/> />
                                           </td>   
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="TCAJA" lit="9904729"/>"
                                              name="TCAJA" id="TCAJA"  <axis:atr f="${pantalla}" c="TCAJA" a="modificable=false&obligatorio=true"/> />
                                           </td>   
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="TTRANSPORTE" lit="9904733"/>" 
                                              name="TTRANSPORTE" id="TTRANSPORTE"  <axis:atr f="${pantalla}" c="TTRANSPORTE" a="modificable=false&obligatorio=true"/> />
                                           </td> 
                                        </tr>                                        
                                         
                                        <tr>                                            
                                            <td class="titulocaja">
                                                <b><axis:alt c="TTIPCARROCERIA" f="${pantalla}" lit="9904731" /></b>
                                            </td>
                                            <td class="titulocaja"></td>
                                            <td class="titulocaja"></td>
                                            <td class="titulocaja"></td>
                                            <td class="titulocaja"></td>
                                        </tr>                                        
                                        <tr>
                                            <td class="campocaja">
                                              <input type="text"  class="campowidthinput campo campotexto" 
                                              title="<axis:alt f="${pantalla}" c="TTIPCARROCERIA" lit="9904731"/>" 
                                              name="TTIPCARROCERIA" id="TTIPCARROCERIA"  <axis:atr f="${pantalla}" c="TTIPCARROCERIA" a="modificable=false&obligatorio=true"/> />
                                           </td>
                                            <td class="campocaja"></td>   
                                            <td class="campocaja"></td>   
                                            <td class="campocaja"></td>   
                                            <td class="campocaja"></td> 
                                        </tr>
                                        
                                       </table>
                                 
                                    </div>
                                    <div class="separador" style="align:right">&nbsp;</div>
                            </td></tr>                        
                         
                            <tr>
                                <td class="campocaja">               
                                    <img id="DSP_IRINSPECCIONESACC_parent" src="images/mes.gif"  onclick="objEstilos.toggleDisplay('DSP_IRINSPECCIONESACC', this)" style="cursor:pointer"/> 
                                    <b><axis:alt f="axis" c="DSP_IRINSPECCIONESACC" lit="9001362"></axis:alt></b>
                                    <hr class="titulo"></hr>
                                </td>
                            </tr>
                            
                            <tr id="DSP_IRINSPECCIONESACC_children" style="display:none">           
                                <td class="campocaja" >           
                                    
                                    <div class="displayspace">
                                    
                                         <c:set var="title0"><axis:alt f="${pantalla}" c="TACCESORIO" lit="9001364" /></c:set>
                                         <c:set var="title1"><axis:alt f="${pantalla}" c="TTIPACC" lit="9001451" /></c:set>                               
                                         <c:set var="title2"><axis:alt f="${pantalla}" c="TDESACC" lit="9904757" /></c:set>
                                         <c:set var="title3"><axis:alt f="${pantalla}" c="TASEGURABLE" lit="9904752" /></c:set>
                                         <c:set var="title4"><axis:alt f="${pantalla}" c="IVALACC" lit="9001365" /></c:set>
                                             
                                         <display:table name="${requestScope.IRINSPECCIONESACC}" id="IRINSPECCIONESACC" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0">
                                           <%@ include file="../include/displaytag.jsp"%>
                                           <display:column title="${title0}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>
                                           <display:column title="${title1}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>                           
                                           <display:column title="${title2}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>
                                           <display:column title="${title3}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>                           
                                           <display:column title="${title4}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>
                                         </display:table>
                                        </div>
                                        <div class="separador" style="align:right">&nbsp;</div>
                            </td></tr>                            
                            
                            <tr>
                                <td class="campocaja">               
                                    <img id="DSP_IRINSPECCIONESDOC_parent" src="images/mes.gif"  onclick="objEstilos.toggleDisplay('DSP_IRINSPECCIONESDOC', this)" style="cursor:pointer"/> 
                                    <b><axis:alt f="axis" c="DSP_IRINSPECCIONESDOC" lit="9001358"></axis:alt></b>
                                    <hr class="titulo"></hr>
                                </td>
                            </tr>
                            
                            <tr id="DSP_IRINSPECCIONESDOC_children" style="display:none">           
                                <td class="campocaja" >           
                                    
                                    <div class="displayspace">
                                    
                                         <c:set var="title0"><axis:alt f="${pantalla}" c="NDOCUME" lit="9905397" /></c:set>
                                         <c:set var="title1"><axis:alt f="${pantalla}" c="CDOCUME" lit="9905398" /></c:set>                               
                                         <c:set var="title2"><axis:alt f="${pantalla}" c="TGENERADO" lit="107913" /></c:set>
                                         <c:set var="title3"><axis:alt f="${pantalla}" c="TOBLIGA" lit="112347" /></c:set>                         
                                         <c:set var="title4"><axis:alt f="${pantalla}" c="TADJUNTADO" lit="9901999" /></c:set>
                                         <c:set var="title5"><axis:alt f="${pantalla}" c="IDDOCGEDOX" lit="9001357" /></c:set> 
                                         <c:set var="title6"><axis:alt f="${pantalla}" c="BT_GEDOX" lit="1000116" /></c:set>
                                             
                                         <display:table name="${requestScope.IRINSPECCIONESDOC}" id="IRINSPECCIONESDOC" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0">
                                           <%@ include file="../include/displaytag.jsp"%>
                                           <display:column title="${title0}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>
                                           <display:column title="${title1}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>                           
                                           <display:column title="${title2}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>
                                           <display:column title="${title3}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>                           
                                           <display:column title="${title4}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>                           
                                           <display:column title="${title5}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>
                                           <display:column title="${title6}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" ></display:column>
                                         </display:table>
                                        </div>
                                        <div class="separador" style="align:right">&nbsp;</div>
                            </td></tr>
                            
                        </table>
                </td></tr>
      </table>
  </td></tr>
  </table>
  
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">${pantalla}</c:param>
        <c:param name="__botones">salir</c:param> 
    </c:import>
    
    <c:import url="../include/mensajes.jsp"/>
   
  </body>  
</html>