<%/* Revision:# XBH9b7fZ7DWIvECHhN4yGA== # */%>
<%
/**
*  Fichero: Axiscga004.jsp
*  @author < TCS_827 - ACL - 27/02/2019 Creación axiscga004 </a>
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="axis.util.Constantes" %>



<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!-- Código provisional, pendiente de modificar 25032011, se debe solucionar tema de capa flotante en modales -->
<style type="text/css">
.displayspaceGrandeSinBorde {
    width:100%;
    height: expression( this.scrollHeight > 219 ? "220px" : "auto" );  
    max-height:220px;
    overflow-x: hidden;
    overflow-y: auto;
}
</style>

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
    
    
    <script language="Javascript" type="text/javascript">
        var vcactivi = '';
        function f_onload() {
        	
            
            document.miForm.NPOLIZA.focus();
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
             
             vcactivi = '${__formdata['CACTIVI']}';
             
             f_cargar_cobjase();
             f_cargar_propiedades_pantalla();
             

        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axiscga004();
        }        
        
        function f_but_buscar() {
            
            if (objValidador.validaEntrada()){
            
                if (!objUtiles.estaVacio(document.getElementById("miListaId"))){
                    objUtiles.ejecutarFormulario("modal_axiscga004.do", "buscar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
                }else{
                    var CRAMO = null;
                    if (!objUtiles.estaVacio(document.getElementById("CRAMO")))
                        CRAMO = document.getElementById("CRAMO").value;
                    var CAGENTE = null;
                    if (!objUtiles.estaVacio(document.getElementById("CAGENTE")))
                        CAGENTE = document.getElementById("CAGENTE").value; 
                    var SPRODUC = null;
                    if (!objUtiles.estaVacio(document.getElementById("SPRODUC")))
                        SPRODUC = document.getElementById("SPRODUC").value; 

                    var CCOMPANI = null;
                    if (!objUtiles.estaVacio(document.getElementById("CCOMPANI")))
                        CCOMPANI = document.getElementById("CCOMPANI").value;                           
                    var NPOLIZA = null;
                    if (!objUtiles.estaVacio(document.getElementById("NPOLIZA")))
                        NPOLIZA = document.getElementById("NPOLIZA").value;  

                    var NCERT = null;
                    if (!objUtiles.estaVacio(document.getElementById("NCERT")))
                        NCERT = document.getElementById("NCERT").value;                        
                        
                    var CONTRATOINT = null;
                    if (!objUtiles.estaVacio(document.getElementById("CONTRATOINT")))
                        CONTRATOINT = document.getElementById("CONTRATOINT").value; 

                    var NSOLICI = null;
                    if (!objUtiles.estaVacio(document.getElementById("NSOLICI")))
                        NSOLICI = document.getElementById("NSOLICI").value;                              
                        
                    var NPOLINI = null;
                    if (!objUtiles.estaVacio(document.getElementById("NPOLINI")))
                        NPOLINI = document.getElementById("NPOLINI").value;  

                    var CPOLCIA = null;
                    if (!objUtiles.estaVacio(document.getElementById("CPOLCIA")))
                        CPOLCIA = document.getElementById("CPOLCIA").value;                        
                        
                    var CSITUAC = null;
                    if (!objUtiles.estaVacio(document.getElementById("CSITUAC")))
                        CSITUAC = document.getElementById("CSITUAC").value;       
                    
                    var CACTIVI = null;
                    if (!objUtiles.estaVacio(document.getElementById("CACTIVI")))
                        CACTIVI = document.getElementById("CACTIVI").value;        
                    
                    var CESTSUPL = null;
                    if (!objUtiles.estaVacio(document.getElementById("CESTSUPL")))
                        CESTSUPL = document.getElementById("CESTSUPL").value;    
                    
                    var CMATRICULA = null;
                    if (!objUtiles.estaVacio(document.getElementById("CMATRICULA")))
                        CMATRICULA = document.getElementById("CMATRICULA").value;    
                    
                    var CPOSTAL = null;
                    if (!objUtiles.estaVacio(document.getElementById("CPOSTAL")))
                        CPOSTAL = document.getElementById("CPOSTAL").value; 
                    
                    
                    var TDOMICI = null;
                    if (!objUtiles.estaVacio(document.getElementById("TDOMICI")))
                        TDOMICI = document.getElementById("TDOMICI").value; 
                        
                    var DESCRPCION  = null;
                    if (!objUtiles.estaVacio(document.getElementById("DESCRPCION")))
                        DESCRPCION = document.getElementById("DESCRPCION").value; 
                        
                    var NNUMIDE  = null;
                    if (!objUtiles.estaVacio(document.getElementById("NNUMIDE")))
                        NNUMIDE = document.getElementById("NNUMIDE").value; 
                    
                    var BUSCAR  = null;
                    if (!objUtiles.estaVacio(document.getElementById("BUSCAR")))
                        BUSCAR = document.getElementById("BUSCAR").value; 
                    
                    var SNIP  = null;
                    if (!objUtiles.estaVacio(document.getElementById("SNIP")))
                        SNIP = document.getElementById("SNIP").value;
                    
                    var TIPOPERSONA  = null;
                    if (!objUtiles.estaVacio(document.getElementById("TIPOPERSONA")))
                        TIPOPERSONA = document.getElementById("TIPOPERSONA").value;
                    
                    
                    parent.f_buscar_polizas(CRAMO,CAGENTE, SPRODUC,CCOMPANI,
                                            NPOLIZA,NCERT,CONTRATOINT,
                                            NSOLICI,NPOLINI,CPOLCIA,
                                            CSITUAC,CACTIVI,CESTSUPL,
                                            CMATRICULA,CPOSTAL,TDOMICI,
                                            DESCRPCION,NNUMIDE,BUSCAR,
                                            SNIP,TIPOPERSONA
                                            );
                }
            }
            
        }
         
        function f_but_aceptar (cual, cont) {
            var SSEGURO = "";      
            var NPOLIZA = "";      
            var SPRODUC = "";
            var NCERTIF = "";
            var i ="";            
          
            if (!objUtiles.estaVacio(cont))                    
            {
                NPOLIZA = document.getElementById("NPOLIZA_"+cont).value; 
                SPRODUC = document.getElementById("SPRODUC_"+cont).value;     
                NCERTIF = document.getElementById("NCERTIF_"+cont).value;     
            }
            
            //if (!objUtiles.estaVacio(cual) || !objUtiles.estaVacio(cont) )           
            if (!objUtiles.estaVacio(cual) || !objUtiles.estaVacio(cont) )           
                // Seleccionada por el hipervínculo
                SSEGURO = cual;                       
           
            else if (!objUtiles.estaVacio(document.miForm.checked_poliza)) {
                // Checkeada por el radio button
                i = objUtiles.f_GuardaCasillasChecked("checked_poliza");
                SSEGURO = document.getElementById("SSEGURO_"+i).value;
                NPOLIZA = document.getElementById("NPOLIZA_"+i).value; 
                SPRODUC = document.getElementById("SPRODUC_"+i).value;     
                //TURL = document.getElementById("TURL_"+i).value;
                //SSEGURO = objUtiles.f_GuardaCasillasChecked("checked_poliza"); 
            }             
           
           
            
            if (typeof SSEGURO == 'boolean' || (objUtiles.estaVacio (SSEGURO) && objUtiles.estaVacio(SPRODUC)) ) 
                alert(objJsMessages.jslit_selecciona_una_poliza);
            else
            {
                // Si hay una seleccionada, llamar al Action.
              if (!objUtiles.estaVacio(SSEGURO))                     
                    parent.f_aceptar_axiscga004(SSEGURO,NPOLIZA,NCERTIF);   
              else                                 
                  objAjax.invokeAsyncCGI("modal_axiscga004.do", callbackAjaxCargarURL, "operation=ajax_cargar_url&SPRODUC=" + SPRODUC+"&NPOLIZA = "+NPOLIZA, this, objJsMessages.jslit_cargando);                                  
             
            }
         }

        function f_cargar_ramos(){
            var ccompani = objDom.getValorPorId("CCOMPANI");
            if (!objUtiles.estaVacio(ccompani)) {
                if (document.getElementById('ramoProducto')!= null){
                    if (document.getElementById('ramoProducto').options[0]!=null){
                        document.getElementById('ramoProducto').value = document.getElementById('ramoProducto').options[0].value;
                    }    
                }
                
                if (document.getElementById('SPRODUC')!= null){
                    if (document.getElementById('SPRODUC').options[0]!=null){
                        document.getElementById('SPRODUC').value = document.getElementById('SPRODUC').options[0].value;
                    }
                }
            }
            objDom.setValorComponente(document.miForm.CRAMO, null);
            objDom.setValorComponente(document.miForm.TRAMO, null);
            objAjax.invokeAsyncCGI("modal_axiscga004.do", callbackAjaxCargarRamos, "operation=ajax_busqueda_ramos&CCOMPANI=" + ccompani, this, objJsMessages.jslit_cargando);
        }
        
        
        function f_cargar_productos(){
                CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                 if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                }else
                objDom.setValorComponente(document.miForm.CRAMO, null);
                url ="operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO);
                if (!objUtiles.estaVacio (objDom.getValorComponente(document.miForm.CCOMPANI)) ){
                    url += "&CCOMPANI=" + objDom.getValorComponente(document.miForm.CCOMPANI);
                }
                url += "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value;
                objAjax.invokeAsyncCGI("modal_axiscga004.do", callbackAjaxCargarProductos, url, this, objJsMessages.jslit_cargando);
        }      
        
        function callbackAjaxCargarRamos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var RAMOSCombo = document.miForm.ramoProducto;     
                    objDom.borrarOpcionesDeCombo(RAMOSCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="Axiscga004" c="COMBO_sv" lit="108341"/> - ', RAMOSCombo, 0);
                    var elementos = doc.getElementsByTagName("CRAMO");
                       for (i = 0; i < elementos.length; i++) {
                            var CRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRAMO"), i, 0);
                            var TRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRAMO"), i, 0);                                     
                            objDom.addOpcionACombo(CRAMO, TRAMO, RAMOSCombo, i+1);
                        }
                   f_cargar_productos();

                }
                
                $.reinitialiseScroll();
                
            }  
        
            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="Axiscga004" c="SPRODUC" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                   

                }
                f_cargar_actividades();
                amagarDisplay();
                
                $.reinitialiseScroll();
                
            }            

            function amagarDisplay(){
                try{
                	<axis:visible c="DSP_RESULTADO" f="Axiscga004">
                    var tbodyadded = objLista.obtenerBodyLista("miListaId");
                    var tradded = objLista.obtenerFilasBodyLista("miListaId", tbodyadded);
                    objLista.borrarFilasDeLista ("miListaId", "8", "<axis:alt f="Axiscga004" c="miListaId" lit='1000254' />");                    
                    var spanners = document.getElementsByTagName("span");
                    for(var i=0;i<spanners.length;i++) {
                        if (spanners[i].className == "gridpagebanner")
                            spanners[i].innerHTML = "";
                        if (spanners[i].className == "gridpagelinks")
                            spanners[i].innerHTML = ""; 
                    }
                    </axis:visible>
               } catch(e){alert(e);}
            }
            
            
        /*     *************************************  ACTUALIZAR COBJASE ***********************************        */  
           function f_onchangeproductos(valor){
                if (!objUtiles.estaVacio(valor)){
                    f_cargar_cobjase();
                }else {
                    f_cargar_actividades();
                }
                
           }
           
           function f_cargar_cobjase(){
            f_carga_dependencias();
            SPRODUC = document.miForm.SPRODUC.value;
                if (!objUtiles.estaVacio(SPRODUC)){
                    objAjax.invokeAsyncCGI("modal_axiscga004.do", callbackAjaxCargarCobjase, "operation=ajax_busqueda_cobjase&SPRODUC=" + SPRODUC , this, objJsMessages.jslit_cargando); 
                } 
           }

           function callbackAjaxCargarCobjase (ajaxResponseText){
           var doc=objAjax.domParse(ajaxResponseText);
             try{
                var COBJASE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("COBJASE"), 0, 0);
                
                //antes de marcar, desmarcamos todos posibles, recorriendo todos los radios con id de "CTIPRIESGO_*"
                var radios=document.getElementsByTagName("input");
                for (var iradios=0;iradios<radios.length;iradios++) {
                    if (radios[iradios].id!=undefined&&radios[iradios].id.indexOf("CTIPRIESGO_")==0) {
                        radios[iradios].checked=false;
                    }
                }
                document.miForm.COBJASE.value = COBJASE;  
                try {
                    document.getElementById("CTIPRIESGO_"+COBJASE).checked = true;
                }
                catch(eee) {
                }
                
                f_carga_dependencias();
                f_cargar_actividades();
              }catch(e){
              	
              	if(!objAppMensajes.existenErroresEnAplicacion(doc)){
              		var COBJASE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("COBJASE"), 0, 0);
               		document.miForm.COBJASE.value = COBJASE;         
                  f_carga_dependencias();
                  f_cargar_actividades();
              		
              	}
              	
              	
              	}
                
                // recarrega scroll pane
                $.reinitialiseScroll();
                
            }
        /*     *************************************  ACTUALIZAR COBJASE ***********************************        */   
            
        
            
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);

                var ctipage_busc = document.getElementById("CTIPAGE_BUSC").value; 
                var donde = document.miForm.DONDE.value;
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                
                    if (donde == 1){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                        objDom.setValorPorId("TAGENTE", NOMBREformateado);
                        }
                    else{
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_"+document.getElementById("CTIPAGE_BUSC").value, CAGENTEformateado);
                        objDom.setValorPorId("NOMBRE_"+document.getElementById("CTIPAGE_BUSC").value, NOMBREformateado);
                    }
                }
                
                // recarrega scroll pane
                $.reinitialiseScroll();
                
            }
            
            
            function f_actualizar_agente(){
             if (objValidador.validaEntrada()) {
                 objAjax.invokeAsyncCGI("modal_axiscga004.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE), this, objJsMessages.jslit_cargando);
              }  
            }   

            function callbackAjaxCargarAgente(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);

                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        objDom.setValorPorId("TAGENTE", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("TAGENTE",""); 
                        objDom.setValorPorId("CAGENTE","");
                    }
            
                
                }
                
                // recarrega scroll pane
                $.reinitialiseScroll();
             
            }  
            
          /*  function f_abrir_axisctr014() {
                
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
            }*/
            
            function f_abrir_axisctr014(tipage) {        
                document.miForm.CTIPAGE_BUSC.value = tipage;
                
                if (!objUtiles.estaVacio(document.miForm.CTIPAGE_BUSC.value)){
                	document.miForm.DONDE.value = 2;
                     objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=CTIPAGECON_"+tipage+"&CTIPAGE="+tipage);
                }else{
                 document.miForm.DONDE.value = 1;
                 objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
                } 
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014");
            }  
            /*
            function f_aceptar_axisctr014 (CAGENTE){
                objAjax.invokeAsyncCGI("modal_axiscga004.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
                f_cerrar_axisctr014();
            }*/
            
            function f_aceptar_axisctr014 (CAGENTE){
            //objDom.setValorPorId("CAGENTE", CAGENTE);            
            f_cerrar_axisctr014();
            if (!objUtiles.estaVacio(document.miForm.CTIPAGE_BUSC.value))
                objAjax.invokeAsyncCGI("modal_axiscga004.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            else
            {
                objAjax.invokeAsyncCGI("modal_axiscga004.do", callbackAjaxCambiarAgente2, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
        }
        
        function callbackAjaxCambiarAgente2(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
   
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE", CAGENTEformateado);
              //  objDom.setValorPorId("TAGENTE", NOMBREformateado);
            }
        }
            
            function mostrar(nombreCapa){             
              document.getElementById(nombreCapa).style.visibility="visible"; 
            } 
            
            function ocultar(nombreCapa){             
             document.getElementById(nombreCapa).style.visibility="hidden"; 
            } 

            function f_cargar_actividades(){
                if (document.getElementById('CACTIVI')!=null){
                    
                    //CCOMPANI
                    
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     if (!objUtiles.estaVacio (CRAMO) ){
                        objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    url ="operation=ajax_busqueda_actividades&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO);
                    if (!objUtiles.estaVacio (objDom.getValorComponente(document.miForm.CCOMPANI)) ){
                        url += "&CCOMPANI=" + objDom.getValorComponente(document.miForm.CCOMPANI);
                    }
                    url += "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value;
                    url += "&SPRODUC="+objDom.getValorComponente(document.miForm.SPRODUC);
                    objAjax.invokeAsyncCGI("modal_axiscga004.do", callbackAjaxCargarActividades, url, this, objJsMessages.jslit_cargando);
                }
            }  
            function callbackAjaxCargarActividades (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("OB_IAX_PRODACTIVIDADES");
                    var CACTIVICombo = document.miForm.CACTIVI;     
                    objDom.borrarOpcionesDeCombo(CACTIVICombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="Axiscga004" c="CSITUAC" lit="108341"/> - ', CACTIVICombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CACTIVI = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CACTIVI"), 0, 0);
                            var TITULO = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TACTIVI"), 0, 0);
                            objDom.addOpcionACombo(CACTIVI, TITULO, CACTIVICombo, i+1);
                        }
                }
                if (!objUtiles.estaVacio(vcactivi)) {
                    document.miForm.CACTIVI.value = vcactivi; 
                    vcactivi = '';
                }
                
                // recarrega scroll pane
                $.reinitialiseScroll();
                
            } 
            function callbackAjaxCargarURL(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);

                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("URL")[0]) && elementos[0]){
                        var TURL = objDom.getValorNodoDelComponente(doc.getElementsByTagName("URL"), 0, 0);                      
                        objDom.setValorPorId("TURL", TURL);          
                        objUtiles.ejecutarFormulario ('axis_axisopenurl.do?URL='+TURL+'&local=1', 'form', document.miForm, '_self', objJsMessages.jslit_cargando);                                                                        
                    }else{
                        objDom.setValorPorId("TURL","");       
                        alert(objJsMessages.jslit_selecciona_una_poliza);
                    }                
                }
                
                // recarrega scroll pane
                $.reinitialiseScroll();
                
            }  
            
        function f_refrescarDependencias(valor){
            document.miForm.COBJASE.value = valor;
           f_cargar_propiedades_pantalla();                  
        } 
           
        
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="Axiscga004" c="TITULO" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <input type="hidden" id="COBJASE" name="COBJASE" value="${__formdata.COBJASE}"/> 
            <input type="hidden" id="TURL" name="TURL" value="${__formdata.TURL}"/>
            
            <input type="hidden" name="CTIPAGE_BUSC" id="CTIPAGE_BUSC" value="${__formdata.CTIPAGE_BUSC}"/>
             <input type="hidden" name="DONDE" id="DONDE" value="${__formdata.DONDE}"/>  
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="Axiscga004" c="FORM" lit="1000188" /></c:param>
                <c:param name="producto"><axis:alt f="Axiscga004" c="PRODUCTO" lit="1000188"/></c:param>
                <c:param name="form">Axiscga004</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>                                        
                        <!--campos-->                        
                        <table class="seccion"> 
                            <axis:visible c="DSP_TITULO_POL" f="Axiscga004">
                            <tr>
                                <td class="titulo" colspan="10">          
                                    <img src="images/flecha.gif"/><b><axis:alt f="Axiscga004" c="titulo" lit="103593" /> </b>
                                </td> 
                            </tr>
                            </axis:visible>
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:14%;height:0px"></th>
                                <th style="width:16%;height:0px"></th>
                                <th style="width:18%;height:0px"></th>
                                <th style="width:14%;height:0px"></th>
                                <th style="width:9%;height:0px"></th>
                                <th style="width:9%;height:0px"></th>
                            </tr>
                                 <axis:ocultar f="Axiscga004" c="CAGENTE" dejarHueco="false"> <!-- TODO C -->
                                    <td class="titulocaja" colspan="3">
                                        <b><axis:alt f="Axiscga004" c="CAGENTE" lit="100584"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="Axiscga004" c="CAGENTE" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja" colspan="5">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE"  title="<axis:alt f="Axiscga004" c="CAGENTE" lit="100584"/>"  style="width:15%"
                                        title="<axis:alt f="Axiscga004" c="CAGENTE" lit="100584" />" onchange="f_actualizar_agente()"/>
                                        
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                        
                                        <input type="text" class="campo campotexto" value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE" title="<axis:alt f="Axiscga004" c="TAGENTE" lit="100584"/>" size="15" style="width:70%" readonly="true"
                                        title="<axis:alt f="Axiscga004" c="TAGENTE" lit="100584"/>"/>
                                    </td>
                                </axis:ocultar> 
                            </tr>
                            <tr></tr>
                            <tr>                               

                                <axis:ocultar f="Axiscga004" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="Axiscga004" c="CRAMO" lit="100784"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="Axiscga004" c="DESPRODUCTO" lit="100829" /></b>
                                </td>
                                <td>
                                    <table style="width:150px">
                                    <tr>                                
                                        <td class="titulocaja" style="width:100px">
                                            <b><axis:alt f="Axiscga004" c="POLIZA" lit="101273"/></b>
                                        </td>
                                        <axis:ocultar f="Axiscga004" c="NCERTIF" dejarHueco="false">
                                        <td class="titulocaja" style="width:40px">
                                            <b><axis:alt f="Axiscga004" c="NCERTIF" lit="9900942"></axis:alt></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    </table>
                                </td>
                                 <axis:ocultar f="Axiscga004" c="NSOLICI" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="Axiscga004" c="NSOLICI" lit="9000875"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                            </tr>  
                            <tr>
                                <axis:ocultar f="Axiscga004" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "ramoProducto" id="ramoProducto" style="width:200px;" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="Axiscga004" c="BLANCO" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                                <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>                            
                                <td class="campocaja" colspan="2"> 
                                    <select name = "SPRODUC" id ="SPRODUC" size="1" onchange="f_onchangeproductos(this.value)" class="campowidthselect campo campotexto">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="Axiscga004" c="SPRODUC" lit="108341" /> - </option>
                                        <c:forEach items="${productos}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    <table style="width:120px">
                                    <tr>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:70px" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" 
                                             title="<axis:alt f="Axiscga004" c="NUPOLIZA" lit="100836"/>"/>
                                        </td>                                
                                        <axis:ocultar f="Axiscga004" c="NCERTIF" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" style="width:40px" value="${__formdata.NCERT}" name="NCERT" id="NCERT" 
                                                 title="<axis:alt f="Axiscga004" c="NCERTIF" lit="101096"/>"/>
                                            </td>
                                        </axis:ocultar>                                    
                                    </tr>
                                    </table>
                                </td>
                                <axis:ocultar f="Axiscga004" c="CONTRATOINT" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CONTRATOINT}" name="CONTRATOINT" id="CONTRATOINT"
                                         title="<axis:alt f="Axiscga004" c="CONTRATOINT" lit="101096"/>"/>
                                    </td>
                                </axis:ocultar>
                                
                                <!-- ******************** SECCION 2 ********************** -->
                                <tr>
                                    <axis:ocultar f="Axiscga004" c="CPOLCIA">
                                        <td id="tit_CPOLCIA" class="titulocaja">
                                            <b id="label_CPOLCIA"><axis:alt f="Axiscga004" c="CPOLCIA" lit="9001766"></axis:alt></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="Axiscga004" c="NCONTRATO">
                                        <td id="tit_NCONTRATO" class="titulocaja">
                                            <b id="label_NCONTRATO"><axis:alt f="Axiscga004" c="NCONTRATO" lit="9000536"></axis:alt></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="Axiscga004" c="NPOLRELACIONADA" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="Axiscga004" c="NPOLRELACIONADA" lit="9909556"></axis:alt></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>                                
                                     <axis:ocultar f="Axiscga004" c="CPOLCIA">
                                        <td id="td_CPOLCIA" class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOLCIA}" name="CPOLCIA" id="CPOLCIA"
                                             title="<axis:alt f="Axiscga004" c="CPOLCIA" lit="9001766"/>"/>
                                        </td>
                                    </axis:ocultar>
                                   <axis:ocultar f="Axiscga004" c="NCONTRATO">
                                        <td id="td_NCONTRATO" class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NCONTRATO}" name="NCONTRATO" id="NCONTRATO"
                                             title="<axis:alt f="Axiscga004" c="NCONTRATO" lit="9000536"/>"/>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="Axiscga004" c="NPOLRELACIONADA" dejarHueco="false">
                                        <td class="campocaja">
                                             <input type="text" class="campowidthinput campo campotexto"  style="width:85%;" size="15" value="${__formdata.NPOLRELACIONADA}" name="NPOLRELACIONADA" id="NPOLRELACIONADA" 
                                         title="<axis:alt f="Axiscga004" c="NPOLRELACIONADA" lit="1000017"/>"/>
                                        </td>
                                    </axis:ocultar>
                                    
                                </tr>
                        </table>
                        <div class="separador">&nbsp;</div> 
                        
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:ocultar f="Axiscga004" c="NNUMIDE" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="Axiscga004" c="NNUMIDE" lit="105330"></axis:alt> </b>
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="Axiscga004" c="BUSCAR" dejarHueco="false">                                
                                <td class="titulocaja">
                                    <b><axis:alt f="Axiscga004" c="BUSCAR" lit="105940" /></b>
                                </td>
                                </axis:ocultar>
                                
                              <%--  <axis:ocultar f="Axiscga004" c="SNIP" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="Axiscga004" c="SNIP" lit="1000088" /></b>
                                </td>   
                                </axis:ocultar>  --%>
                                <axis:ocultar f="Axiscga004" c="TIPOPERSONA" dejarHueco="false">                                
                                <td class="titulocaja">
                                    <b><axis:alt f="Axiscga004" c="TOMADOR" lit="9905741" /></b>
                                    <input type="radio" id="TIPOPERSONA" name="TIPOPERSONA" value="1" <c:if test="${__formdata['TIPOPERSONA'] == '1' || empty __formdata['TIPOPERSONA']}">checked</c:if> />
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="Axiscga004" c="PAGADOR" dejarHueco="false"> 
                                    <td id="td_PAGADOR" class="titulocaja">
                                        <b><axis:alt f="Axiscga004" c="PAGADOR" lit="9903157" />?</b>
                                        <input type="radio" id="TIPOPERSONA" name="TIPOPERSONA" value="4" <c:if test="${__formdata['TIPOPERSONA'] == '4'}">checked</c:if> />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="Axiscga004" c="CONDUCTOR" dejarHueco="false"> 
                                    <td id="td_CONDUCTOR" class="titulocaja">
                                        <b><axis:alt f="Axiscga004" c="CONDUCTOR" lit="9001027" />?</b>
                                        <input type="radio" id="TIPOPERSONA" name="TIPOPERSONA" value="3" <c:if test="${__formdata['TIPOPERSONA'] == '3'}">checked</c:if> />
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata['NNUMIDE']}" name="NNUMIDE" id="NNUMIDE"/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['BUSCAR']}" name="BUSCAR" id="BUSCAR" size="15"/>
                                </td>
                               <td class="titulocaja">
                                    <b><axis:alt f="Axiscga004" c="TIPOPERSONA" lit="1000078" /></b>
                                    <input type="radio" id="TIPOPERSONA" name="TIPOPERSONA" value="2" <c:if test="${__formdata['TIPOPERSONA'] == '2'}">checked</c:if> />
                                </td>
                                
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>   
                        <!-- Bug 25177/133016 - 09/01/2013 - AMC   -->                        
                        <c:if test="${!empty LST_TIPRIESGO}">                      
                        <table>
                             <axis:visible c="DSP_DATOS_RIESGO_POL" f="Axiscga004">  
                            <tr>
                                <td class="titulo">                                                                        
                                    <img src="images/flecha.gif"/><b><axis:alt f="Axiscga004" c="DATOSRIESGO" lit="151604" /> </b>
                                </td> 
                            </tr>
                            </axis:visible>  
                            <tr>
                                <td>
                                    <table class="seccion">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        
                                        <tr>
                                        
                                             <c:forEach items="${LST_TIPRIESGO}" var="item" varStatus="status" >
                                                 <td class="titulocaja">
                                                    <b>${item.TATRIBU}?</b>
                                                    <input type="radio" id="CTIPRIESGO_${item.CATRIBU}" name="CTIPRIESGO" value="${item.CATRIBU}" onclick="f_refrescarDependencias('${item.CATRIBU}');" <c:if test="${__formdata['COBJASE'] == item.CATRIBU}">checked</c:if>/>
                                                </td>
                                             </c:forEach>
                                        </tr> 
                                       <!--   **********************   SECCION DEPENDENCIAS ************************  -->
                                        <tr>
                                            <axis:ocultar f="Axiscga004" c="CMATRICULA" dejarHueco="false"> 
                                                <td id="tit_CMATRICULA" class="titulocaja">
                                                    <b id="label_CMATRICULA"><axis:alt c="CMATRICULA" f="Axiscga004" lit="9001057"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="Axiscga004" c="CMOTOR" dejarHueco="false"> 
                                                <td id="tit_CMOTOR" class="titulocaja">
                                                    <b id="label_CMOTOR"><axis:alt c="CMOTOR" f="Axiscga004" lit="9904654"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="Axiscga004" c="CCHASIS" dejarHueco="false"> 
                                                <td id="tit_CCHASIS" class="titulocaja">
                                                    <b id="label_CCHASIS"><axis:alt c="CCHASIS" f="Axiscga004" lit="9904655"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="Axiscga004" c="NBASTID" dejarHueco="false"> 
                                                <td id="tit_NBASTID" class="titulocaja">
                                                    <b id="label_NBASTID"><axis:alt c="NBASTID" f="Axiscga004" lit="9001061"/></b>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="Axiscga004" c="CPOSTAL" dejarHueco="false"> 
                                                <td id="tit_CPOSTAL" class="titulocaja">
                                                    <b id="label_CPOSTAL"><axis:alt c="CPOSTAL" f="Axiscga004" lit="100823"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="Axiscga004" c="TDOMICI" dejarHueco="false"> 
                                                <td id="tit_TDOMICI" class="titulocaja" colspan="2">
                                                    <b id="label_TDOMICI"><axis:alt c="TDOMICI" f="Axiscga004" lit="9000914"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="Axiscga004" c="DESCRIPCION" dejarHueco="false"> 
                                                <td id="tit_DESCRIPCION" class="titulocaja" colspan="2">
                                                    <b id="label_DESCRIPCION"><axis:alt c="DESCRIPCION" f="Axiscga004" lit="100588"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="Axiscga004" c="CMATRICULA" dejarHueco="false">
                                                <td id="td_CMATRICULA" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="Axiscga004" c="CMATRICULA" a="modificable=true"/> size="15" value="${__formdata.CMATRICULA}" name="CMATRICULA" id="CMATRICULA"
                                                     title="<axis:alt f="Axiscga004" c="CMATRICULA" lit="9001057"/>"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="Axiscga004" c="CMOTOR" dejarHueco="false">
                                                <td id="td_CMOTOR" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="Axiscga004" c="CMOTOR" a="modificable=true"/> size="15" value="${__formdata.CMOTOR}" name="CMOTOR" id="CMOTOR"
                                                     title="<axis:alt f="Axiscga004" c="CMOTOR" lit="9904654"/>"
                                                     onchange="objValidador.f_validarCaracters(this,'%?*.;,:_-&$()!+°!”#$%&/()=¡Ñ\ ¡”#$%&/()=?¡*¨][_:;’¿+´}{-.,|°¬\~')"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="Axiscga004" c="CCHASIS" dejarHueco="false">
                                                <td id="td_CCHASIS" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="Axiscga004" c="CCHASIS" a="modificable=true"/> size="15" value="${__formdata.CCHASIS}" name="CCHASIS" id="CCHASIS"
                                                     title="<axis:alt f="Axiscga004" c="CCHASIS" lit="9904655"/>"
                                                     onchange="objValidador.f_validarCaracters(this,'%?*.;,:_-&$()!+°!”#$%&/()=¡Ñ\ ¡”#$%&/()=?¡*¨][_:;’¿+´}{-.,|°¬\~ÑOIQ')"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="Axiscga004" c="NBASTID" dejarHueco="false">
                                                <td id="td_NBASTID" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="Axiscga004" c="NBASTID" a="modificable=true"/> size="15" value="${__formdata.NBASTID}" name="NBASTID" id="NBASTID"
                                                     title="<axis:alt f="Axiscga004" c="NBASTID" lit="9001061"/>" onchange="objValidador.f_validarCaracters(this,'IOQÑ')"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="Axiscga004" c="CPOSTAL" dejarHueco="false">
                                                <td id="td_CPOSTAL" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="Axiscga004" c="CPOSTAL" a="modificable=true"/> size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL"
                                                     title="<axis:alt f="Axiscga004" c="CPOSTAL" lit="100823"/>"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="Axiscga004" c="TDOMICI" dejarHueco="false">
                                                <td id="td_TDOMICI" class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="Axiscga004" c="TDOMICI" a="modificable=true"/> size="15" value="${__formdata.TDOMICI}" name="TDOMICI" id="TDOMICI"
                                                     title="<axis:alt f="Axiscga004" c="TDOMICI" lit="9000914"/>"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="Axiscga004" c="DESCRIPCION" dejarHueco="false">
                                                <td id="td_DESCRIPCION" class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="Axiscga004" c="DESCRIPCION" a="modificable=true"/> size="15" value="${__formdata.DESCRPCION}" name="DESCRIPCION" id="DESCRIPCION"
                                                     title="<axis:alt f="Axiscga004" c="DESCRIPCION" lit="100588"/>"/>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </c:if>                        
                        <!-- Fin Bug 25177/133016 - 09/01/2013 - AMC   -->
                        <axis:visible c="DSP_RESULTADO" f="Axiscga004">
                               
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Pólizas -->
                            <c:set var="title1"><axis:alt f="Axiscga004" c="NUM_NPOLIZA" lit="800440"/></c:set>
                            <c:set var="title2"><axis:alt f="Axiscga004" c="NOMBRE" lit="105940"/></c:set>
                            <c:set var="title3"><axis:alt f="Axiscga004" c="SITUACION" lit="100874"/></c:set>
                            <c:set var="title4"><axis:alt f="Axiscga004" c="DESPRODUCTO" lit="100829"/></c:set>
                            <c:set var="title5"><axis:alt f="Axiscga004" c="CPOLCIA" lit="9001766"/></c:set>
                            <c:set var="title6"><axis:alt f="Axiscga004" c="CCOMPANI_MULTI" lit="9901223"/></c:set>
                            <c:set var="title7"><axis:alt f="Axiscga004" c="CMEDIAD_MULTI" lit="9901930"/></c:set>
                            <c:set var="title8"><axis:alt f="Axiscga004" c="CCOLABO_MULTI" lit="9901931"/></c:set>
                            <c:set var="title9"><axis:alt f="Axiscga004" c="CPLAN_MULTI" lit="9901932"/></c:set>
                            <c:set var="title10"><axis:alt f="Axiscga004" c="CLINEA_MULTI" lit="9001727"/></c:set>
                            <c:set var="title11"><axis:alt f="Axiscga004" c="CCOLECT_MULTI" lit="9001021"/></c:set>
                            <c:set var="title12"><axis:alt f="Axiscga004" c="NNUMIDE_MULTI_1" lit="105904"/></c:set>
                            <c:set var="title13"><axis:alt f="Axiscga004" c="FPAGO_MULTI" lit="101573"/></c:set>                            
                            <c:set var="title14"><axis:alt f="Axiscga004" c="CSINIES_MULTI" lit="100592"/></c:set>
                            <c:set var="title15"><axis:alt f="Axiscga004" c="FEMISIO_MULTI" lit="100877"/></c:set>
                            <c:set var="title16"><axis:alt f="Axiscga004" c="FEFECTO_MULTI" lit="100883"/></c:set>      
                            <c:set var="title20"><axis:alt f="Axiscga004" c="TAGENTE_MULTI" lit="100584"/></c:set>     
                            
                            <%int contador = 0;%>
                            
                           <div class="displayspaceGrandeSinBorde" style="height:200px">
                                <display:table name="${sessionScope.axisctr_listaPolizas}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" requestURI="modal_axiscga004.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <c:set var="contador"><%=contador%></c:set>                                      
                                    <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${miListaId['checkedPoliza']}">checked</c:if> type="radio" id="checked_poliza" name="checked_poliza" value="${contador}"/></div>                                        
                                    </display:column>  
                                    <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="headwidth10 sortable"  media="html" autolink="false" >    
                                        <div class="dspNumber">${miListaId['NPOLIZA']}<c:if test="${miListaId.MOSTRA_CERTIF == '1'}"> - ${miListaId['NCERTIF']}</c:if></div>
                                         <input type="hidden" id="SSEGURO_${contador}" name="SSEGURO_${contador}" value="${miListaId['SSEGURO']}"/>     
                                    </display:column>
                                    <axis:visible c="CPOLCIA" f="Axiscga004">
                                        <display:column title="${title5}" sortable="true" sortProperty="CPOLCIA" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}','${contador}')">${miListaId['CPOLCIA']}</a></div>
                                        </display:column>
                                    </axis:visible>
                                    <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}','${contador}')"><axis:visible f="Axiscga004" c="NNUMIDE_TOM" >${miListaId['NNUMIDE']} - </axis:visible>${miListaId['NOMBRE']}</a></div>
                                    </display:column>
                                    <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}','${contador}')">${miListaId['SITUACION']}</a></div>
                                    </display:column>
                                    <display:column title="${title4}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}','${contador}')">${miListaId['DESPRODUCTO']}</a></div>
                                        <input type="hidden" id="NPOLIZA_${contador}" name="NPOLIZA_${contador}" value="${miListaId['NPOLIZA']}"/>     
                                        <input type="hidden" id="SPRODUC_${contador}" name="SPRODUC_${contador}" value="${miListaId['SPRODUC']}"/>
                                        <input type="hidden" id="NCERTIF_${contador}" name="NCERTIF_${contador}" value="${miListaId['NCERTIF']}"/>
                                    </display:column>
                                    
                                    
                                    <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                    <display:column  class="seccion_informacion">
                                         <div id="SECCION_A${miListaId['NPOLIZA']}" class="seccion_informacion" style="height:160px;">
                                         <!-- INICIO SECCION -->
                                         <table class="area" id="ivan" align="center">
                                             <tr>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>                                                
                                             </tr>
                                             <tr>                                           
                                        			<axis:visible f="Axiscga004" c="CCOMPANI_MULTI">
                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                    <b>${title6}</b>
                                                </td>
                                                </axis:visible>
                                              </tr>
                                              <tr>                                                                            
                                                  <axis:visible f="Axiscga004" c="CCOMPANI_MULTI">
                                                   
                                                      <td colspan = "3" class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CCOMPANI_MULTI" name="CCOMPANI_MULTI"  style="width:100%"
                                                        value="${miListaId['CCOMPANI']}" readonly="readonly"/>                                                                                                              
                                                      </td>
                                                      </axis:visible>
                                               </tr>
                                               <tr>                                           
                                        	<axis:visible f="Axiscga004" c="TAGENTE_MULTI">
                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                    <b>${title20}</b>
                                                </td>
                                                </axis:visible>
                                              </tr>
                                              <tr>                                                                            
                                                  <axis:visible f="Axiscga004" c="TAGENTE_MULTI">
                                                   
                                                      <td colspan = "3" class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="TAGENTE_MULTI" name="TAGENTE_MULTI"  style="width:100%"
                                                        value="${miListaId['TAGENTE']}" readonly="readonly"/>                                                                                                              
                                                      </td>
                                                      </axis:visible>
                                               </tr>
                                             <tr>                                           
                                        			
                                                  <axis:visible f="Axiscga004" c="CMEDIAD_MULTI">
                                                
                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                    <b>${title7}</b>
                                                </td>
                                                 </axis:visible> 
                                                  <axis:visible f="Axiscga004" c="CCOLABO_MULTI">
                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                    <b>${title8}</b>
                                                </td>
                                                </axis:visible> 
                                                  <axis:visible f="Axiscga004" c="CPLAN_MULTI">
                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                    <b>${title9}</b>
                                                </td>
                                                </axis:visible> 
                                             </tr>                                        
                                             <tr>                                                                            
                                                 
                                                  <axis:visible f="Axiscga004" c="CMEDIAD_MULTI">
                                                
                                                      <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CMEDIAD_MULTI" name="CMEDIAD_MULTI"  style="width:90%"
                                                        value="${miListaId['CMEDIAD']}" readonly="readonly"/>                                                      
                                                      </td>
                                                  </axis:visible> 
                                                  <axis:visible f="Axiscga004" c="CCOLABO_MULTI">
                                          
                                                      <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CCOLABO_MULTI" name="CCOLABO_MULTI" style="width:90%"
                                                        value="${miListaId['CCOLABO']}" readonly="readonly"/>                                                      
                                                      </td>
                                                  </axis:visible> 
                                                  <axis:visible f="Axiscga004" c="CPLAN_MULTI">
                                        
                                                      <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CPLAN_MULTI" name="CPLAN_MULTI"  style="width:90%"
                                                        value="${miListaId['CPLAN']}" readonly="readonly"/>                                                      
                                                      </td>
                                                  </axis:visible> 
                                            </tr>    
                                            <tr>                                           
                                       					 <axis:visible f="Axiscga004" c="CLINEA_MULTI">
                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                    <b>${title10}</b>
                                                </td>
                                                 </axis:visible>   
                                                  <axis:visible f="Axiscga004" c="CCOLECT_MULTI">  
                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                    <b>${title11}</b>
                                                </td>
                                                 </axis:visible>                                                
                                                  <axis:visible f="Axiscga004" c="NNUMIDE_MULTI">   
                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                    <b>${title12}</b>
                                                </td>
                                                 </axis:visible> 
                                                  <axis:visible f="Axiscga004" c="FPAGO_MULTI"> 
                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                    <b>${title13}</b>
                                                </td>
                                                </axis:visible> 
                                             </tr>  
                                              <tr>                                                                            
                                                  <axis:visible f="Axiscga004" c="CLINEA_MULTI">
                                 
                                                      <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CLINEA_MULTI" name="CLINEA_MULTI"  style="width:100%"
                                                        value="${miListaId['CLINEA']}" readonly="readonly"/>                                                      
                                                      </td>
                                                  </axis:visible>   
                                                  <axis:visible f="Axiscga004" c="CCOLECT_MULTI">                                                   
                                                      <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CCOLECT_MULTI" name="CCOLECT_MULTI"  style="width:90%"
                                                        value="${miListaId['CCOLECT']}" readonly="readonly"/>                                                      
                                                      </td>
                                                  </axis:visible>                                                
                                                  <axis:visible f="Axiscga004" c="NNUMIDE_MULTI">                                                   
                                                      <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="NNUMIDE_MULTI" name="NNUMIDE_MULTI"  style="width:90%"
                                                        value="${miListaId['NNUMIDE']}" readonly="readonly"/>                                                      
                                                      </td>
                                                  </axis:visible> 
                                                  <axis:visible f="Axiscga004" c="FPAGO_MULTI"> 
                                                     <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="FPAGO_MULTI" name="FPAGO_MULTI" size="15" style="width:90%"
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" 
                                                                value="${miListaId['FPAGO']}"/>" readonly="readonly"/>
            
                                                    </td>
                                                  </axis:visible> 
                                            </tr> 
                                             <tr>                                           
                                     <axis:visible f="Axiscga004" c="CSINIES_MULTI">
                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                    <b>${title14}</b>
                                                </td>    
                                                 </axis:visible>  
                                                   <axis:visible f="Axiscga004" c="FEMISIO_MULTI">    
                                                   <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                    <b>${title15}</b>
                                                </td>   
                                                 </axis:visible> 
                                                   <axis:visible f="Axiscga004" c="FEFECTO_MULTI"> 
                                                   <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                    <b>${title16}</b>
                                                </td> 
                                                </axis:visible>   
                                             </tr> 
                                             <tr>
                                                 <axis:visible f="Axiscga004" c="CSINIES_MULTI">
                                      
                                                      <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="CSINIES_MULTI" name="CSINIES_MULTI"  style="width:100%"
                                                        value="${miListaId['CSINIES']}" readonly="readonly"/>                                                      
                                                      </td>
                                                  </axis:visible>  
                                                   <axis:visible f="Axiscga004" c="FEMISIO_MULTI"> 
                                                     <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="FEMISIO_MULTI" name="FEMISIO_MULTI" size="15" style="width:90%"
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" 
                                                                value="${miListaId['FEMISIO']}"/>" readonly="readonly"/>
            
                                                    </td>
                                                  </axis:visible> 
                                                   <axis:visible f="Axiscga004" c="FEFECTO_MULTI"> 
                                                     <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                        <input type="text" class="campo campotexto" id="FEFECTO_MULTI" name="FEFECTO_MULTI" size="15" style="width:90%"
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" 
                                                                value="${miListaId['FEFECTO']}"/>" readonly="readonly"/>
            
                                                    </td>
                                                  </axis:visible> 
                                             </tr>                                            
                                        </table>
                                        </div>

                                    </display:column>
                                    
                                    <%contador++;%>
                                    
                                </display:table>
                            </div>
                            
                            
                            </axis:visible>
                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">Axiscga004</c:param><c:param name="__botones">cancelar,buscar<axis:visible c="BT_ACEPTAR" f="Axiscga004">,aceptar</axis:visible></c:param></c:import>
     </form>
    <c:import url="../include/mensajes.jsp" />
</div>
    </body>
 
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('Axiscga004');
      </script >                   
    </c:if>    
    
</html>

