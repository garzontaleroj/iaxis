<%/* Revision:# bSseoBiXzLaWzskw7S/1HQ== # */%>
<%--
/**
*  Fichero: axissin008.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  
*  T?tulo: Modal modificar datos destinatarios LOCALIZACIONES 
*
*  Fecha: 23/02/2009
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>
    <c:set var="linea_trami" value="${__formdata.indexTramitacio}"/> <!-- ${LINEATRAM} -->
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<c:set var="nombrePantalla" value="localizaciones_modal"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axissin008" c="title" lit="151090"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() { 
        var val1 = "<%=request.getAttribute("OK")%>"; 
        var NSINIES = "${__formdata.NSINIES}"; 
        objDom.setValorPorId("NSINIES_O",NSINIES);
        var formdataPAIS = '${__formdata.CPAIS}';        
            if (val1=="OK"){
                parent.f_aceptar_axissin008(NSINIES); //TODO: Dato EJ. para volver a la pantalla
                this.f_but_cancelar();
            }
            
            if (objUtiles.estaVacio(objDom.getValorPorId("TLOCALI")  )){
                        f_verifica_textarea(1);
            }else{
                        f_verifica_textarea(0);
            }

 try{ 
        if (!objUtiles.estaVacio(formdataPAIS)){
            if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAIS))){
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + f_buscar_TPAIS(formdataPAIS)+"</b>");
            }
         }else {
        
          objDom.setValorHTMLPorId("TPAIS_span", "<b></b>");
          objDom.setValorPorId("CPOBLAC","");
          objDom.setValorPorId("CPROVIN","");
           
         }
         } catch (e) {}             

            f_cargar_propiedades_pantalla(); 
        }

	 function f_buscar_TPAIS(CPAIS) {
                <% try{
                if (((java.util.Map) request.getAttribute("__formdata"))!= null){
                java.util.Map formdata = ((java.util.Map) request.getAttribute("__formdata"));
                if (((java.util.Map) formdata.get("listvalores"))!= null){
                java.util.Map lista = (java.util.Map)formdata.get("listvalores");
                if (((java.util.ArrayList)lista.get("lstPaises"))!= null){
                java.util.ArrayList paises = (java.util.ArrayList)lista.get("lstPaises");
                for(int i = 0;i<paises.size();i++){
                java.util.HashMap paisHash = (java.util.HashMap)paises.get(i);
                %>
                pais = <%=paisHash.get("CPAIS")%>
                if (CPAIS == pais){
                return "<%=paisHash.get("TPAIS")%>"
                }
                <%}}}}
                
                }catch(Exception e){System.out.println("error funció JS : BUSCAR_TPAIS");}%> 
        }          
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("modal_axissin008.do", "guardar", document.${nombrePantalla}Form,"_self"); 
            }
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin008");
        }
        
        /*****************************************************************************************/
        /******************************* VALIDACIONES PANTALLA  **********************************/
        /*****************************************************************************************/
        
       function f_verifica_textarea(valor) {                
        // Habilita o deshabilita el TextArea segun si 
        // Se ha seleccionado o no, una clusula definida
        
        if (valor == 0){
            
            document.${nombrePantalla}Form.TLOCALI.readonly = false;
            objDom.setClassNamePorComponente(document.${nombrePantalla}Form.TLOCALI, "campowidthinput campo campotexto_ob");
            document.${nombrePantalla}Form.TLOCALI.focus();
         //   objDom.setVisibilidadPorId("DSP_DIRECCIONS_1", "visible");
            
            <axis:visible f="axissin008" c="DSP_DIRECCION"> 
            var elementos = document.getElementById("CSIGLAS");  
            elementos.style.display="";
            elementos.style.visibility="hidden";
            document.getElementById("CSIGLAS").style.display="none" ;
            
            elementos = document.getElementById("TNOMVIA");  
            elementos.style.display="";
            elementos.style.visibility="hidden";
            document.getElementById("TNOMVIA").style.display="none" ;
            
            elementos = document.getElementById("NNUMVIA");  
            elementos.style.display="";
            elementos.style.visibility="hidden";
            document.getElementById("NNUMVIA").style.display="none" ;
            
            elementos = document.getElementById("TCOMPLE");  
            elementos.style.display="";
            elementos.style.visibility="hidden";
            document.getElementById("TCOMPLE").style.display="none" ;
            </axis:visible>
            
            elementos = document.getElementById("CPOSTAL");  
            elementos.style.display="";
            elementos.style.visibility="hidden";
            document.getElementById("CPOSTAL").style.display="none" ;
            
            elementos = document.getElementById("CPAIS");  
            elementos.style.display="";
            elementos.style.visibility="hidden";
            document.getElementById("CPAIS").style.display="none" ;
            
            elementos = document.getElementById("CPROVIN");  
            elementos.style.display="";
            elementos.style.visibility="hidden";
            document.getElementById("CPROVIN").style.display="none" ;
            
            elementos = document.getElementById("CPOBLAC");  
            elementos.style.display="";
            elementos.style.visibility="hidden";
            document.getElementById("CPOBLAC").style.display="none" ;
                   
            
            objDom.setVisibilidadPorId("direccions", "hidden");
            //getElementById("p1").style.display="none"; 
            document.getElementById("direccions").style.display="none" ;
          //  objDom.setDisabledPorId("direccions","true");
            //document.${nombrePantalla}Form.direccions.style.display = "none";
        }else{ 
           
            objDom.setValorPorId("TLOCALI","") ;
            
            //document.getElementById("direccions").disabled = "false";
            objDom.setVisibilidadPorId("direccions", "visible");
            document.getElementById("direccions").style.display="block" ;

            <axis:visible f="axissin008" c="DSP_DIRECCION">       
            objDom.setVisibilidadPorId("CSIGLAS", "visible");
            document.getElementById("CSIGLAS").style.display="block" ;
            
            objDom.setVisibilidadPorId("TNOMVIA", "visible");
            document.getElementById("TNOMVIA").style.display="block" ;
            
            objDom.setVisibilidadPorId("NNUMVIA", "visible");
            document.getElementById("NNUMVIA").style.display="block" ;
            
            objDom.setVisibilidadPorId("TCOMPLE", "visible");
            document.getElementById("TCOMPLE").style.display="block" ;
            </axis:visible>
            
            objDom.setVisibilidadPorId("CPOSTAL", "visible");
            document.getElementById("CPOSTAL").style.display="block" ;
            
            objDom.setVisibilidadPorId("CPAIS", "visible");
            document.getElementById("CPAIS").style.display="block" ;
            
            objDom.setVisibilidadPorId("CPROVIN", "visible");
            document.getElementById("CPROVIN").style.display="block" ;
            
            objDom.setVisibilidadPorId("CPOBLAC", "visible");
            document.getElementById("CPOBLAC").style.display="block" ;

            document.${nombrePantalla}Form.TLOCALI.readonly = true;
            objDom.setClassNamePorComponente(document.${nombrePantalla}Form.TLOCALI, "campo campodisabled");
            objDom.setValorComponente(document.${nombrePantalla}Form.TLOCALI, "");
            
        }
        
        
        }   
        
        

         function callbackAjaxOnblurCPOSTAL(ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
				
					var ban = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0);
                    
                    if (ban == 2){
                        objUtiles.abrirModal("axisper041", "src", "modal_axisper041.do?operation=form&CPOSTAL=" + document.getElementById("CPOSTAL").value);
                    }
                    else
                    {
					
                    // País
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                        objDom.setVisibilidadPorId("findProvincia", "visible");
                    } else {
                       objDom.setValorPorId("CPAIS", "");
                       objDom.setVisibilidadPorId("findProvincia", "hidden");                    
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])) {
                        document.getElementById("TPAIS_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPAIS_span").innerHTML = "";
                    }
                    
                    // Provincia
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));           
                        objDom.setVisibilidadPorId("findPoblacion", "visible");
                    } else {
                        objDom.setValorPorId("CPROVIN", "");
                        objDom.setVisibilidadPorId("findPoblacion", "hidden");                    
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])) {
                        document.getElementById("TPROVIN_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPROVIN_span").innerHTML = "";
                    }
                    
                    // Población
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));           
                    } else {
                        objDom.setValorPorId("CPOBLAC", "");
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0])) {
                        document.getElementById("TPOBLAC_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPOBLAC_span").innerHTML = "";
                    }
					
					}
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
      
       function f_onchange_CPAIS() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            if (!objUtiles.estaVacio(CPAIS)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axissin017.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPAIS", "");
                objDom.setValorHTMLPorId("TPAIS_span", "");
                objDom.setVisibilidadPorId("findProvincia", "hidden");
                limpiaCampos("CPAIS");
            }
        }
        
        function f_onchange_CPOBLAC() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            var CPOBLAC=objDom.getValorPorId("CPOBLAC");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPOBLAC)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPOBLAC";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&CPOBLAC="+CPOBLAC
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axissin017.do", callbackajaxdireccion, qs, this)
            } else {
             /*   objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");*/
                limpiaCampos("CPROVIN");
            }
        }
        function f_onchange_CPROVIN() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPROVIN)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPROVIN";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axissin017.do", callbackajaxdireccion, qs, this)
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
            }
        }
        function callbackajaxdireccion (ajaxResponseText){
            try{ 
            
           // alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS", "");
                            limpiaCampos("CPAIS");
                        }else{
                            objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                            objDom.setVisibilidadPorId("findProvincia", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])){
                                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>");
                                
                                limpiaCampos("CPAIS");
                            }
                        }
                    }
                 
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS_RESIDENCIA")[0])) {
                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS", "");
                            limpiaCampos("CPAIS");
                        }else{
                            objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                            if (document.${nombrePantalla}Form.isNew.value == "true"){
                                objDom.setValorPorId("CNACIONALIDAD", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                            }
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISRESIDENCIA")[0])){
                                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                                  
                                    if (document.${nombrePantalla}Form.isNew.value == "true"){
                                     objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                                     }
                                
                                limpiaCampos("CPAIS_RESIDENCIA");
                            }
                        }
                    }
                    
                      if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CNACIONALIDAD")[0])) {
                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CNACIONALIDAD", "");
                            limpiaCampos("CNACIONALIDAD");
                        }else{
                            objDom.setValorPorId("CNACIONALIDAD", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CNACIONALIDAD"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISNACIONALIDAD")[0])){
                                 objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISNACIONALIDAD"), 0, 0) + "</b>");
                                limpiaCampos("CNACIONALIDAD");
                            }
                        }
                    }
                    
         
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPROVIN", "");
                            limpiaCampos("CPROVIN");
                        }else{
                            objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));
                            objDom.setVisibilidadPorId("findPoblacion", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPROVIN")[0])){
                                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>");
                                
                                limpiaCampos("CPROVIN");
                            }
                        }
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPOBLAC", "");
                        }else{
                            objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0]))
                                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>");
                        }
                    }
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }

        
        
        function limpiaCampos (CAMPO){
            if(objUtiles.utilEquals(CAMPO, "CPAIS")){
                //Limpio província
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
            }
            
            if(objUtiles.utilEquals(CAMPO, "CPAIS") ||
                objUtiles.utilEquals(CAMPO, "CPROVIN")){
                    //Limpio población
                    objDom.setValorPorId("CPOBLAC", "");
                    objDom.setValorHTMLPorId("TPOBLAC_span", "");
            }
        }

        /**************************************  RESTO FUNCIONES POBLACION *******************************/
        function f_onblur_CPOSTAL(CPOSTAL) {
            if (!objUtiles.estaVacio(CPOSTAL)){
				document.${nombrePantalla}Form.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axissin017.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
            }
        }
        
        
        
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION, CODIGO_CP){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION+"&TIPO=DATE&CODIGO_CP=" + CODIGO_CP);
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
            f_cerrar_axiscom001();
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
            if (CODIGO_CONSULTA == "LISTA_PAIS") {
                objDom.setValorPorId("CPAIS", CODIGO);
                objDom.setVisibilidadPorId("findProvincia", "visible");                
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPAIS");
            }
            else if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
                objDom.setValorPorId("CPROVIN", CODIGO);
                objDom.setVisibilidadPorId("findPoblacion", "visible");
                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPROVIN");
            }
            else if (CODIGO_CONSULTA == "LISTA_POBLACION") {
                objDom.setValorPorId("CPOBLAC", CODIGO);
                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
            }   
            else if (CODIGO_CONSULTA == "LISTA_EVENTOS") {
            try{
                objDom.setValorPorId("CEVENTO", CODIGO);
                objDom.setValorHTMLPorId("TEVENTO_span", "<b>" + TEXTO + "</b>");
                }catch(e){alert(e);}
            }
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }        
        
        function f_copiarDatosLocali(){
            var LOCALI = $("#COPILOCA").val();
            var cadena = LOCALI.split("-");
            var NLOCALI = cadena[0];
            var NSINIES = $("#NSINIES").val();
            var NTRAMIT = cadena[1];
            if (!objUtiles.estaVacio(LOCALI)){
                objAjax.invokeAsyncCGI('modal_axissin008.do', callback_AjaxCopiarDatosLocali, 'operation=ajax_getDatosLocali&NLOCALI=' + NLOCALI+
                "&NSINIES="+NSINIES+"&NTRAMIT="+NTRAMIT,
                this);
            }
        }
        
        /*function callbackAjaxCargarSubtipos(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);  
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("CSUBPRO"); 
                var cuantos = elementos.length;
                var CSUBPROCombo = document.getElementById("CSUBPRO");//document.miForm.CSUBPRO;
                objDom.borrarOpcionesDeCombo(CSUBPROCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisprf003" c="SELECC" lit="108341"/> - ',
                                       CSUBPROCombo, 0);
                for (i = 0; i < cuantos; i++) {
                     var CSUBPRO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CSUBPRO"), i, 0);
                     var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TATRIBU"), i, 0); 
                     objDom.addOpcionACombo(CSUBPRO, TITULO, CSUBPROCombo, i+1);
                }
            }// recarrega scroll pane
            var modo = "${__formdata.MODO}";
            if (modo = "modificar"){
                $("#CSUBPRO").val("${__formdata.CSUBPRO}")
            }
            $.reinitialiseScroll(); 
        } */
        
        function callback_AjaxCopiarDatosLocali(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("element");
                var cuantos = elementos.length;
                for (i = 0; i < cuantos; i++) {
                    if(doc.getElementsByTagName("CVIAVP")[i].childNodes.length>0){
                        var CVIAVP = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CVIAVP"), i, 0);
                    }
                    if(doc.getElementsByTagName("CLITVP")[i].childNodes.length>0){
                        var CLITVP = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CLITVP"), i, 0);
                    }
                    if(doc.getElementsByTagName("CBISVP")[i].childNodes.length>0){
                        var CBISVP = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CBISVP"), i, 0);
                    }
                    if(doc.getElementsByTagName("CORVP")[i].childNodes.length>0){
                        var CORVP = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CORVP"), i, 0);
                    }
                    if(doc.getElementsByTagName("NVIAADCO")[i].childNodes.length>0){
                        var NVIAADCO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NVIAADCO"), i, 0);
                    }
                    if(doc.getElementsByTagName("CLITCO")[i].childNodes.length>0){
                        var CLITCO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CLITCO"), i, 0);
                    }
                    if(doc.getElementsByTagName("CORCO")[i].childNodes.length>0){
                        var CORCO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CORCO"), i, 0);
                    }
                    if(doc.getElementsByTagName("NPLACACO")[i].childNodes.length>0){
                        var NPLACACO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPLACACO"), i, 0);
                    }
                    if(doc.getElementsByTagName("COR2CO")[i].childNodes.length>0){
                        var COR2CO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("COR2CO"), i, 0);
                    }
                    if(doc.getElementsByTagName("CDET1IA")[i].childNodes.length>0){
                        var CDET1IA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CDET1IA"), i, 0);
                    }
                    if(doc.getElementsByTagName("TNUM1IA")[i].childNodes.length>0){
                        var TNUM1IA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNUM1IA"), i, 0);
                    }
                    if(doc.getElementsByTagName("CDET2IA")[i].childNodes.length>0){
                        var CDET2IA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CDET2IA"), i, 0);
                    }
                    if(doc.getElementsByTagName("TNUM2IA")[i].childNodes.length>0){
                        var TNUM2IA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNUM2IA"), i, 0);
                    }
                    if(doc.getElementsByTagName("CDET3IA")[i].childNodes.length>0){
                        var CDET3IA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CDET3IA"), i, 0);
                    }
                    if(doc.getElementsByTagName("TNUM3IA")[i].childNodes.length>0){
                        var TNUM3IA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNUM3IA"), i, 0);
                    }
                    if(doc.getElementsByTagName("CSIGLAS")[i].childNodes.length>0){
                        var CSIGLAS = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CSIGLAS"), i, 0);
                    }
                    if(doc.getElementsByTagName("TNOMVIA")[i].childNodes.length>0){
                        var TNOMVIA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMVIA"), i, 0);
                    }
                    if(doc.getElementsByTagName("NNUMVIA")[i].childNodes.length>0){
                        var NNUMVIA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMVIA"), i, 0);
                    }
                    if(doc.getElementsByTagName("TCOMPLE")[i].childNodes.length>0){
                        var TCOMPLE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCOMPLE"), i, 0);
                    }
                    if(doc.getElementsByTagName("LOCALIDAD")[i].childNodes.length>0){
                        var LOCALIDAD = objDom.getValorNodoDelComponente(doc.getElementsByTagName("LOCALIDAD"), i, 0);
                    }
                    if(doc.getElementsByTagName("CPOSTAL")[i].childNodes.length>0){
                        var CPOSTAL = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOSTAL"), i, 0);
                    }
                    if(doc.getElementsByTagName("CPAIS")[i].childNodes.length>0){
                        var CPAIS = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), i, 0);
                    }
                    if(doc.getElementsByTagName("TPAIS")[i].childNodes.length>0){
                        var TPAIS = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), i, 0);
                    }
                    if(doc.getElementsByTagName("CPROVIN")[i].childNodes.length>0){
                        var CPROVIN = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), i, 0);
                    }
                    if(doc.getElementsByTagName("TPROVIN")[i].childNodes.length>0){
                        var TPROVIN = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), i, 0);
                    }
                    if(doc.getElementsByTagName("CPOBLAC")[i].childNodes.length>0){
                        var CPOBLAC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), i, 0);
                    }
                    if(doc.getElementsByTagName("TPOBLAC")[i].childNodes.length>0){
                        var TPOBLAC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), i, 0);
                    }
                }
            }
            
            $("#CVIAVP").val(CVIAVP);
            $("#CLITVP").val(CLITVP);
            $("#CBISVP").val(CBISVP);
            $("#CORVP").val(CORVP);
            $("#NVIAADCO").val(NVIAADCO);
            $("#CLITCO").val(CLITCO);
            $("#CORCO").val(CORCO);
            $("#NPLACACO").val(NPLACACO);
            $("#COR2CO").val(COR2CO);
            $("#CDET1IA").val(CDET1IA);
            $("#TNUM1IA").val(TNUM1IA);
            $("#CDET2IA").val(CDET2IA);
            $("#TNUM2IA").val(TNUM2IA);
            $("#CDET3IA").val(CDET3IA);
            $("#TNUM3IA").val(TNUM3IA);
            $("#CSIGLAS").val(CSIGLAS);
            $("#TNOMVIA").val(TNOMVIA);
            $("#TNUM1IA").val(TNUM1IA);
            $("#NNUMVIA").val(NNUMVIA);
            $("#TCOMPLE").val(TCOMPLE);
            $("#TNUM2IA").val(TNUM2IA);
            $("#TNUM3IA").val(TNUM3IA);
            $("#LOCALIDAD").val(LOCALIDAD);
            $("#CPOSTAL").val(CPOSTAL);
            $("#CPAIS").val(CPAIS);
            $("#TPAIS_span b").html(TPAIS);
            $("#CPROVIN").val(CPROVIN);
            $("#TPROVIN_span b").html(TPROVIN);
            $("#CPOBLAC").val(CPOBLAC);
            $("#TPOBLAC_span b").html(TPOBLAC);
        } 
        
        function f_val_longitud_campo(obj, len){
            var o = obj;
            if(obj.value.length > len) { 
                //alert('Maximum length exceeded: ' + len); 
                obj.value = obj.value.substr(0, len); 
                return false; 
            }
        }

		function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
        }
		
		function f_aceptar_axisper041 (CPAIS, TPAIS, CPROVIN, TPROVIN, CPOBLAC, TPOBLAC){
            f_cerrar_modal("axisper041");
            objDom.setValorPorId("CPAIS", CPAIS);
            objDom.setVisibilidadPorId("findProvincia", "visible");
            document.getElementById("TPAIS_span").innerHTML = "<b>" + TPAIS + "</b>";
            
            objDom.setValorPorId("CPROVIN", CPROVIN);           
            objDom.setVisibilidadPorId("findPoblacion", "visible");
            document.getElementById("TPROVIN_span").innerHTML = "<b>" + TPROVIN + "</b>";
            
            objDom.setValorPorId("CPOBLAC", CPOBLAC);     
            document.getElementById("TPOBLAC_span").innerHTML = "<b>" + TPOBLAC + "</b>";
                    
        }
		
		function f_aceptar_axisper042(CPOSTAL){
			f_cerrar_modal("axisper042");
			objDom.setValorPorId("CPOSTAL", CPOSTAL);
			document.${nombrePantalla}Form.CPOSTAL.focus();      
			objAjax.invokeAsyncCGI('modal_axissin017.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);   			
		}
				
		function f_abrir_axisper042 () {
			objUtiles.abrirModal("axisper042", "src", "modal_axisper042.do?operation=form");
		}
		function f_onclickCheckbox(thiss) {
            thiss.value =  ((thiss.checked)?1:0);
         }
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041" lit="9002274"/></c:param>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper042|<axis:alt c="axisper042_TITULO" f="axisper042" lit="9002274"/></c:param>
	</c:import>
	
    <form name="${nombrePantalla}Form" action="modal_axissin008.do" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="NSINIES" id="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMIT" id="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>
    <input type="hidden" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
    <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}"/>
    <input type="hidden" name="NLOCALI" value="${__formdata.NLOCALI}"/>
    <input type="hidden" name="subpantalla" value="${subpantalla}"/>
    <input type="hidden" name="seccion" value="${seccion}"/> 
    <input type="hidden" name="CMODO" id="CMODO" value="${__formdata.CMODO}" />      
           
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin008" c="titulo" lit="9000980"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin008" c="formulario" lit="9000980"/></c:param>
        <c:param name="form">axissin008</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
               
               <!-- Seccion Pantalla -->
               
               <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
             
                         <td class="titulocaja">
                            <b><axis:alt f="axissin016" c="NSINIES" lit="101298"/></b><!-- Tipus tramitacio -->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin016" c="TTIPTRA" lit="9001028"/></b><!-- Tipus tramitacio -->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin016" c="TTRAMIT" lit="100588"/></b><!-- Tipus tramit  -->
                        </td>                        
                        <td class="titulocaja">
                            <b><axis:alt f="axissin016" c="TTCAUSIN" lit="9000901"/></b><!-- Tipus dany  -->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin016" c="CINFORM" lit="9000905"/></b><!-- Tramitación informativa -->
                            
                        </td>                        
                    </tr>
                    
                    <tr>
                       <td class="campocaja">
                         <input type="text" name="NSINIES_O" id="NSINIES_O"  class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="NSINIES" a="modificable=false"/> />
                            
                        </td>
                        <td class="campocaja">
                         <input type="text" name="TTIPTRA" value="${sessionScope.tramitaciones_min[linea_trami].TTIPTRA}" class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin016" c="TTIPTRA" a="modificable=false"/> />
                            
                        </td>
                        <td class="campocaja">
                         <input type="text" name="TTRAMIT" value="${sessionScope.tramitaciones_min[linea_trami].TTRAMIT}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin011" c="TTRAMIT" a="modificable=false"/> />
                            
                        </td>                        
                        <td class="campocaja">
                            <input type="text" name="TTCAUSIN" value="${sessionScope.tramitaciones_min[linea_trami].TTCAUSIN}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin011" c="TTCAUSIN" a="modificable=false"/> />
                        </td>
                        <td class="campocaja" align="left">
                        <input type="checkbox" disabled  id="CINFORM" name="CINFORM" <axis:atr f="axissin011" c="CINFORM" a="modificable=false"/> value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}" 
                        <c:if test="${sessionScope.tramitaciones_min[linea_trami].CINFORM == '1'}">checked</c:if> >
                        </td>                        
                        

                    </tr>
                    
                    
                    <tr>
                    <td class="titulocaja">
                            <b><axis:alt f="axissin008" c="TESTTRA" lit="100587"/></b><!-- Estado -->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin008" c="TSUBTRA" lit="9000852"/></b><!--Subestado -->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin008" c="TUNITRA" lit="9000900"/></b><!-- Unidad tramitacion -->
                        </td>
                        <td class="titulocaja">
                            <b><axis:alt f="axissin008" c="TTRAMITAD" lit="140769"/></b><!-- Tramitador -->
                        </td>
 
                        <td class="titulocaja">
                            
                        </td>
                    </tr>
                    <tr>
                    <td class="campocaja">
                            <input type="text" name="TESTTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin008" c="TESTTRA" a="modificable=false"/> />
                        </td>
                        <td class="campocaja">
                            <input type="text" name="TSUBTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin008" c="TSUBTRA" a="modificable=false"/> />                        
                        </td>                          
                        <td class="campocaja">
                            <input type="text" name="TUNITRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TUNITRA}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin008" c="TUNITRA" a="modificable=false"/> />
                        
                            
                        </td>
                        <td class="campocaja">
                           <input type="text" name="TTRAMITAD" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin008" c="TTRAMITAD" a="modificable=false"/> />
                        </td>

                                          
                        <td class="campocaja">
                             
                        </td>
                    </tr>
                    
                    
                </table>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                    <!-- Zona Ocurrencia --> 
                    <tr>
                                <!-- Zona Ocurrencia -->
                                
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin008" c="ZOCURRENCIA" lit="110492" /></b>
                                </td>
                            </tr>
                            <tr>
                                <!-- Lugar Ocurrencia -->
                                 
                                 <td colspan="5">
                                        <table class="area" align="center">
                                            <tr>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                            </tr>
                                            <!-- Inicio Seccion -->
                                            <tr>
                                            <axis:ocultar f="axissin008" c="radioLocaliza" dejarHueco="false">
                                                <td class="titulocaja" colspan="4">
                                                   <input value="0" type="radio"  id="radioLocaliza" name="radioLocaliza" onclick="f_verifica_textarea(this.value);" <c:if test="${!empty __formdata.TLOCALI}">checked</c:if>/>
                                                   <b><axis:alt f="axissin008" c="radioLocaliza" lit="100588" /></b> 
                                                </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                            <td colspan="4">
                                            <table id="textTlocali">
                                            <tr>
                                            <axis:ocultar f="axissin008" c="TLOCALI" dejarHueco="false">
                                               <td colspan="4" style="width:100%;" class="campocaja">
                                                    <textarea class="campowidthinput campo campotexto_ob" style="width:100%;" name="TLOCALI" id="TLOCALI" onkeyup="f_val_longitud_campo(this, 100)">${__formdata.TLOCALI}</textarea>
                                                </td>
                                                </axis:ocultar>
                                            </tr>
                                             </table>
                                            </div>
                                            </td>
                                            </tr>
                                            <tr>
                                            <axis:ocultar f="axissin008" c="radioLocaliza" dejarHueco="false">
                                                <td class="titulocaja" colspan="4">
                                                    <input value="1" type="radio" id="radioLocaliza" name="radioLocaliza" onclick="f_verifica_textarea(this.value);"  <c:if test="${empty __formdata.TLOCALI}">checked</c:if>/>
                                                    <b><axis:alt f="axissin008" c="TLOCALI" lit="9000914" /></b>
                                                </td>
                                                 </axis:ocultar>
                                            </tr>
                                            <tr>
                                            <axis:ocultar f="axissin008" c="COPILOCA" dejarHueco="false">
                                                <td class="titulocaja" colspan="4" style="padding-top:10px">
                                                   <b><axis:alt f="axissin008" c="copiaLocaliza" lit="9905537" /></b> 
                                                </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                            <axis:ocultar f="axissin008" c="COPILOCA" dejarHueco="false">
                                                <td class="titulocaja" colspan="4">
                                                   <select name="COPILOCA" id="COPILOCA" size="1" class="campowidthselect campo campotexto" 
                                                           onchange="f_copiarDatosLocali()"
                                                    <axis:atr f="axissin008" c="COPILOCA" a="obligatorio=false"/>  title="<axis:alt f="axissin008" c="COPILOCA" lit="9905537" />">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin008" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LSTLOCALIZA}">
                                                            <option value = "${element.NLOCALI}-${element.NTRAMIT}" 
                                                            <c:if test="${element.NLOCALI == __formdata.NLOCALI}"> selected </c:if> />
                                                                ${element.TNOMVIA} - ${element.NNUMVIA} - ${element.TPOBLAC} - ${element.TPROVIN}      
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                            <td colspan="4">
                                            <table id="direccions">
                                            <tr>
                                                <th style="width:15%;height:0px"></th>
                                                <th style="width:10%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:10%;height:0px"></th>
                                            </tr>
                                            <axis:visible f="axissin008" c="DSP_DIRECCION"> 
                                            <axis:ocultar f="axissin008" c="CSIGLAS" dejarHueco="false">
                                            <tr>
                                                <!-- Tipo via -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin008" c="CSIGLAS" lit="110028" /></b>
                                                </td>
                                            </tr>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin008" c="CSIGLAS" dejarHueco="false">
                                            <tr>
                                                <!-- Tipo via -->
                                                <td class="campocaja">
                                                    <select name="CSIGLAS" id="CSIGLAS" size="1" class="campowidthselect campo campotexto" 
                                                    <axis:atr f="axissin008" c="CSIGLAS" a="obligatorio=true"/>  title="<axis:alt f="axissin008" c="CSIGLAS" lit="110028" />">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin008" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.listvalores.lstTipoVia}">
                                                            <option value = "${element.CSIGLAS}" 
                                                            <c:if test="${element.CSIGLAS == __formdata.CSIGLAS}"> selected </c:if> />
                                                                ${element.TDENOM} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            </axis:ocultar>
                                            
                                            <tr>
                                                <!-- Nombre -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin008" c="TNOMVIA" lit="110029" /></b>
                                                </td>
                                                <!-- Número -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin008" c="NNUMVIA" lit="800440" /></b>
                                                </td>
                                                <!--  Otros -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin008" c="TCOMPLE" lit="110031" /></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <!-- Nombre -->
                                                <td class="campocaja">
                                                    <input   type="text" class="campowidthinput campo campotexto_ob" id="TNOMVIA" name="TNOMVIA" size="15" 
                                                        <axis:atr f="axissin008" c="TNOMVIA" a="obligatorio=true"/> value="${__formdata.TNOMVIA}" onkeyup="f_val_longitud_campo(this, 200)"
                                                        title="<axis:alt f="axissin008" c="TNOMVIA" lit="110029" />"/>
                                                </td>
                                                <!-- Número -->
                                                <td class="campocaja">
                                                    <input   type="text" class="campowidthinput campo campotexto_ob" id="NNUMVIA" onkeyup="f_val_longitud_campo(this, 5)" name="NNUMVIA" size="15"  value="${__formdata.NNUMVIA}" style="width:50%;"/>
                                                </td>
                                                <!-- Otros -->
                                                <td class="campocaja" colspan="2">
                                                    <input    type="text" class="campowidthinput campo campotexto_ob"  id="TCOMPLE" name="TCOMPLE" 
                                                    value="${__formdata.TCOMPLE}"/>
                                                </td>
                                            </tr>
                                            </axis:visible>
                                            
                                             <%-- Direccion para colombia --%>
                                            <axis:visible f="axissin008" c="DSP_DIRECCIONCOL">  
                                            <tr>
                                               <td colspan ="6"> 
                                                <table>
                                                <tr>
                                                    <th style="width:19%;height:0px"></th>
                                                    <th style="width:15%;height:0px"></th>
                                                    <th style="width:17%;height:0px"></th>
                                                    <th style="width:17%;height:0px"></th>
                                                    <th style="width:17%;height:0px"></th>
                                                    <th style="width:15%;height:0px"></th>
                                                </tr>
                                                <tr>
                                                    <axis:visible  f="axissin008" c="CVIAVP">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin008" c="CVIAVP" lit="9902408"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                    <axis:visible  f="axissin008" c="TNOMVIA">
                                                    <td class="titulocaja" colspan="2">
                                                        <b><axis:alt f="axissin008" c="TNOMVIA" lit="9903010"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                    <axis:visible  f="axissin008" c="CLITVP">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin008" c="CLITVP" lit="9902409"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                    <axis:visible  f="axissin008" c="CBISVP">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin008" c="CBISVP" lit="9902410"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                    <axis:visible  f="axissin008" c="CORVP">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin008" c="CORVP" lit="9902411"/></b>
                                                    </td>
                                                    </axis:visible>                                                    
                                                </tr>
                                                <tr>    
                                                    <axis:visible  f="axissin008" c="CVIAVP">
                                                    <td class="campocaja" >
                                                    <select name="CVIAVP" id="CVIAVP" size="1" class="campowidthselect campo campotexto" style="width:80%;" 
                                                            <axis:atr f="axissin008" c="CSIGLAS" a="obligatorio=false"/> title="<axis:alt f="axissin008" c="CVIAVP" lit="9902408"/>">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin008" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstTipoVia}">
                                            									<option value = "${element.CSIGLAS}" 
                                            									<c:if test="${element.CSIGLAS == __formdata.CVIAVP}"> selected </c:if> />
                                                							${element.TDENOM} 
                                            									</option>
                                        										</c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible  f="axissin008" c="TNOMVIA">
                                                    <td class="campocaja" colspan="2">
                                                        <input   type="text" class="campowidthinput campo campotexto" id="TNOMVIA" name="TNOMVIA" size="15" 
                                                            <axis:atr f="axissin008" c="TNOMVIA" a="obligatorio=false"/> value="${__formdata.TNOMVIA}"
                                                            title="<axis:alt f="axissin008" c="TNOMVIA" lit="110029" />" maxlength="200"/>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible  f="axissin008" c="CLITVP">
                                                    <td class="campocaja">
                                                        <select name="CLITVP" id="CLITVP" size="1" class="campowidthselect campo campotexto" style="width:70%;"
                                                         <axis:atr f="axissin008" c="CLITVP" a="obligatorio=false"/> title="<axis:alt f="axissin008" c="CLITVP" lit="9902409"/>">
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin008" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCLITVP}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CLITVP}"> selected </c:if> >
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                    <axis:visible  f="axissin008" c="CBISVP">
                                                    <td class="campocaja">
                                                        <select name="CBISVP" id="CBISVP" size="1" class="campowidthselect campo campotexto" style="width:70%;">
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin008" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCBISVP}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CBISVP}"> selected </c:if> >
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                    <axis:visible  f="axissin008" c="CORVP">                                                    
                                                    <td class="campocaja">
                                                        <select name="CORVP" id="CORVP" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin008" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCORVP}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CORVP}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                </tr>
                                                <tr>
                                                    
                                                    
                                                    <axis:visible  f="axissin008" c="NVIAADCO">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin008" c="NVIAADCO" lit="9902414"/></b>
                                                    </td>
                                                    </axis:visible>                                                    
                                                    <axis:visible  f="axissin008" c="CLITCO">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin008" c="CLITCO" lit="9902409"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                    <axis:visible  f="axissin008" c="CORCO">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin008" c="CORCO" lit="9902411"/></b>
                                                    </td>
                                                     </axis:visible>
                                                    
                                                    <axis:visible  f="axissin008" c="NPLACACO">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin008" c="NPLACACO" lit="9902415"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible  f="axissin008" c="COR2CO">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin008" c="COR2CO" lit="9902411"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                    
                                                </tr>
                                                <tr>
                                                   
                                                    <axis:visible  f="axissin008" c="NVIAADCO">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NVIAADCO}" name="NVIAADCO" id="NVIAADCO" 
                                                           <axis:atr f="axissin008" c="NVIAADCO" a="obligatorio=false"/> onkeyup="f_val_longitud_campo(this, 5)" style="width:70%;" formato="entero" title="<axis:alt f="axissin008" c="NVIAADCO" lit="9902414"/>"/>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible  f="axissin008" c="CLITCO">
                                                    <td class="campocaja">
                                                        <select name="CLITCO" id="CLITCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin008" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCLITCO}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CLITCO}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible  f="axissin008" c="CORCO">
                                                    <td class="campocaja">
                                                        <select name="CORCO" id="CORCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin008" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCORCO}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CORCO}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible  f="axissin008" c="NPLACACO">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NPLACACO}" onkeyup="f_val_longitud_campo(this, 5)" name="NPLACACO" id="NPLACACO" 
                                                          <axis:atr f="axissin008" c="NPLACACO" a="obligatorio=false"/> style="width:70%;" formato="entero" title="<axis:alt f="axissin008" c="NPLACACO" lit="9902415"/>"/>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible  f="axissin008" c="COR2CO">
                                                    <td class="campocaja">
                                                        <select name="COR2CO" id="COR2CO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin008" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCOR2CO}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.COR2CO}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                </tr>
                                                <tr>
                                                
                                                    <axis:visible  f="axissin008" c="CDET1IA">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin008" c="CDET1IA" lit="9902417"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible  f="axissin008" c="TNUM1IA">
                                                    <td class="titulocaja" colspan="2">
                                                        <b><axis:alt f="axissin008" c="TNUM1IA" lit="9902418"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible  f="axissin008" c="CDET2IA">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin008" c="CDET2IA" lit="9902419"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible  f="axissin008" c="TNUM2IA">
                                                    <td class="titulocaja" colspan="2">
                                                        <b><axis:alt f="axissin008" c="TNUM2IA" lit="9902420"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                </tr>
                                                <tr>
                                                   <axis:visible  f="axissin008" c="CDET1IA">
                                                    <td class="campocaja">
                                                        <select name="CDET1IA" id="CDET1IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin008" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCDET}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CDET1IA}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible  f="axissin008" c="TNUM1IA">
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campowidthinput campo campotexto" onkeyup="f_val_longitud_campo(this, 100)" size="5" value="${__formdata.TNUM1IA}" name="TNUM1IA" id="TNUM1IA" 
                                                           style="width:90%;" maxlength="100"/>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible  f="axissin008" c="CDET2IA">
                                                    <td class="campocaja">
                                                        <select name="CDET2IA" id="CDET2IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin008" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCDET}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CDET2IA}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible  f="axissin008" c="TNUM2IA">
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campowidthinput campo campotexto" size="5" onkeyup="f_val_longitud_campo(this, 100)" value="${__formdata.TNUM2IA}" name="TNUM2IA" id="TNUM2IA" 
                                                           style="width:90%;" maxlength="100"/>
                                                    </td>
                                                    </axis:visible>                                                    
                                                </tr>
                                                <tr>
                                                   
                                                    <axis:visible  f="axissin008" c="CDET3IA">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin008" c="CDET3IA" lit="9902421"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible  f="axissin008" c="TNUM3IA">
                                                    <td class="titulocaja" colspan="2">
                                                        <b><axis:alt f="axissin008" c="TNUM3IA" lit="9902422"/></b>
                                                    </td>
                                                    </axis:visible>
                                                </tr>
                                                <tr>
                                                    <axis:visible  f="axissin008" c="CDET3IA">
                                                    <td class="campocaja">
                                                        <select name="CDET3IA" id="CDET3IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin008" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCDET}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CDET3IA}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible  f="axissin008" c="TNUM3IA">
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campowidthinput campo campotexto" onkeyup="f_val_longitud_campo(this, 100)" size="5" value="${__formdata.TNUM3IA}" name="TNUM3IA" id="TNUM3IA" 
                                                           style="width:90%;" maxlength="100"/>
                                                    </td>
                                                    </axis:visible>
                                                </tr>
                                                </table>
                                                </td>
                                                </tr>
                                            </axis:visible>
                                            <axis:visible f="axissin008" c="DSP_DIRECCIONCHI" >
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axissin008" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin008" c="CSIGLAS" lit="110028"/></b>
                                </td>
                                </axis:ocultar>
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin008" c="TNOMVIA" lit="110029"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin008" c="NNUMVIA" lit="9904598"/></b>
                                </td>                     
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axissin008" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CSIGLAS" id="CSIGLAS" size="1" class="campowidthselect campo campotexto" style="width:80%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin008" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstTipoVia}">
                                            <option value = "${element.CSIGLAS}" 
                                            <c:if test="${element.CSIGLAS == __formdata.CSIGLAS}"> selected </c:if> />
                                                ${element.TDENOM} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA" 
                                    style="width:95%;"/>
                                </td>
                                <td class="campocaja" colspan="3" >
                                    <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM1IA}" name="TNUM1IA" id="TNUM1IA" 
                                       style="width:15%;"  maxlength="100" onkeyup="f_val_longitud_campo(this, 100)"/>
                                    &nbsp;&nbsp;&nbsp;
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMVIA}" name="NNUMVIA" id="NNUMVIA" 
                                    style="width:15%;"/>
                                    &nbsp;&nbsp;&nbsp;
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TCOMPLE}" name="TCOMPLE" id="TCOMPLE" 
                                    style="width:15%;"/>
                                </td>                                
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axissin008" c="TNUM2IA" lit="9904595"/></b>
                                    </td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axissin008" c="TNUM3IA" lit="9904596"/></b>
                                    </td> 
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM2IA}" name="TNUM2IA" id="TNUM2IA" 
                                            style="width:90%;"  title="<axis:alt f="axissin008" c="TNUM2IA" lit="9904595"/>" maxlength="100" onkeyup="f_val_longitud_campo(this, 100)"/>
                                    </td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM3IA}" name="TNUM3IA" id="TNUM3IA" 
                                            style="width:90%;"  title="<axis:alt f="axissin008" c="TNUM3IA" lit="9904596"/>" maxlength="100" onkeyup="f_val_longitud_campo(this, 100)"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axissin008" c="LOCALIDAD" lit="9903353"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.LOCALIDAD}" name="LOCALIDAD" id="LOCALIDAD" 
                                            style="width:90%;"  title="<axis:alt f="axissin008" c="LOCALIDAD" lit="9903353"/>" />
                                    </td>
                                </tr>
                            </axis:visible>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <axis:ocultar c="CPOSTAL" f="axissin008" dejarHueco="false">
                                                <!-- C.P -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin008" c="CPOSTAL" lit="101081" /></b>
                                                </td>
                                                </axis:ocultar>
                                                <!-- Pais -->
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axissin008" c="CPAIS" lit="100816" /></b>
                                                </td>
                                                <!-- Provincia -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin008" c="CPROVIN" lit="100756" /></b>
                                                </td>
                                                <!--  Población -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin008" c="CPOBLAC" lit="100817" /></b>
                                                </td>
                                                <!--INI IAXIS-4961 EAD:13/08/2020  -->
                                                <axis:visible f="axissin008" c="CCONTABLE" >
	                                                <td class="titulocaja">
							                            <b><axis:alt f="axissin016" c="CCONTABLE" lit="89908070"/></b><!-- Contable localizacion -->
							                        </td>
						                        </axis:visible> 
						                        <!--FIN IAXIS-4961 EAD:13/08/2020  -->
                                            </tr>
                                            <tr>
                                                <axis:ocultar c="CPOSTAL" f="axissin008" dejarHueco="false">
                                                 <!-- C.P -->
                                               <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL" 
                                                    style="text-transform:uppercase;width:60%;" onblur="f_onblur_CPOSTAL(this.value)" style="width:50%;"
                                                     <axis:atr f="axissin008" c="CPOSTAL" a="obligatorio=true"/> title="<axis:alt f="axissin008" c="CPOSTAL" lit="101081"/>"/>
													 &nbsp;
													<axis:ocultar c="CPOSTALFIND" f="axissin008" dejarHueco="false">
														<img id="findCpostal" border="0" src="images/find.gif" onclick="f_abrir_axisper042();" style="cursor:pointer" alt=""/>
													</axis:ocultar>
                                                </td>   
                                                </axis:ocultar>
                                                <td class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" size="3" maxlength="3" onkeyup="f_val_longitud_campo(this, 3)" value="${__formdata.CPAIS}" name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS()" style="width:30%;" 
                                                    <axis:atr f="axissin008" c="CPAIS" a="obligatorio=true"/> title="<axis:alt f="axissin008" c="CPAIS" lit="100816"/>"/>&nbsp;<img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                                                    &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                                                </td>
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="3" onkeyup="f_val_longitud_campo(this, 3)" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;" 
                                                    <axis:atr f="axissin008" c="CPROVIN" a="obligatorio=true"/> title="<axis:alt f="axissin008" c="CPROVIN" lit="100756"/>"/>
                                                    &nbsp;<img id="findProvincia" style="visibility:${empty __formdata.CPAIS ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.${nombrePantalla}Form.CPAIS.value)"/>                
                                                    &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                                                </td>
                                                
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="5" onkeyup="f_val_longitud_campo(this, 5)" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;" 
                                                    <axis:atr f="axissin008" c="CPOBLAC" a="obligatorio=true"/> title="<axis:alt f="axissin008" c="CPOBLAC" lit="100817"/>"/>
                                                    &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.${nombrePantalla}Form.CPROVIN.value,document.${nombrePantalla}Form.CPOSTAL.value)"/>                
                                                    &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                                                </td>
 												 <!--INI IAXIS-4961 EAD:13/08/2020  -->
                                                <axis:visible f="axissin008" c="CCONTABLE" >
	                                                <td class="campocaja" align="left">
								                        <input type="checkbox" onclick="f_onclickCheckbox(this)"  id="CCONTABLE" name="CCONTABLE" value="${__formdata.CCONTABLE}" 
								                        <c:if test="${1 == __formdata.CCONTABLE}">checked</c:if> >
							                        </td>
						                        </axis:visible>
						                        <!--FIN IAXIS-4961 EAD:13/08/2020  -->
                                            </tr>
                                        </table>
                                        </div>
                                        </td>
                                        </tr>
                                        </table>
                                 </td>
                                 
                            </tr>
                              
                    </table>
               
               </td>
        </tr>
    </table>
     <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin008</c:param><c:param name="f">axissin008</c:param>
     <c:param name="__botones"><axis:visible c="BT_CANCELAR" f="axissin008">,cancelar</axis:visible><axis:visible c="BT_ACEPTAR" f="axissin008">,aceptar</axis:visible></c:param>
    </c:import>
    </form>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>