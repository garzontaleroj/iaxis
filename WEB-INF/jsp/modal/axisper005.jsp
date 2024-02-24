<%/* Revision:# CAmCGAHCzwJm+YtvmNCNTA== # */%>
<%-- 
*  Fichero: axisper005.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 31/01/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="stylesheet" href="styles/displaytag.css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
    <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
    <style type="text/css" id="page-css" ></style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        var nav4 = window.Event ? true : false;
		function ValidNum(evt) {
		    // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57
		    	var key = nav4 ? evt.which : evt.keyCode;
			    return (key <= 13 || (key >= 48 && key <= 57));
		}

		 function soloLetrasNumeros(e){
		       key = e.keyCode || e.which;
		       tecla = String.fromCharCode(key).toLowerCase();
		       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz1234567890";
		       especiales = "8-37-39-46";
		
		       tecla_especial = false;
		       for(var i in especiales){
		            if(key == especiales[i]){
		                tecla_especial = true;
		                break;
		            }
		        }
		
		        if(letras.indexOf(tecla)==-1 && !tecla_especial){
		            return false;
		        }
		 }
		
		
               
        function correoValido(email) {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
      } 
        
        
        function f_onload() {
			try{
	
	
         
       f_cargar_propiedades_pantalla(); 
       
       formdataPAIS = '${__formdata.CPAIS}';
       formdataNAC = '${__formdata.CNACIONALIDAD}';
       
          if (!objUtiles.estaVacio(document.getElementById("CPREFIXTF"))) {
              selectFlag(document.getElementById("CPREFIXTF").selectedIndex,'CPREFIXTF');
          }
          if (!objUtiles.estaVacio(document.getElementById("CPREFIXTM"))) {
              selectFlag(document.getElementById("CPREFIXTM").selectedIndex,'CPREFIXTM');
          }
         // Al recargar la pantalla se deben proteger los campos
         <c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID }" >
            if(document.miForm.TIDENTIcerca){
             document.miForm.TIDENTIcerca.disabled="true";
             document.miForm.CTIPIDEcerca.disabled="true";
             objDom.setVisibilidadPorId("find", "hidden");
          
               <c:if test="${empty __formdata.TIDENTIcerca || __formdata.TIDENTIcerca != 2}">
                document.miForm.FNACIMIcerca.readOnly="true";
                document.miForm.CSEXPERcerca.disabled="true";
                document.miForm.NNUMIDEcerca.readOnly="true";
                objDom.setVisibilidadPorId("popup_calendario_FNACIMIcerca", "hidden");
               </c:if>
             }
       </c:if>
       
      
       
	   if ( '${__formdata.SUFIJOPAIS}' != 1) { 
         if (!objUtiles.estaVacio(document.getElementById("CPREFIXTF"))){
	   selectFlag(document.miForm.CPREFIXTF.selectedIndex, 'CPREFIXTF');
	  }
	  if (!objUtiles.estaVacio(document.getElementById("CPREFIXTM"))){
	   selectFlag(document.miForm.CPREFIXTM.selectedIndex, 'CPREFIXTM');
	  }
	  if (!objUtiles.estaVacio(document.getElementById("CPREFIXF"))){
	   selectFlag(document.miForm.CPREFIXF.selectedIndex, 'CPREFIXF');
	  }
      };
       
       
         //BUG ini 24780
         //alert(${ __formdata.sin_provincias });
          <axis:visible c="SWRUT" f="axisper005">   
             var TDIGITOIDE=objDom.getValorPorId("TDIGITOIDE");
             var CTIPIDE=objDom.getValorPorId("CTIPIDE");
             if ((CTIPIDE == 42 || CTIPIDE == 41) && !objUtiles.estaVacio(CTIPIDE) &&  objUtiles.estaVacio(TDIGITOIDE)){
                        var NNUMIDE=objDom.getValorPorId("NNUMIDE");
                        var qs="operation=ajax_getdigito";
                        qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                        objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
                   }
            </axis:visible>
           //BUG FIN 24780
              //BUG 32649 INI
              <axis:visible c="SWRUT_COLM" f="axisper005">   
              objDom.setValorPorId("SWRUT","1");              
             var TDIGITOIDE=objDom.getValorPorId("TDIGITOIDE");
             var SWRUT=objDom.getValorPorId("SWRUT");
             
             var SWRUT_COLM=objDom.getValorPorId("SWRUT_COLM");
             objDom.setValorPorId("TDIGITOIDE_COLM",TDIGITOIDE);
             //alert('TDIGITOIDE antes '+TDIGITOIDE);
             objDom.setValorPorId("SWRUT_COLM",SWRUT);
             var CTIPIDE=objDom.getValorPorId("CTIPIDE");
             if ((CTIPIDE == 42 || CTIPIDE == 41) && !objUtiles.estaVacio(CTIPIDE) &&  objUtiles.estaVacio(TDIGITOIDE) ){
             	
                        var NNUMIDE=objDom.getValorPorId("NNUMIDE");
                        var qs="operation=ajax_getdigito";
                        qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                        objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
                         
                   }
                   
               objDom.setValorPorId("SWRUT","1"); 
            </axis:visible>
              //BUG 32649 FIN
       

         if (!objUtiles.estaVacio(formdataPAIS)){
            if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAIS))){
                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + f_buscar_TPAIS(formdataPAIS)+"</b>");
            }
         }
         
         formdataPAISDIRECC = '${__formdata.CPAIS_DIRECCION}';
         
         try{ 
        if (!objUtiles.estaVacio(formdataPAISDIRECC)){
            if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAISDIRECC))){
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + f_buscar_TPAIS(formdataPAISDIRECC)+"</b>");
                if(document.getElementById("findProvincia"))
                    objDom.setVisibilidadPorId("findProvincia", "visible");
            }
         }else {
        
          objDom.setValorHTMLPorId("TPAIS_span", "<b></b>");
          objDom.setValorPorId("CPOBLAC","");
          objDom.setValorPorId("CPROVIN","");
           
         }
         } catch (e) {}
         
         
        var cnacionalidad=objDom.getValorPorId("CNACIONALIDAD");  
        
        if (!objUtiles.estaVacio(cnacionalidad)){
        	
        	formdataNAC = document.getElementById("CNACIONALIDAD").value;
        	
                if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataNAC))){
                    objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + f_buscar_TPAIS(formdataNAC)+"</b>");
                }
           }
            
            var PSPERSONOUT = "${requestScope.PSPERSONOUT}"; 
            if (!objUtiles.estaVacio(PSPERSONOUT))
             parent.f_aceptar_axisper005(document.miForm.faceptar.value, PSPERSONOUT);
             
             }catch(e){}
               f_cargar_propiedades_pantalla();  
			   
			   
			formdataPAISDIRECC=objDom.getValorPorId("CPAIS_DIRECCION");
         
			 try{ 
					if (!objUtiles.estaVacio(formdataPAISDIRECC)){
							objDom.setValorHTMLPorId("TPAIS_span", "<b>" + f_buscar_TPAIS(formdataPAISDIRECC)+"</b>");
							objDom.setVisibilidadPorId("findProvincia", "visible");
					 }else {
					  objDom.setValorHTMLPorId("TPAIS_span", "<b></b>");
					  objDom.setValorPorId("CPOBLAC","");
					  objDom.setValorPorId("CPROVIN","");
					 }
			 } catch (e) {}
		 
        }
        
         
          function f_valida_fecha() {
          var ban=true;
        <axis:visible c="SWRUT" f="axisper005">   
         var from =  document.miForm.FNACIMI.value; 
                var numbers = from.split(/\//g); 
                var date = new Date(numbers[2], numbers[1]-1, numbers[0]);
                
               var today = new Date();
               var fecha = new Date(document.miForm.FNACIMI.value);
               if(date>today){
                    return false;
                }
                else{
                     return true;
                 }
            </axis:visible>    
         <axis:visible c="SWRUT_COLM" f="axisper005">   
         var from =  document.miForm.FNACIMI.value; 
                var numbers = from.split(/\//g); 
                var date = new Date(numbers[2], numbers[1]-1, numbers[0]);
                
               var today = new Date();
               var fecha = new Date(document.miForm.FNACIMI.value);
               if(date>today){
                    return false;
                }
                else{
                     return true;
                 }
            </axis:visible> 
            return ban;
        }
          
        function f_but_aceptar() {
               
             if(f_valida_fecha()) {
        
            if (objValidador.validaEntrada()) {
                try { document.miForm.TPAIS.value = document.getElementById("TPAIS_span").innerHTML;} catch (e) {}
                try { document.miForm.TPROVIN.value = document.getElementById("TPROVIN_span").innerHTML;} catch (e) {}
                try { document.miForm.TPOBLAC.value = document.getElementById("TPOBLAC_span").innerHTML;} catch (e) {}
                if(!correoValido($("#EMAIL").val())){
            		alert("Ingrese un correo valido.");
            	}else{
                  f_habilitar_campos();
                objUtiles.ejecutarFormulario("modal_axisper005.do?CPAISnomodi="+document.miForm.CPAIS.value, "grabarPersona", document.miForm, "_self", objJsMessages.jslit_cargando);   
            	}
            }
            }
            else{
           alert("<axis:alt f="axisper005" c="ALER_ERR" lit="120058"/>");
            }
        }
        
        
        
           function f_habilitar_campos(){
        
             var checkboxs = document.getElementsByTagName("input");//mirem els checkbox
            var selects = document.getElementsByTagName("select");
           // var checkboxs = document.getElementsByTagName("checkbox");
            for(var i=0;i<selects.length;i++){
                if(selects[i].attributes.length>0) {
                   var selectId = selects[i].getAttribute("id");
                     try{
                         if (document.getElementById(selectId).style.visibility != 'hidden' ){
                             if(selects[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(selectId))
                                    objDom.setDisabledPorId(selectId,false);
                         }
                     }catch(e){}
                }
            }
             for(var i=0;i<checkboxs.length;i++){
                if(checkboxs[i].attributes.length>0) {
                   var checkboxsId = checkboxs[i].getAttribute("id");
                    if(document.getElementsByTagName("input")[i].type == "checkbox"){
                    
                     try{
                         if (document.getElementById(checkboxsId).style.visibility != 'hidden' ){
                             if(checkboxs[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(checkboxsId))
                                    objDom.setDisabledPorId(checkboxsId,false);
                         }
                     }catch(e){}
                     }
                }
            }
            
        }
       
	 function f_buscar_TPAIS(CPAIS) {
                <% 
                if (((java.util.Map) request.getAttribute("__formdata"))!= null){
                java.util.Map formdata = ((java.util.Map) request.getAttribute("__formdata"));
                if (((java.util.Map) formdata.get("listValores"))!= null){
                java.util.Map lista = (java.util.Map)formdata.get("listValores");
                if (((java.util.ArrayList)lista.get("lstPaises"))!= null){
                java.util.ArrayList paises = (java.util.ArrayList)lista.get("lstPaises");
                for(int i = 0;i<paises.size();i++){
                java.util.HashMap paisHash = (java.util.HashMap)paises.get(i);
                %>
                pais = <%=paisHash.get("CPAIS")%>
                if (CPAIS == pais){
                return "<%=paisHash.get("TPAIS")%>"
                }
                <%}}}}%> 
        }
        
        function f_but_cancelar() {
        	parent.f_cerrar_axisper005(document.miForm.faceptar.value);
        }   
        
        function f_but_9000554() {
        formdataSPERSON = '${__formdata.SPERSON}';
             if (!objUtiles.estaVacio(formdataSPERSON)){
               objAjax.invokeAsyncCGI("modal_axisper005.do?SPERSON="+formdataSPERSON, callbackAjaxinfohost, "operation=ajaxgetInfoHost", this);
             }
        }
        
        function f_onchange_TIDENTI(TIDENTI) {
            formdataTIDENTI = '${__formdata.CTIPPER}';    <!-- ** LCF ** __formdata.TIDENTI -->
            if ( TIDENTI != formdataTIDENTI ) {
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objUtiles.ejecutarFormulario("modal_axisper005.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
         //BUG 32649 ini 
         function f_onchange_TDIGITOIDE_COLM(TDIGITOIDE_COLM) {
             var TDIGITOIDE=objDom.getValorPorId("TDIGITOIDE");
						
						 if (document.getElementById("TDIGITOIDE_COLM") != null ){
                document.getElementById("TDIGITOIDE_COLM").value =	 TDIGITOIDE_COLM.toUpperCase();
               }
              
            if ( TDIGITOIDE != TDIGITOIDE_COLM.toUpperCase() ) {
                 alert("<axis:alt f="axisper005" c="ALER_ERR" lit="9903982"/>"); //digito de control incorreco
                  document.getElementById("TDIGITOIDE_COLM").focus();
                  objDom.setValorPorId("TDIGITOIDE_COLM","");
                document.miForm.TDIGITOIDE_COLM.focus();
             }
        }
           //BUG 32649 fin 
        function f_onblur_CPOSTAL(CPOSTAL) {
            if (!objUtiles.estaVacio(CPOSTAL)){
				document.miForm.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axisper005.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
            }
        }
    
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        
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
                        objDom.setValorPorId("CPAIS_DIRECCION", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                        objDom.setVisibilidadPorId("findProvincia", "visible");
                    } else {
                       objDom.setValorPorId("CPAIS_DIRECCION", "");
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
                        if(document.miForm.sinProvincias.value != 1)
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
                    
                    // 34989/209710 - Autopoblar el campo TNOMVIA.
                    // Poner en el campo "Street name" lo mismo que se está colocando dinámicamente
                    // en el campo TPOBLAC_span.  Esto se debe realizar solo si el parámetro
                    // pautocalle es 1.
                    
                    // Población
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));           
                    } else {
                        objDom.setValorPorId("CPOBLAC", "");
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0])) {
                        document.getElementById("TPOBLAC_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>";
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PAUTOCALLE")[0]) ) {
                            if(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PAUTOCALLE"), 0, 0) == 1){
                                document.getElementById("TNOMVIA").value =  objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0);
                            }
                        }
                    } else {
                        document.getElementById("TPOBLAC_span").innerHTML = "";
                        document.getElementById("TNOMVIA").value = "";
                    }
					}
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
            
                <%-- Especial per controlar els scroll amb iPad --%>
                // recarrega scroll pane
                $.reinitialiseScroll();
                <%-- Especial per controlar els scroll amb iPad --%>
            
        }
        
         function callbackAjaxinfohost(ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var operationOK = objAppMensajes.existenErroresEnAplicacion(doc);  
             
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
            
                <%-- Especial per controlar els scroll amb iPad --%>
                // recarrega scroll pane
                $.reinitialiseScroll();
                <%-- Especial per controlar els scroll amb iPad --%>
            
        }
        
        
        function f_onchange_CPAIS() {
            var CPAIS_RESIDENCIA=objDom.getValorPorId("CPAIS");
            
            if (!objUtiles.estaVacio(CPAIS_RESIDENCIA)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS_RESIDENCIA";
                qs=qs+"&CPAIS_RESIDENCIA="+CPAIS_RESIDENCIA
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPAIS", "");
                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "");
                limpiaCampos("CPAIS");
            }
        }        

        function f_onchange_CNACIONALIDAD() {
            var CNACIONALIDAD=objDom.getValorPorId("CNACIONALIDAD");
            
            if (!objUtiles.estaVacio(CNACIONALIDAD)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS_NACIONALIDAD";
                qs=qs+"&CPAIS_NACIONALIDAD="+CNACIONALIDAD
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CNACIONALIDAD", "");
                objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "");
                limpiaCampos("CNACIONALIDAD");
            }                
        }
        
        
        function f_onchange_CPAIS_DIRECCION() {
            var CPAIS_DIRECCION=objDom.getValorPorId("CPAIS_DIRECCION");
            
            if (!objUtiles.estaVacio(CPAIS_DIRECCION)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS_DIRECCION";
                qs=qs+"&CPAIS_DIRECCION="+CPAIS_DIRECCION
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
                if(document.miForm.sinProvincias.value == 1)
                objDom.setVisibilidadPorId("findPoblacion2", "visible"); 
            } else {
                objDom.setValorPorId("CPAIS_DIRECCION", "");
                objDom.setValorHTMLPorId("TPAIS_span", "");
                objDom.setVisibilidadPorId("findProvincia", "hidden");
                limpiaCampos("CPAIS_DIRECCION");
                if(document.miForm.sinProvincias.value == 1)
                objDom.setVisibilidadPorId("findPoblacion2", "hidden"); 
            }
        }
        function f_onchange_CPOBLAC() {
           
            var CPAIS_DIRECCION=objDom.getValorPorId("CPAIS_DIRECCION");
            var CPOBLAC=objDom.getValorPorId("CPOBLAC");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            
            if (!objUtiles.estaVacio(CPOBLAC)){
                var qs="operation=ajax_direccion";
               if(document.miForm.sinProvincias.value != 1){
                 qs=qs+"&op="+"CPOBLAC";
               }else{
                 qs=qs+"&op="+"CPOBLACSINPROV";
               }
                qs=qs+"&CPAIS_DIRECCION="+CPAIS_DIRECCION
                qs=qs+"&CPOBLAC="+CPOBLAC
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
            } else {
             /*   objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");*/
                limpiaCampos("CPROVIN");
            }
        }
        function f_onchange_CPROVIN() {
            var CPAIS_DIRECCION=objDom.getValorPorId("CPAIS_DIRECCION");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPROVIN)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPROVIN";
                qs=qs+"&CPAIS_DIRECCION="+CPAIS_DIRECCION;
                qs=qs+"&CPROVIN="+CPROVIN;
                qs=qs+"&dt="+(new Date().getTime());
                qs=qs+"&sin_provincias"+document.miForm.sinProvincias.value;
                objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
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
                            objDom.setValorPorId("CPAIS_DIRECCION", "");
                            limpiaCampos("CPAIS_DIRECCION");
                        }else{
                            objDom.setValorPorId("CPAIS_DIRECCION", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                            objDom.setVisibilidadPorId("findProvincia", "visible");
                              
                           if(document.miForm.sinProvincias.value == 1)
                             objDom.setVisibilidadPorId("findPoblacion2","visible");
                           
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])){
                                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>");
                                
                                limpiaCampos("CPAIS_DIRECCION");
                            }
                        }
                    }
                 
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS_RESIDENCIA")[0])) {
                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS", "");
                            limpiaCampos("CPAIS");
                        }else{
                            objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                            if (document.miForm.isNew.value == "true"){
                                objDom.setValorPorId("CNACIONALIDAD", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                            }
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISRESIDENCIA")[0])){
                                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                                  
                                    if (document.miForm.isNew.value == "true"){
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
                            if(document.miForm.sinProvincias.value != 1)
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
            
                <%-- Especial per controlar els scroll amb iPad --%>
                // recarrega scroll pane
                $.reinitialiseScroll();
                <%-- Especial per controlar els scroll amb iPad --%>
            
        }

        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
         function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION,CODIGO_CP){
             f_scroll_top();
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION + "&CODIGO_CP=" + CODIGO_CP);
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA,CPROVIN){
            f_cerrar_axiscom001();
            
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
          
            if (CODIGO_CONSULTA == "LISTA_PAIS_RESIDENCIA") {
            
                objDom.setValorPorId("CPAIS", CODIGO);
                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + TEXTO + "</b>");
                
                if (document.miForm.isNew.value == "true"){
                objDom.setValorPorId("CNACIONALIDAD", CODIGO);
                objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + TEXTO + "</b>");
                }
                
                
            }
            
            if (CODIGO_CONSULTA == "LISTA_PAIS_NACIONALIDAD") {
                objDom.setValorPorId("CNACIONALIDAD", CODIGO);
                objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + TEXTO + "</b>");
            }
            
            if (CODIGO_CONSULTA == "LISTA_PAIS") {
                  if(document.miForm.sinProvincias.value == 1)
                             objDom.setVisibilidadPorId("findPoblacion2","visible");
                objDom.setValorPorId("CPAIS_DIRECCION", CODIGO);
                objDom.setVisibilidadPorId("findProvincia", "visible");                
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPAIS_DIRECCION");
            }
            else if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
                objDom.setValorPorId("CPROVIN", CODIGO);
                if(document.miForm.sinProvincias.value != 1)
                    objDom.setVisibilidadPorId("findPoblacion", "visible");
                    
                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPROVIN");
            }
            else if (CODIGO_CONSULTA == "LISTA_POBLACION") {
                objDom.setValorPorId("CPOBLAC", CODIGO);
                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
            
            }  else if (CODIGO_CONSULTA == "LISTA_POBLACION_NOPROV") {
                 objDom.setValorPorId("CPROVIN", CPROVIN);
                objDom.setValorPorId("CPOBLAC", CODIGO);
                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>"); 
            }
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
        
        function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
        }
        
        /****************************************************************************************/
        /************************************** UTILES *******************************************/
        /****************************************************************************************/
        function limpiaCampos (CAMPO){
            if(objUtiles.utilEquals(CAMPO, "CPAIS_DIRECCION")){
                //Limpio província
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
               
            }
            
            if(objUtiles.utilEquals(CAMPO, "CPAIS_DIRECCION") ||
                objUtiles.utilEquals(CAMPO, "CPROVIN")){
                    //Limpio población
                    objDom.setValorPorId("CPOBLAC", "");
                    objDom.setValorHTMLPorId("TPOBLAC_span", "");
            }
        }
        
        function f_onchange_TIDENTIcerca(TIDENTI) {
            formdataTIDENTI = '${__formdata.TIDENTIcerca}';
            if ((TIDENTI != "<%= Integer.MIN_VALUE %>" && TIDENTI!='' && TIDENTI!=null ) && TIDENTI != formdataTIDENTI )  {   //&& (formdataTIDENTI == 2 || TIDENTI == 2)
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objUtiles.ejecutarFormulario("modal_axisper005.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }  
        
        function f_onchange_CTIPIDEcerca(CTIPIDE) {
            formdataCTIPIDEcerca = '${__formdata.CTIPIDEcerca}';
            if (CTIPIDE != "<%= Integer.MIN_VALUE %>" && CTIPIDE != formdataCTIPIDEcerca ) {
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objDom.setValorPorId("NNUMIDEcerca", "");
                objUtiles.ejecutarFormulario("modal_axisper005.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        } 
        
        function f_onchange_CTIPIDEcerca(CTIPIDE) {
            formdataCTIPIDEcerca = '${__formdata.CTIPIDEcerca}';
            
            if (CTIPIDE != formdataCTIPIDEcerca ) {
               var qs="operation=ajax_getnnumide";
                qs=qs+"&CTIPIDE="+CTIPIDE;
                objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxnumideCerca, qs, this, objJsMessages.jslit_cargando);   
            }
            
              
        }        

        function callbackajaxnumideCerca (ajaxResponseText){
            try{ 

                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                  if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PNNUMIDE_OUT")[0])) {
                    objDom.setValorPorId("NNUMIDEcerca", objDom.getValorNodoDelComponente(doc.getElementsByTagName("PNNUMIDE_OUT"), 0, 0));
                     document.miForm.NNUMIDEcerca.readOnly = true;
                  }else{
                      document.miForm.NNUMIDEcerca.readOnly = false;
                      document.miForm.NNUMIDEcerca.className = "campowidthinput campo campotexto"; 
                      objDom.setValorPorId("NNUMIDEcerca",'');
                      
                  }
                    revisarEstilos();
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        

       function f_cargarPersona(){
        if (objValidador.validaEntrada()) {
        objUtiles.ejecutarFormulario("modal_axisper005.do", "busqueda_persona", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
       }
       
         function f_personaDuplicada() {
              
              <axis:visible c="DUPLICADANIF" f="axisper005">
                 var op="operation=ajax_duplicada";
                 var qs="";
                if (objValidador.validaEntrada()) {
                 if (!objUtiles.estaVacio(document.miForm.CTIPPERcerca) && document.miForm.CTIPPERcerca.value > 0)
                    qs=qs+"&CTIPPERcerca="+document.miForm.CTIPPERcerca.value;
                 if (!objUtiles.estaVacio(document.miForm.CSEXPERcerca) && document.miForm.CSEXPERcerca.value > 0)
                    qs=qs+"&CSEXPERcerca="+document.miForm.CSEXPERcerca.value;
                 if (!objUtiles.estaVacio(document.miForm.CAGENTEcerca) && document.miForm.CAGENTEcerca.value > 0) 
                    qs=qs+"&CAGENTEcerca="+document.miForm.CAGENTEcerca.value;
                 if (!objUtiles.estaVacio(document.miForm.FNACIMIcerca) && !objUtiles.estaVacio(document.miForm.FNACIMIcerca.value) ) 
                    qs=qs+"&FNACIMIcerca="+document.miForm.FNACIMIcerca.value;
                 if (!objUtiles.estaVacio(document.miForm.CTIPIDEcerca) && document.miForm.CTIPIDEcerca.value > 0) 
                    qs=qs+"&CTIPIDEcerca="+document.miForm.CTIPIDEcerca.value;
                
                 if (!objUtiles.estaVacio(document.miForm.NNUMIDEcerca) && document.miForm.NNUMIDEcerca.value != 0) 
                    qs=qs+"&NNUMIDEcerca="+document.miForm.NNUMIDEcerca.value;
                 if (!objUtiles.estaVacio(document.miForm.sinProvincias))
                    qs=qs+"&sin_provincias="+document.miForm.sinProvincias.value;
                        if (!objUtiles.estaVacio(qs)) {
                            qs = op+qs;
                            objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxduplicado, qs, this)
                        }else{
                            objUtiles.ejecutarFormulario("modal_axisper005.do", "busqueda_persona", document.miForm, "_self", objJsMessages.jslit_cargando);   
                        }
                    }
                    
            </axis:visible>
            <axis:visible c="CARGARPERSONA" f="axisper005">
                f_cargarPersona();
            </axis:visible>

        }    
                
        function callbackajaxduplicado (ajaxResponseText){
            try{ 
         
                var doc = objAjax.domParse(ajaxResponseText);
               
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                  var duplicado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PDUPLICADA"), 0, 0);
                   if (duplicado>0) {
                           objUtiles.abrirModal("axisper024","src","modal_axisper024.do?operation=form&NNUMIDE="+document.miForm.NNUMIDEcerca.value+"&CTIPIDE="+document.miForm.CTIPIDEcerca.value);
                   }else{
                        f_cargarPersona();
                   }
                }
            } catch (e) {
              if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
            
                <%-- Especial per controlar els scroll amb iPad --%>
                // recarrega scroll pane
                $.reinitialiseScroll();
                <%-- Especial per controlar els scroll amb iPad --%>
            
        }
        function f_aceptar_axisper024(SPERSON,CAGENTE,duplicat,MODO){
               
        
         objUtiles.cerrarModal("axisper024");
                    document.miForm.PDUPLICADO.value=duplicat;
                    if (!objUtiles.utilEquals(MODO, "EST"))
                    {                       
                        document.miForm.SPEREAL.value=SPERSON;
                        document.miForm.CODITABLAS.value = MODO;
                    }
                    else
                    {
                        document.miForm.SPERSON.value=SPERSON;
                        document.miForm.CODITABLAS.value = MODO;
                    }
             if (!objUtiles.estaVacio(SPERSON)){
                   document.miForm.CAGENTE_DUP.value=CAGENTE;
                   
                   objUtiles.ejecutarFormulario("modal_axisper005.do?CAGENTEDUP="+CAGENTE+"&SPERSONDUP="+SPERSON, "getPersona", document.miForm, "_self", objJsMessages.jslit_cargando);   
             }else{
                    f_cargarPersona();
            }
                        
        }
        
        
        function f_get_nnumide() {
            var CTIPIDE=objDom.getValorPorId("CTIPIDE");
            
                var qs="operation=ajax_getnnumide";
                qs=qs+"&CTIPIDE="+CTIPIDE;
                objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxnumide, qs, this, objJsMessages.jslit_cargando);   
              
        }        

        function callbackajaxnumide (ajaxResponseText){
            try{ 

                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                  if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PNNUMIDE_OUT")[0])) {
                    objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("PNNUMIDE_OUT"), 0, 0));
                     document.miForm.NNUMIDE.readOnly = true;
                  }else{
                    //  document.miForm.NNUMIDE.readOnly = false;
                     // document.miForm.NNUMIDE.className = "campowidthinput campo campotexto"; 
                      objDom.setValorPorId("NNUMIDE",document.miForm.NNUMIDEcerca.value);
                      
                  }
                    revisarEstilos();
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
            
                <%-- Especial per controlar els scroll amb iPad --%>
                // recarrega scroll pane
                $.reinitialiseScroll();
                <%-- Especial per controlar els scroll amb iPad --%>
                
        }
        
         
            
             /****************************************************************************************/
        /************************************** AXISPER023****************************************/
        /****************************************************************************************/    
        // 34989/207442: Se actualiza para que los avisos reciban el parámetro de persona
        // cuando es alta rápida de persona.
        //
        function f_abrir_axisper023(selectedPerson,selectedAgente,selectedCtipper) {
              f_scroll_top();
              objUtiles.abrirModal("axisper023", "src", "modal_axisper023.do?operation=init&AXISMPRXXX_EST=axisper005&AXISMPRXXX=axisper023&SPERSON="+selectedPerson+"&CAGENTE="+selectedAgente+"&CTIPPER="+selectedCtipper);            
              //objUtiles.abrirModal("axisper023", "src", "modal_axisper023.do?operation=init&AXISMPRXXX_EST=axisper005&AXISMPRXXX=axisper023&SPERSON="+selectedPerson+"&CAGENTE="+selectedAgente+"&CTIPPER="+selectedCtipper+"&SPERSON_RAPIDA="+${__formdata.SPERSON});            
        }
		
        function f_aceptar_axisper023(selectedPerson,selectedAgente){
            objUtiles.cerrarModal("axisper023");
            f_habilitar_campos();
            
            objUtiles.ejecutarFormulario("modal_axisper005.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
        function f_cancelar_axisper023(){
            objUtiles.cerrarModal("axisper023");
        }
        
        function f_onclickCheckbox(thiss) {
                thiss.value =  (thiss.checked)?1:0;
             if (thiss.value  == 1 ){
                    var CTIPIDE=objDom.getValorPorId("CTIPIDE");
                    var NNUMIDE=objDom.getValorPorId("NNUMIDE");
                    
                    var qs="operation=ajax_getdigito";
                    qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                    objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
               }else {
                objDom.setValorPorId("TDIGITOIDE",'');
               }
            }
        
        function callbackajaxdigito (ajaxResponseText){
            try{ 

                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                
                  if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[0])) {
                    objDom.setValorPorId("TDIGITOIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0));
                  }else{
                      objDom.setValorPorId("TDIGITOIDE",'');
                      
                  }
                  f_cargar_propiedades_pantalla();
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
            
                <%-- Especial per controlar els scroll amb iPad --%>
                // recarrega scroll pane
                $.reinitialiseScroll();
                <%-- Especial per controlar els scroll amb iPad --%>
	}	
      
        function f_formatdate(entrada,title){
         var jDate = new JsFecha();
            if((entrada.value.length == 8) || (entrada.value.length == 10)){
                entrada.value = jDate.formateaFecha(entrada.value);
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                	
                	if(!existeFecha(entrada.value)){
                		alert("<axis:alt f="axisper010" c="MENSAJE2" lit="9909063"/>");
                    		entrada.value = "";
                    	}
                	else{
                	
                    		alert("<axis:alt f="axisper010" c="MENSAJE2" lit="1000421"/>");
                    		entrada.value = "";
                	}
                }
            }else{               
	    	if(entrada.getAttribute("obligatorio")){
            	   alert("<axis:alt f="axisper010" c="MENSAJE2" lit="103835"/>");
               }
                entrada.value = "";
            }
        } 
        
        function existeFecha(fecha){
            var fechaf = fecha.split("/");
            var day = fechaf[0];
            var month = fechaf[1];
            var year = fechaf[2];
            var date = new Date(year,month,'0');
            if((day-0)>(date.getDate()-0)){
                  return false;
            }
            return true;
      }
        
       <%-- function f_formatdate(entrada,title){
            
       	 var jDate = new JsFecha();
               if(entrada.value.length>0){
                   entrada.value=jDate.formateaFecha(entrada.value);
               
                   if(jDate.validaFecha(entrada.value)){
                       entrada.value=jDate.formateaFecha(entrada.value);
                   }else{
                       alert("<axis:alt f="axisctr005" c="ALER_ERR" lit="1000421"/>");
                   }
               
               }
           }    --%>
        
        /*document.onkeypress = function (event) {
            event = event || window.event;
            
            //"${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}"
            var resultats =' ${sessionScope.resultats}';
            var invalid = ' ${__formdata.INVALID}';
            console.debug('resultats: ' + resultats);
            console.debug('INVALID: ' + invalid);
            
            if (event.keyCode === 13) {
               // alert('Enter key pressed');
               f_personaDuplicada();
               return false;
               
            }
            return true;
        }*/
      
      document.onkeypress = function (event){
        event = event || window.event;
            
            if (event.keyCode == 13) {
               var personaCargada = '${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}';
                // alert('Enter key pressed');
               if(personaCargada=='true'){
                    f_but_aceptar();
               }else{
                    f_personaDuplicada();
                    return false;
                }
               
            }
            return true;
      }
      
       function actualitzarCheckbox(obj){
         objDom.setValorPorId("FDEFECTO", ((objDom.getComponenteMarcado(obj))? "1" : "0" ));
        }
		
	function f_aceptar_axisper041 (CPAIS, TPAIS, CPROVIN, TPROVIN, CPOBLAC, TPOBLAC){
            f_cerrar_modal("axisper041");
            objDom.setValorPorId("CPAIS", CPAIS);
            objDom.setValorPorId("CPAIS_DIRECCION", CPAIS);
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
		document.miForm.CPOSTAL.focus();            
	}
			
	function f_abrir_axisper042 () {
                f_scroll_top();
		objUtiles.abrirModal("axisper042", "src", "modal_axisper042.do?operation=form");
	}
        
        function f_abrir_axisper011(CMODCON, CPREFIX, selectedPerson, CTABLAS) {
            objUtiles.abrirModal("axisper011", "src", "modal_axisper011.do?operation=form&SPERSON="+selectedPerson+"&CMODCON=" + CMODCON+ "&CPREFIX=" + CPREFIX+"&CAGENTE="+"${__formdata.CAGENTE}" + "&CTABLAS=" + CTABLAS);            
        }
        
        function f_cerrar_axisper011(){
          objUtiles.cerrarModal("axisper011");
        }
        
        function f_borrar_CONTACTO(CMODCON, selectedPerson) {
            var answer = confirm(objJsMessages.jslit_confirma_borrar);
            if (answer)
                objUtiles.ejecutarFormulario("modal_axisper005.do?CMODCON=" + CMODCON, "eliminarCONTACTO", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
        
        function f_aceptar_axisper011(selectedPerson){
            f_cerrar_axisper011();
            f_habilitar_campos();
            objUtiles.ejecutarFormulario("modal_axisper005.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function selectFlag(valor, origen) {
            
            idFlag = eval("document.miForm." + origen + ".options[valor].id");
            textFlag = eval("document.miForm." + origen + ".options[valor].text");
            if (!objUtiles.estaVacio(idFlag)){
                document.getElementById('flagPais' + origen).src = "images/flagiso/" + idFlag + ".png";
                document.getElementById("TFLAG_span" + origen).innerHTML = "<b>" + textFlag + "</b>";
            }
            else{
                document.getElementById('flagPais'+ origen).src = "images/flagiso/_unknown.png";
                document.getElementById("TFLAG_span" + origen).innerHTML = "";
            }
        }   
        
        function f_dependencia_prefix() {        
            f_cargar_propiedades_pantalla();            
        }
        
        function f_scroll_top() {
            window.scrollTo(0,0);
        }
      
        
        function f_abrir_axisciiu001(CODIGO, LITERAL){
            objUtiles.abrirModal("axisciiu001", "src", "modal_axisciiu001.do?operation=form&CODIGO=" + CODIGO +"&LITERAL=" + LITERAL);
      	 }
        
        
        function f_aceptar_axisciiu001(CODIGO, TEXTO){
            f_cerrar_axisciiu001();
            if (!objUtiles.estaVacio(TEXTO)){
                objDom.setValorPorId("CCIIU", CODIGO);
                objDom.setValorHTMLPorId("TCCIIU_span", "<b>" + TEXTO + "</b>");
             }
         } 
        
        function f_cerrar_axisciiu001() {
            objUtiles.cerrarModal("axisciiu001");
        }
        
        
        
    </script>
  </head>
    <body onload="f_onload()"  >
    	            <div id="wrapper" class="wrapper">
            <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
                    <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"><axis:alt f="axisctr001" c="TIT_AXISPER005" lit="9901871" /></c:param>
                    <c:param name="nid" value="axisper024" />
            </c:import>
             <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER023" lit="9001817"/>
      </c:param>
      <c:param name="nid" value="axisper023"/>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041" lit="9002274"/></c:param>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper042|<axis:alt c="axisper042_TITULO" f="axisper042" lit="9002274"/></c:param>
	</c:import>
        
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER011" lit="1000235"/>
      </c:param>
      <c:param name="nid" value="axisper011"/>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        	<c:param name="nid_y_titulo">axisciiu001|axisciiu001</c:param>
    	</c:import>
    
       
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
        	
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value="busqueda_persona"/>
            <input type="hidden" name="faceptar" value="${__formdata.faceptar}"/>
            <%-- Esto es necesario tenerlo como hidden para volverlo a enviar a servidor para grabar --%>
            <input type="hidden" name="isNew" value="${__formdata.isNew}"/>
            <input type="hidden" name="PER_PARPROPIEDADES" id="PER_PARPROPIEDADES" value="${__formdata.PER_PARPROPIEDADES}"/>
            <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" name="SPEREAL" id="SPEREAL" value="${__formdata.SPEREAL}"/>
            <input type="hidden" name="CESTPER" value="${__formdata.CESTPER}"/>
            <input type="hidden" name="CMUTUALISTA" value="${__formdata.CMUTUALISTA}"/>
            <input type="hidden" name="FDEFUNC" value="${__formdata.FDEFUNC}"/>
            <input type="hidden" name="NORDIDE" value="${__formdata.NORDIDE}"/>
            <input type="hidden" name="FJUBILA " value="${__formdata.FJUBILA }"/>            
            <input type="hidden" name="SMODCON_TLFFIJO" value="${__formdata.SMODCON_TLFFIJO}"/>
            <input type="hidden" name="SMODCON_TLFMOVIL" value="${__formdata.SMODCON_TLFMOVIL}"/>
            <input type="hidden" name="SMODCON_EMAIL" value="${__formdata.SMODCON_EMAIL}"/>
            <input type="hidden" name="SMODCON_FAX" value="${__formdata.SMODCON_FAX}"/>
            <input type="hidden" name="CDOMICI" value="${__formdata.CDOMICI}"/>
            <input type="hidden" name="CNORDBAN" value="${__formdata.CNORDBAN}"/>
            <input type="hidden" name="TPAIS" value="${__formdata.TPAIS}"/>
            <input type="hidden" name="TPROVIN" value="${__formdata.TPROVIN}"/>
            <input type="hidden" name="TPOBLAC" value="${__formdata.TPOBLAC}"/>
            <input type="hidden" name="PDUPLICADO" id="PDUPLICADO" value="${__formdata.PDUPLICADO}"/>
            <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}"/>
            <input type="hidden" name="sinProvincias" id="sinProvincias" value="${__formdata.sin_provincias}"/>
          	 
             <input type="hidden" name="CAGENTE_DUP" id ="CAGENTE_DUP" value="${__formdata.CAGENTE_DUP}" />
             <input type="hidden" name="CODITABLAS" id="CODITABLAS" value="${__formdata.CODITABLAS}"/>
             <input type="hidden" name="PER_CONTACTOCAMPO" value="${__formdata.PER_CONTACTOCAMPO}"/>
             <input type="hidden" name="MENSWARNINFO" id ="MENSWARNINFO" value="${__formdata.MENSWARNINFO}" />			 
            <%--<c:set target="${__formdata}" property="SPEREAL" value="1"/>--%>
            <%--c:if test="${!empty __formdata.SPEREAL}">
            <input type="hidden" name="CTIPPER" value="${__formdata.CTIPPER}"/> <!-- ** LCF ** __formdata.TIDENTI Y NOMBRE-->
            <input type="hidden" name="CSEXPER" value="${__formdata.CSEXPER}"/>
            <input type="hidden" name="FNACIMI" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNACIMI}"/>"/>          
            </c:if--%>
            
            <input type="hidden" name="SFINANCI" value="${__formdata.SFINANCI}"/>
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper005" c="TIT_AXISPER005" lit="1000214" /></c:param>
                <c:param name="producto"><axis:alt f="axisper005" c="TIT_AXISPER005" lit="1000214" /></c:param>
                <c:param name="form">axisper005</c:param>
            </c:import>

            <!-- Area de campos  -->

            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <c:if test="${__formdata.isNew}">
                <tr>
                    <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                            <img src="images/flecha.gif"/> 
                            <b><axis:alt f="axisper005" c="BUSCADOR" lit="1000235"/></b>
                           
                        </div>
                     <table class="seccion">
                            <tr>
                                <th style="width:5%;height:0px"></th>
                                <th style="width:18%;height:0px"></th>
                                <th style="width:18%;height:0px"></th>
                                <th style="width:18%;height:0px"></th>
                                <th style="width:18%;height:0px"></th>
                                <th style="width:18%;height:0px"></th>
                                <th style="width:5%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp; 
                                </td>
                                <axis:ocultar c="TIDENTIcerca" f="axisper005">
                                <td class="titulocaja">
                                  <b><axis:alt f="axisper005" c="TIDENTI" lit="102844"/></b>
                                </td>  
                                </axis:ocultar>
                                <axis:ocultar c="CTIPIDEcerca" f="axisper005">
                                <td class="titulocaja">
                                  <b><axis:alt f="axisper005" c="CTIPIDE" lit="109774"/></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar c="NNUMIDEcerca" f="axisper005">
                                <td class="titulocaja">
                                  <b><axis:alt f="axisper005" c="NNUMIDE" lit="105330"/></b>
                                </td>
                                 </axis:ocultar>
                               
                                <c:if test="${empty __formdata.TIDENTIcerca || __formdata.TIDENTIcerca != 2}">
                                <axis:ocultar c="CSEXPERcerca" f="axisper005">
                                <td class="titulocaja">
                                  <b><axis:alt f="axisper005" c="CSEXPER" lit="100962"/></b>
                                </td>
                                </axis:ocultar>
                                 <axis:ocultar c="FNACIMIcerca" f="axisper005" dejarHueco="false">
                                <td class="titulocaja" id="td_FNACIMIcerca">
                                    <b><axis:alt f="axisper005" c="FNACIMIcerca" lit="1000064"/></b>
                                </td>
                                </axis:ocultar>
                                </c:if>
                            </tr>
                            <tr>
                            <td>
                                    &nbsp; 
                            </td>
                            <axis:ocultar c="TIDENTIcerca" f="axisper005">
                             <td class="campocaja">
                                
                                    <select name="TIDENTIcerca" <c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > disabled </c:if> id="TIDENTIcerca" size="1" class="campowidthselect campo campotexto" style="width:90%;" title="<axis:alt f="axisper005" c="TIDENTI" lit="102844"/>"
                                     onchange="f_onchange_TIDENTIcerca(this.value)" <axis:atr f="axisper005" c="TIDENTIcerca" a="isInputText=false&obligatorio=true"/> >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipPerson}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.TIDENTIcerca}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                     
                                </td>
                                </axis:ocultar>
                                <axis:ocultar c="CTIPIDEcerca" f="axisper005">
                             <td class="campocaja">
                            
                                    <select name="CTIPIDEcerca" onchange="f_onchange_CTIPIDEcerca(this.value)" <c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > disabled </c:if> id="CTIPIDEcerca" size="1" class="campowidthselect campo campotexto" style="width:100%;" title="<axis:alt f="axisper005" c="CTIPIDE" lit="109774"/>"
                                    <axis:atr f="axisper005" c="CTIPIDEcerca" a="isInputText=false&obligatorio=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipDocum}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CTIPIDEcerca}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                    
                                </td>
                                </axis:ocultar>
                                <axis:ocultar c="NNUMIDEcerca" f="axisper005">
                                <td class="campocaja" >
                                    <input type="text" <c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > readonly </c:if> class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMIDEcerca}" name="NNUMIDEcerca" id="NNUMIDEcerca" title="<axis:alt f="axisper005" c="NNUMIDE" lit="105330"/>" style="width:90%;text-transform:uppercase;" 
                                    <c:if test="${empty __formdata.isNew}"> readonly </c:if>  <c:if test="${!empty __formdata.CTIPIDEcerca && __formdata.CTIPIDEcerca == 0}" > readonly </c:if><axis:atr f="axisper005" c="NNUMIDEcerca" a="modificable=true&obligatorio=true"/>/>
                                    
                                </td>
                                </axis:ocultar>
                                
                                <c:if test="${empty __formdata.TIDENTIcerca || __formdata.TIDENTIcerca != 2}">
                                
                                <axis:ocultar c="CSEXPERcerca" f="axisper005">
                                <td class="campocaja" >
                                <select name="CSEXPERcerca" <c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > disabled </c:if> id="CSEXPERcerca" size="1" class="campowidthselect campo campotexto" style="width:90%;" title="<axis:alt f="axisper005" c="CSEXPER" lit="100962"/>"
                                    <axis:atr f="axisper005" c="CSEXPERcerca" a="isInputText=false&obligatorio=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipSexo}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CSEXPERcerca}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                    
                                    </td>
                                    </axis:ocultar>
                                <axis:ocultar c="FNACIMIcerca" f="axisper005">
                                <td class="campocaja">
                                    <input type="text" <c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > readonly </c:if> class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNACIMIcerca}"/>" name="FNACIMIcerca" id="FNACIMIcerca"  style="width:85%;"
                                    <axis:atr f="axisper005" c="FNACIMIcerca" a="modificable=true&formato=fecha&obligatorio=true"/> title="<axis:alt f="axisper005" c="FNACIMIcerca" lit="1000064"/>"/> 
                                     <img id="popup_calendario_FNACIMIcerca" alt="<axis:alt f="axisper005" c="SEL_FNACIMI" lit="108341"/>" title="<axis:alt f="axisper005" c="FNACIMIcerca" lit="1000064" />" src="images/calendar.gif"/></a>
                                </td>
                               
                                </axis:ocultar>
                                
                                </c:if>
                                 <td class="campocaja">
                                        <img id="find" border="0" src="images/find.gif" onclick="f_personaDuplicada()" style="cursor:pointer"/>
                                </td>
                            </tr>
                    </table>
                            
                    
                    </td>
                </tr>
               </c:if> 
               
                 <c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}">
                    
                    <tr>
                    
                        <td>
                        <div class="separador">&nbsp;</div>
                         <div class="titulo">
                            <img src="images/flecha.gif"/> 
                            <b><axis:alt f="axisper005" c="DATOS_PERSONA" lit="110275"/></b>
                           
                        </div>
                        <%-- Datos persona --%>
                        <c:import url="axisper005_datos_persona.jsp"/> 
                        
                        
                        
                        <c:if test="${empty __formdata.SPERSON || __formdata.PER_CONTACTOCAMPO != 1}">
                        

                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisper005" c="CONTACTOS" lit="101025"/></div>
                        <%-- Datos contacto --%>
                        
                        <table class="seccion">
                            <tr>
                               <th style="width:4%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="TLFFIJO" lit="1000378"/></b>
                                </td>
                                <axis:ocultar  c="CPREFIXTF" f="axisper005">
                                    <td class="titulocaja" id="tit_CPREFIXTF">
                                        <b id="label_CPREFIXTF"><axis:alt f="axisper005" c="CPREFIXTF" lit="9910954"/></b>
                                    </td>
                                </axis:ocultar>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="TLFMOVIL" lit="1000379"/></b>
                                </td>
                                <axis:ocultar  c="CPREFIXTM" f="axisper005">
                                    <td class="titulocaja" id="tit_CPREFIXTM">
                                        <b id="label_CPREFIXTM"><axis:alt f="axisper005" c="CPREFIXTM" lit="9910954"/></b>
                                    </td>
                                </axis:ocultar>                                
                            </tr>    
                            
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="campocaja">
                                    <input type="text" onkeypress="return ValidNum(event);" title="<axis:alt f="axisper005" c="TLFFIJO" lit="1000378"/>" 
                                    class="campowidthinput campo campotexto" size="15" value="${__formdata.TLFFIJO}" <axis:atr f="axisper005" c="TLFFIJO" a="obligatorio=false"/>
                                    name="TLFFIJO" id="TLFFIJO" style="width:90%;" onchange="f_dependencia_prefix();"/>
                                </td>
                                
                                <axis:visible f="axisper005" c="CPREFIXTF">
                                    <td class="campocaja" id="td_CPREFIXTF">
                                        <select onchange="selectFlag(this.selectedIndex, 'CPREFIXTF');" name="CPREFIXTF" id="CPREFIXTF" class="campowidthselect campo campotexto" style="width:80%;vertical-align: top;"  
                                                title="<axis:alt f="axisper005" c="lit_CPREFIXTF" lit="9910954"/>">
                                                
                                                <option value="<%= Integer.MIN_VALUE %>">- <axis:alt f="axisper005" c="lit_1000348" lit="1000348"/> -</option>
                                                
                                                <c:forEach var="element" items="${__formdata.listValores.listPrefijos}">                                                
                                                    <option id="${element.CODISOIBAN}" value = "${element.CODISOTEL}"
                                                        <c:if test="${element.CODISOTEL == __formdata.CPREFIXTF}"> selected </c:if> >
                                                        ${element.TPAIS}   +${element.CODISOTEL} 
                                                    </option>                                            
                                                </c:forEach>                                                
                                        </select> 
                                        <img id="flagPaisCPREFIXTF" src="images/flagiso/_unknown.png" onerror="this.src='images/flagiso/_unknown.png'" width="20px" height="20px"/>
                                        &nbsp;<span id="TFLAG_spanCPREFIXTF"><b></b></span>
                                    </td>
                                </axis:visible>
                                
                                <td class="campocaja">
                                    <input type="text" onkeypress="return ValidNum(event);" title="<axis:alt f="axisper005" c="TLFMOVIL" lit="1000379"/>" 
                                    class="campowidthinput campo campotexto" size="15" value="${__formdata.TLFMOVIL}" name="TLFMOVIL" id="TLFMOVIL" 
                                    <axis:atr f="axisper005" c="TLFMOVIL" a="obligatorio=false"/>
                                    style="width:90%;" onchange="f_dependencia_prefix();"/>
                                </td>
                                
                                <axis:visible f="axisper005" c="CPREFIXTM">
                                <td class="campocaja" id="td_CPREFIXTM">
                                    <select onchange="selectFlag(this.selectedIndex, 'CPREFIXTM');" name="CPREFIXTM" id="CPREFIXTM" class="campowidthselect campo campotexto" style="width:80%;vertical-align: top;"  
                                            title="<axis:alt f="axisper005" c="lit_CPREFIXTM" lit="9910954"/>" >
                                            
                                            <option value="<%= Integer.MIN_VALUE %>">- <axis:alt f="axisper005" c="lit_1000348" lit="1000348"/> -</option>
                                            
                                            <c:forEach var="element" items="${__formdata.listValores.listPrefijos}">                                                
                                                <option id="${element.CODISOIBAN}" value = "${element.CODISOTEL}"
                                                    <c:if test="${element.CODISOTEL == __formdata.CPREFIXTM}"> selected </c:if> >
                                                    ${element.TPAIS}   +${element.CODISOTEL} 
                                                </option>                                            
                                            </c:forEach>                                                
                                    </select> 
                                    <img id="flagPaisCPREFIXTM" src="images/flagiso/_unknown.png" onerror="this.src='images/flagiso/_unknown.png'" width="20px" height="20px"/>
                                    &nbsp;<span id="TFLAG_spanCPREFIXTM"><b></b></span>
                                </td>
                                </axis:visible>
                            </tr>
                            
                            <tr>
                                <td>
                                    &nbsp;
                                </td>                                
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="EMAIL" lit="109792"/></b>
                                </td>
                                <%-- Inici BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de personas --%>
                                <axis:ocultar c="FAX" f="axisper005" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisper005" c="FAX" lit="9903323"/></b>
                                    </td>
                                    <axis:ocultar  c="CPREFIXF" f="axisper005">
                                        <td class="titulocaja">
                                            <b  id="label_CPREFIXF"><axis:alt f="axisper005" c="CPREFIXF" lit="9910954"/></b>
                                        </td>
                                    </axis:ocultar>
                                </axis:ocultar>
                                <%-- Fi BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de personas --%>                            
                            </tr>
                            
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="campocaja">






                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.EMAIL}" name="EMAIL" id="EMAIL" style="width:90%;" title="<axis:alt f="axisper005" c="EMAIL" lit="109792"/>"
                                        <axis:atr f="axisper005" c="EMAIL" a="obligatorio=false"/>/>
                                </td>
                                <%-- Inici BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de personas --%>
                                <axis:ocultar c="FAX" f="axisper005" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" onkeypress="return ValidNum(event);" class="campowidthinput campo campotexto" size="15" value="${__formdata.FAX}" name="FAX" id="FAX" style="width:90%;" title="<axis:alt f="axisper005" c="FAX" lit="9903323"/>"
                                            <axis:atr f="axisper005" c="FAX" a="obligatorio=false"/> onchange="f_dependencia_prefix();"/>
                                    </td>
                                    <axis:visible f="axisper005" c="CPREFIXF">
                                        <td class="campocaja" id="td_CPREFIXF">
                                        <select onchange="selectFlag(this.selectedIndex, 'CPREFIXF');" name="CPREFIXF" id="CPREFIXF" class="campowidthselect campo campotexto" style="width:80%;vertical-align: top;"  
                                                title="<axis:alt f="axisper005" c="lit_CPREFIXF" lit="9910954"/>">
                                                
                                                <option value="<%= Integer.MIN_VALUE %>">- <axis:alt f="axisper005" c="lit_1000348" lit="1000348"/> -</option>
                                                
                                                <c:forEach var="element" items="${__formdata.listValores.listPrefijos}">                                                
                                                    <option id="${element.CODISOIBAN}" value = "${element.CODISOTEL}"
                                                        <c:if test="${element.CODISOTEL == __formdata.CPREFIXF}"> selected </c:if> >
                                                        ${element.TPAIS}   +${element.CODISOTEL} 
                                                    </option>                                            
                                                </c:forEach>                                                
                                        </select> 
                                        <img id="flagPaisCPREFIXF" src="images/flagiso/_unknown.png" onerror="this.src='images/flagiso/_unknown.png'" width="20px" height="20px"/>
                                        &nbsp;<span id="TFLAG_spanCPREFIXF"><b></b></span>
                                        </td>
                                    </axis:visible>
                                </axis:ocultar>
                                <%-- Fi BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de personas --%>
                            </tr>                            
                        </table>
                        </c:if>
                        
                        <c:if test="${!empty __formdata.SPERSON && __formdata.PER_CONTACTOCAMPO == 1}">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisper005" c="CONTACTOS" lit="101025"/></div>
                        <%-- Datos contacto --%>
                        <table class="seccion">
                          <axis:visible f="axisper005" c="BT_NVCONTACTO">
                          <c:if test="${! ocultarIconosEdicion && __configform.axisper005__BT_ANADIR_CONTACTO__visible != 'false'}">
                            <div style="float:right;">
                              
                                <img border="0"
                                     alt='<axis:alt f="axisper005" c="LIT24" lit="9000422"/>'
                                     title='<axis:alt f="axisper005" c="LIT24" lit="9000422"/>'
                                     src="images/new.gif"
                                     onclick="f_abrir_axisper011(null, null, '${__formdata.SPERSON}', 'EST');"/>
                              
                            </div>
                          </c:if>
                          </axis:visible>
                          <tr>
                            <td>
                              <c:set var="title1"><axis:alt f="axisper005" c="CMODCON" lit="1000109"/></c:set>
                              <c:set var="title2"><axis:alt f="axisper005" c="LIT26" lit="1000616"/></c:set>
                              <c:set var="title3"><axis:alt f="axisper005" c="LIT27" lit="1000617"/></c:set>
                              <c:set var="title4"><axis:alt f="axisper005" c="TCOMCON" lit="9000759"/></c:set>
                              <c:set var="title5"><axis:alt f="axisper005" c="CDOMICI" lit="105889"/></c:set>
                              <c:set var="title6"><axis:alt f="axisper005" c="CPREFIX" lit="9910954"/></c:set>
                              
                              <div class="displayspace">
                                <display:table name="${__formdata.CONTACTOS}"
                                               id="T_IAX_CONTACTOS"
                                               export="false" class="dsptgtable"
                                               pagesize="-1" defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="modal_axisper005.do?paginar=true">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CONTACTOS.CMODCON"
                                                  headerClass="headwidth5 sortable fixed"
                                                  media="html" style="width:5%"
                                                  autolink="false">
                                    <div class="dspText">
                                          ${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.CMODCON}
                                    </div>
                                  </display:column>
                                  
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CONTACTOS.TTIPCON"
                                                  headerClass="sortable fixed"
                                                  media="html" style="width:25%"
                                                  autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.TTIPCON}
                                    </div>
                                  </display:column>
                                  
                                  <axis:visible f="axisper005" c="CPREFIX">
                                  <display:column title="${title6}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CONTACTOS.CPREFIX"
                                                  headerClass="sortable fixed"
                                                  media="html" style="width:10%"
                                                  autolink="false">
                                    <div class="dspText">
                                      <c:if test="${!empty T_IAX_CONTACTOS.OB_IAX_CONTACTOS.CPREFIX}">
                                      +
                                      </c:if>
                                      ${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.CPREFIX}
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CONTACTOS.TVALCON"
                                                  headerClass="sortable fixed"
                                                  media="html" style="width:30%"
                                                  autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.TVALCON}
                                    </div>
                                  </display:column>
                                  
                                  <axis:visible f="axisper005" c="TCOMCON">
                                    <display:column title="${title4}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CONTACTOS.TCOMCON"
                                                  headerClass="sortable fixed"
                                                  media="html" style="width:20%"
                                                  autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.TCOMCON}
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                
                                  <axis:visible f="axisper005" c="CDOMICI">
                                    <display:column title="${title5}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CONTACTOS.CDOMICI"
                                                  headerClass="sortable fixed"
                                                  media="html" style="width:20%"
                                                  autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.TDOMICI}
                                    
                                         </div>
                                  </display:column>
                                  </axis:visible>
                                   
                                  <axis:visible f="axisper005" c="BT_EDITCONTACTO">
                                  <c:if test="${! ocultarIconosEdicion && __configform.axisper005__BT_EDITAR_CONTACTO__visible != 'false'}">
                                    <display:column title="" sortable="false"
                                                    sortProperty=""
                                                    headerClass="headwidth5 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                      <div class="dspIcons">
                                        
                                          <img border="0"
                                               alt="<axis:alt f='axisper005' c='LIT28' lit='9000423'/>"
                                               title="<axis:alt f='axisper005' c='LIT29' lit='9000423'/>"
                                               src="images/lapiz.gif"
                                               onclick="f_abrir_axisper011('${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.CMODCON}','${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.CPREFIX}','${__formdata.SPERSON}', 'EST')"/>
                                        
                                      </div>
                                    </display:column>
                                  </c:if>
                                  </axis:visible>
                                  
                                  <axis:visible f="axisper005" c="BT_DELCONTACTO">
                                  <c:if test="${! ocultarIconosEdicion && __configform.axisper005__BT_BORRAR_CONTACTO__visible != 'false'}">
                                    <display:column title="" sortable="false"
                                                    sortProperty=""
                                                    headerClass="headwidth5 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                      <div class="dspIcons">
                                        
                                          <img border="0"
                                               alt="<axis:alt f='axisper005' c='LIT30' lit='9000424'/>"
                                               title="<axis:alt f='axisper005' c='LIT31' lit='9000424'/>"
                                               src="images/delete.gif"
                                               onclick="f_borrar_CONTACTO('${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.CMODCON}','${__formdata.SPERSON}');"/>
                                        
                                      </div>
                                    </display:column>
                                  </c:if>
                                  </axis:visible>
                                  
                                </display:table>
                              </div>
                            </td>
                        </tr>

                        </table>
                        </c:if>

                           <%--<c:if test="${__formdata.isNew}">--%>
                          <c:if test="${__formdata.PER_PARPROPIEDADES == '1' || __formdata.isNew}">
                           <div id="DSP_PARPER">
                           <axis:visible c="DSP_PARPER" f="axisper005">
                           	
                           <div class="separador">&nbsp;</div>
                              <div class="titulo">
                              <div style="float:left;">
                                 <img src="images/flecha.gif"/><b><axis:alt f="axisper005" c="DSP_PARPER" lit="9001817"/></b>
                              </div>
                                <div style="float:right;">
                                 
                                    <img border="0" alt='<axis:alt f="axisper005" c="LIT_EDITAR" lit="100002"/>'
                                         title='<axis:alt f="axisper005" c="LIT_EDITAR" lit="100002"/>' src="images/lapiz.gif"
                                            onclick="f_abrir_axisper023('${__formdata.SPERSON}','${__formdata.CAGENTE}','${__formdata.CTIPPER}')"/>
                                  
                                </div>
                                </div>
                                
                              <table class="seccion">
                                <tr>
                                  <td>
                                  <div class="separador">&nbsp;</div>
                                    <!-- DisplayTag datos parametros persona -->
                                    <c:set var="title1">
                                      <axis:alt f="axisper005" c="TPARAM" lit="9001819"/>
                                    </c:set>
                                    <c:set var="title2">
                                      <axis:alt f="axisper005" c="TVALPAR" lit="101159"/>
                                    </c:set>
                                    <div class="displayspace">
                                     
                                      <display:table name="${__formdata.PARPER}" id="T_IAX_PARPER"
                                                     export="false" class="dsptgtable" pagesize="-1"
                                                     defaultsort="1" defaultorder="ascending" sort="list"
                                                     cellpadding="0" cellspacing="0"
                                                     requestURI="modal_axisper005.do?operation=form&paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column headerClass="sortable fixed" title="${title1}"
                                                        sortable="false" sortProperty="TPARAM" media="html"
                                                        style="width:45%" autolink="false">
                                          <div class="dspText">
                                            ${T_IAX_PARPER.OB_IAX_PAR_PERSONAS.TPARAM}
                                          </div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="false"
                                                        sortProperty="XVALPAR" headerClass="sortable fixed"
                                                        media="html" style="width:45%" autolink="false">
                                          <c:if test="${T_IAX_PARPER.OB_IAX_PAR_PERSONAS.CTIPO==1}">
                                            <div class="dspText">
                                              ${T_IAX_PARPER.OB_IAX_PAR_PERSONAS.TVALPAR}
                                            </div>
                                          </c:if>
                                          <c:if test="${T_IAX_PARPER.OB_IAX_PAR_PERSONAS.CTIPO==2}">
                                            <div class="dspText">
                                              ${T_IAX_PARPER.OB_IAX_PAR_PERSONAS.NVALPAR}
                                            </div>
                                          </c:if>
                                          <c:if test="${T_IAX_PARPER.OB_IAX_PAR_PERSONAS.CTIPO==3}">
                                            <div class="dspText">
                                              <fmt:formatDate value="${T_IAX_PARPER.OB_IAX_PAR_PERSONAS.FVALPAR}"
                                                              pattern="dd/MM/yyyy"/>
                                            </div>
                                          </c:if>
                                          <c:if test="${T_IAX_PARPER.OB_IAX_PAR_PERSONAS.CTIPO==4}">
                                            <div class="dspText">
                                              ${T_IAX_PARPER.OB_IAX_PAR_PERSONAS.RESP}
                                            </div>
                                          </c:if>
                                        </display:column>
                                      </display:table>
                                    </div>
                                    <div class="separador">&nbsp;</div>
                                  </td>
                                </tr>
                              </table>
                            </axis:visible>
                          </div>
                        </c:if>
                    		
                    		<c:if test="${__formdata.isNew}">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisper005" c="DIRECCIONS" lit="105889"/></div>
                        <%-- Datos dirección --%>
                        
                        <table class="seccion">
                            <tr>
                                <th style="width:4%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                               
                                <axis:ocultar c="CTIPDIR" f="axisper005" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CTIPDIR" lit="100565"/></b>
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar c="TALIAS" f="axisper005" dejarHueco="false">
                            <td class="titulocaja">
                                <b id="label_TALIAS"><axis:alt f="axisper005" c="TALIAS" lit="9910234"/></b>
                            </td>   
                            </axis:ocultar>
                                
                                
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                  <axis:ocultar c="CTIPDIR" f="axisper005" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CTIPDIR" id="CTIPDIR" size="1" class="campowidthselect campo campotexto" 
                                     title="<axis:alt f="axisper005" c="CTIPDIR" lit="9906012"/>"
                                    	<axis:atr f="axisper005" c="CTIPDIR" a="obligatorio=true"/> style="width:80%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstTipoDireccion}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CTIPDIR}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar c="TALIAS" f="axisper005" dejarHueco="false">   
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TALIAS}" name="TALIAS" id="TALIAS" maxlength="200" onkeypress="return soloLetrasNumeros(event);"
                                           >
                                </td>
                            </axis:ocultar>

                                 <axis:ocultar c="FDEFECTO" f="axisper005" dejarHueco="false">
                                  <td class="campocaja">
                                <b><axis:alt f="axisper005" c="FDEFECTO" lit="9903470"/></b>
                                <input onClick="javascript:actualitzarCheckbox(this)"
                                type="checkbox" id="FDEFECTO" name="FDEFECTO" value="${__formdata.FDEFECTO}"/>
                            </td>
                            </axis:ocultar>
                            </tr>
                            <axis:visible f="axisper005" c="DSP_DIRECCION" >
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axisper005" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CSIGLAS" lit="110028"/></b>
                                </td>
                                </axis:ocultar>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="TNOMVIA" lit="9905723"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="NNUMVIA" lit="800440"/></b>
                                </td>
                                <axis:ocultar c="TCOMPLE" f="axisper005" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="TCOMPLE" lit="110031"/></b>
                                </td>                                
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axisper005" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CSIGLAS" id="CSIGLAS" size="1" class="campowidthselect campo campotexto" style="width:80%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
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
                                    <input title="<axis:alt f="axisper005" c="TNOMVIA" lit="9905723"/>" type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA" onkeypress="return soloLetrasNumeros(event);"
                                    style="width:95%;" maxlength="200"/>
                                </td>
                                <td class="campocaja">
                                    <input title="<axis:alt f="axisper005" c="NNUMVIA" lit="800440"/>" type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMVIA}" name="NNUMVIA" id="NNUMVIA" 
                                    style="width:20%;" maxlength="5"/>
                                </td>
                                <axis:visible c="TCOMPLE" f="axisper005">
                                <td class="campocaja">
                                    <input title="<axis:alt f="axisper005" c="TCOMPLE" lit="110031"/>" type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TCOMPLE}" name="TCOMPLE" id="TCOMPLE" 
                                    style="width:95%;" maxlength="100"/>
                                </td>                                
                                </axis:visible>
                                </tr>
                            </axis:visible>
                            <axis:visible f="axisper005" c="DSP_DIRECCIONCOL" >  
                        <tr>
                           <td></td> 
                           <td colspan ="4"> 
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
                               <axis:visible f="axisper005" c="CVIAVP">

                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CVIAVP" lit="9902408"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper005" c="TNOMVIA">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper005" c="TNOMVIA" lit="9903010"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper005" c="CLITVP">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CLITVP" lit="9902409"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper005" c="CBISVP">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CBISVP" lit="9902410"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper005" c="CORVP">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CORVP" lit="9902411"/></b>
                                </td>
								</axis:visible>
                                
                            </tr>
                            <tr>
                                <axis:visible f="axisper005" c="CVIAVP">

                                <td class="campocaja">
                                    <select name="CVIAVP" id="CVIAVP" size="1" class="campowidthselect campo campotexto" style="width:80%;" onchange="f_cargar_propiedades_pantalla()"
                                    <axis:atr f="axisper005" c="CVIAVP" a="obligatorio=false"/> title="<axis:alt f="axisper005" c="CVIAVP" lit="9902408"/>">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstTipoVia}">
                                            <option value = "${element.CSIGLAS}" 
                                            <c:if test="${element.CSIGLAS == __formdata.CVIAVP}"> selected </c:if> />
                                                ${element.TDENOM} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								<axis:visible f="axisper005" c="TNOMVIA">								                  
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA" onkeypress="return soloLetrasNumeros(event);"
                                    	   maxlength="200" title="<axis:alt f="axisper005" c="TNOMVIA" lit="9903010"/>" 
                                    	   <axis:atr f="axisper005" c="TNOMVIA" a="obligatorio=false"/>/>
                                </td>
							    </axis:visible>
								<axis:visible f="axisper005" c="CLITVP">
                                <td class="campocaja">
                                    <select name="CLITVP" id="CLITVP" size="1" class="campowidthselect campo campotexto" style="width:70%;"
                                     <axis:atr f="axisper005" c="CLITVP" a="obligatorio=false"/> title="<axis:alt f="axisper005" c="CLITVP" lit="9902409"/>">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCLITVP}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CLITVP}"> selected </c:if> >
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								<axis:visible f="axisper005" c="CBISVP">
                                <td class="campocaja">
                                    <select name="CBISVP" id="CBISVP" size="1" title="<axis:alt f="axisper005" c="CBISVP" lit="9902410"/>" class="campowidthselect campo campotexto" style="width:70%;">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCBISVP}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CBISVP}"> selected </c:if> >
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								<axis:visible f="axisper005" c="CORVP">
                                <td class="campocaja">
                                    <select name="CORVP" id="CORVP" size="1" title="<axis:alt f="axisper005" c="CORVP" lit="9902411"/>" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCORVP}">
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
                                <axis:visible f="axisper005" c="NVIAADCO">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="NVIAADCO" lit="9902414"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="CLITCO">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CLITCO" lit="9902409"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="CORCO">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CORCO" lit="9902411"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="NPLACACO">                                
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="NPLACACO" lit="9902415"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="COR2CO">
                                
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="COR2CO" lit="9902411"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                               <axis:visible f="axisper005" c="NVIAADCO">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NVIAADCO}" name="NVIAADCO" id="NVIAADCO" onkeypress="return ValidNum(event);"
                                       style="width:70%;" formato="entero" <axis:atr f="axisper005" c="NVIAADCO" a="obligatorio=false"/> title="<axis:alt f="axisper005" c="NVIAADCO" lit="9902414"/>"/>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="CLITCO">
                                <td class="campocaja">
                                    <select title="<axis:alt f="axisper005" c="CLITCO" lit="9902409"/>"  name="CLITCO" id="CLITCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCLITCO}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CLITCO}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="CORCO">                                
                                <td class="campocaja">
                                    <select title="<axis:alt f="axisper005" c="CORCO" lit="9902411"/>" name="CORCO" id="CORCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCORCO}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CORCO}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="NPLACACO">                                                                
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NPLACACO}" name="NPLACACO" id="NPLACACO" onkeypress="return ValidNum(event);" 
                                      style="width:70%;" formato="entero" <axis:atr f="axisper005" c="NPLACACO" a="obligatorio=false"/> title="<axis:alt f="axisper005" c="NPLACACO" lit="9902415"/>"/>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="COR2CO">                                     
                                <td class="campocaja">
                                    <select title="<axis:alt f="axisper005" c="COR2CO" lit="9902411"/>"  name="COR2CO" id="COR2CO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCOR2CO}">
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
                                <axis:visible f="axisper005" c="CDET1IA">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CDET1IA" lit="9902417"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="TNUM1IA">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper005" c="TNUM1IA" lit="9902418"/></b>
                                </td>
                                </axis:visible>                                
                                <axis:visible f="axisper005" c="CDET2IA">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CDET2IA" lit="9902419"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="TNUM2IA" >
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper005" c="TNUM2IA" lit="9902420"/></b>
                                </td>
                                </axis:visible>
                               
                            </tr>
                            <tr>
                                <axis:visible f="axisper005" c="CDET1IA">
                                <td class="campocaja">
                                    <select title="<axis:alt f="axisper005" c="CDET1IA" lit="9902417"/>" name="CDET1IA" id="CDET1IA" size="1" class="campowidthselect campo campotexto" style="width:60%;"
                                    <axis:atr f="axisper005" c="CDET1IA" a="obligatorio=false"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCDET}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CDET1IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="TNUM1IA">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM1IA}" name="TNUM1IA" id="TNUM1IA" onkeypress="return soloLetrasNumeros(event);"
                                       style="width:90%;"  title="<axis:alt f="axisper005" c="TNUM1IA" lit="9902418"/>" maxlength="100"
                                       <axis:atr f="axisper005" c="TNUM1IA" a="obligatorio=false"/>/>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="CDET2IA">
                                <td class="campocaja">
                                    <select title="<axis:alt f="axisper005" c="CDET2IA" lit="9902419"/>" name="CDET2IA" id="CDET2IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCDET}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CDET2IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="TNUM2IA">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM2IA}" name="TNUM2IA" id="TNUM2IA" onkeypress="return soloLetrasNumeros(event);"
                                       style="width:90%;"  title="<axis:alt f="axisper005" c="TNUM2IA" lit="9902420"/>" maxlength="100"
                                       <axis:atr f="axisper005" c="TNUM2IA" a="obligatorio=false"/>/>
                                </td>
                               </axis:visible>
                            </tr>
                            <tr>
                                 <axis:visible f="axisper005" c="CDET3IA">
                                 <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CDET3IA" lit="9902421"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="TNUM3IA">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper005" c="TNUM3IA" lit="9902422"/></b>
                                </td>                               
                                </axis:visible>

                            </tr>
                            <tr>
                                 <axis:visible f="axisper005" c="CDET3IA">
                                 <td class="campocaja">
                                    <select  title="<axis:alt f="axisper005" c="CDET3IA" lit="9902421"/>"  name="CDET3IA" id="CDET3IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCDET}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CDET3IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="TNUM3IA">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM3IA}" name="TNUM3IA" id="TNUM3IA" onkeypress="return soloLetrasNumeros(event);"
                                       style="width:90%;"  title="<axis:alt f="axisper005" c="TNUM3IA" lit="9902422"/>" maxlength="100"
                                       <axis:atr f="axisper005" c="TNUM3IA" a="obligatorio=false"/>/>
                                </td>
                                </axis:visible>
                            </tr>
                            </table>
                            </td>
                            </tr>
                        </axis:visible>
                        <axis:visible f="axisper005" c="DSP_DIRECCIONCHI" >
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axisper005" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CSIGLAS" lit="110028"/></b>
                                </td>
                                </axis:ocultar>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="TNOMVIA" lit="9905723"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="NNUMVIA" lit="9904598"/></b>
                                </td>  
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axisper005" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CSIGLAS" id="CSIGLAS" size="1" class="campowidthselect campo campotexto" style="width:80%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
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
                                    style="width:95%;" title="<axis:alt f="axisper005" c="TNOMVIA" lit="9905723"/>"
                                     <axis:atr f="axisper005" c="TNOMVIA" a="obligatorio=false"/>
                                    />
                                </td>
                                                                                                
                                <td class="campocaja" colspan="3" >
                                    <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM1IA}" name="TNUM1IA" id="TNUM1IA" onkeypress="return soloLetrasNumeros(event);"
                                       style="width:15%;"  maxlength="100"/>
                                    &nbsp;&nbsp;&nbsp;
                                 <axis:ocultar c="NNUMVIA" f="axisper005" dejarHueco="false">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMVIA}" name="NNUMVIA" id="NNUMVIA" 
                                    style="width:15%;"/>
                                    &nbsp;&nbsp;&nbsp;
                                    </axis:ocultar>
                                     <axis:ocultar c="TCOMPLE" f="axisper005" dejarHueco="false">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TCOMPLE}" name="TCOMPLE" id="TCOMPLE" 
                                    style="width:15%;"/>
                                       </axis:ocultar>
                                </td>                                
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper005" c="TNUM2IA" lit="9904595"/></b>
                                    </td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper005" c="TNUM3IA" lit="9904596"/></b>
                                    </td> 
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM2IA}" name="TNUM2IA" id="TNUM2IA" onkeypress="return soloLetrasNumeros(event);"
                                            style="width:90%;"  title="<axis:alt f="axisper005" c="TNUM2IA" lit="9904595"/>" maxlength="100"/>
                                    </td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM3IA}" name="TNUM3IA" id="TNUM3IA" onkeypress="return soloLetrasNumeros(event);"
                                            style="width:90%;"  title="<axis:alt f="axisper005" c="TNUM3IA" lit="9904596"/>" maxlength="100"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper005" c="LOCALIDAD" lit="9903353"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.LOCALIDAD}" name="LOCALIDAD" id="LOCALIDAD" 
                                            style="width:90%;"  title="<axis:alt f="axisper005" c="LOCALIDAD" lit="9903353"/>" />
                                    </td>
                                </tr>
                            </axis:visible>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td> 
                                <axis:ocultar c="CPOSTAL" f="axisper005" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisper005" c="CPOSTAL" lit="101081"/></b>
                                    </td>    
                                </axis:ocultar>
                                <axis:ocultar c="CPAIS_DIRECCION" f="axisper005" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="TPAIS" lit="100816"/></b>
                                </td>
                                 </axis:ocultar>
                                <axis:visible c="CPROVIN" f="axisper005">  
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisper005" c="TPROVIN" lit="100756"/></b>
                                        </td>
                                </axis:visible>
                                <td class="titulocaja">                                    
                                    <b><axis:alt f="axisper005" c="TPOBLAC" lit="100817"/></b>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CPOSTAL" f="axisper005" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL" onkeypress="return ValidNum(event);"
                                        style="text-transform:uppercase;width:60%;" onblur="f_onblur_CPOSTAL(this.value)"
                                        title="<axis:alt f="axisper005" c="CPOSTAL" lit="101081"/>"
                                           <axis:atr f="axisper005" c="CPOSTAL" a="obligatorio=true"/>/>
										&nbsp;
										<axis:ocultar c="CPOSTALFIND" f="axisper005" dejarHueco="false">
											<img id="findCpostal" border="0" src="images/find.gif" onclick="f_abrir_axisper042();" style="cursor:pointer" alt=""/>
										</axis:ocultar>
                                    </td>   
                                </axis:ocultar>
                                <axis:ocultar c="CPAIS_DIRECCION" f="axisper005" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="3" maxlength="3" 
                                     value="${__formdata.CPAIS_DIRECCION}<c:if test="${empty __formdata.CPAIS_DIRECCION}">${__configform.axisper005__CPAIS_DIRECCION__valordefecto}</c:if>"
                                    name="CPAIS_DIRECCION" id="CPAIS_DIRECCION" onchange="f_onchange_CPAIS_DIRECCION()" style="width:18%;" 
                                    title="<axis:alt f="axisper005" c="CPAIS_DIRECCION" lit="100816"/>" <axis:atr f="axisper005" c="CPAIS_DIRECCION" a="obligatorio=true"/>/>&nbsp;
                                    <img  title="<axis:alt f="axisper005" c="CPAIS_DIRECCION" lit="9000508"/>" id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                                    &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                                </td>
                                   </axis:ocultar>
                               <axis:ocultar c="CPROVIN" f="axisper005">  
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="3" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;" 
                                     title="<axis:alt f="axisper005" c="TPROVIN" lit="100756"/>" <axis:atr f="axisper005" c="CPROVIN" a="obligatorio=true"/>/>
                                    &nbsp;<img id="findProvincia" title="<axis:alt f="axisper005" c="CPROVIN" lit="9000508"/>"                                
                                    <c:if test="${V_PROV!=1}">  
                                     style="visibility:${empty __formdata.CPAIS_DIRECCION ? 'hidden' : 'visible'};cursor:pointer"
                                    </c:if>
                                    <c:if test="${V_PROV==1}">  
                                     style="cursor:pointer"
                                    </c:if>
                                     border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.miForm.CPAIS_DIRECCION.value)"/>                
                                    &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                                </td>
                                </axis:ocultar>
                                  
                                <td class="campocaja">
                                    <%-- BUG: 24997 2012-12-13 AEG Se hace el campo obligatorio --%>
                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="5" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;"
                                    title="<axis:alt f="axisper005" c="TPOBLAC" lit="100817"/>"
                                       <axis:atr f="axisper005" c="CPOBLAC" a="obligatorio=true"/>/>
                                    &nbsp;<img id="findPoblacion" title="<axis:alt f="axisper005" c="CPOBLAC" lit="9000508"/>"     style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CPROVIN.value, document.miForm.CPOSTAL.value)"/>                
                                    &nbsp;<img id="findPoblacion2" style="visibility:${ ( __formdata.sin_provincias == 1 && !empty __formdata.CPAIS_DIRECCION ) ? 'visible' : 'hidden'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION_NOPROV', document.miForm.CPAIS_DIRECCION.value, document.miForm.CPAIS_DIRECCION.value)"/>             
                                    &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                                </td>

                            </tr>
                        </table>
                        
                        </c:if>                       
                        
                        <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> <%-- TIDENTI == 2: Persona Jurídica --%> <!-- ** LCF ** __formdata.TIDENTI -->
                        
                        <axis:ocultar c="CNACIONALIDAD" f="axisper005" dejarHueco="false">
                        
                        <div class="separador">&nbsp;</div>
                       
                       
                       
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisper005" c="NACIONALIDAD" lit="1000304"/></div>
                        <%-- Datos nacionalidades --%>
                        
                        <table class="seccion">
                            <tr>
                                <th style="width:4%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CNACIONALIDAD" lit="1000304"/></b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="campocaja">
                                
                                <input type="text" title="<axis:alt f="axisper005" c="CNACIONALIDAD" lit="1000304"/>"  class="campowidthinput campo campotexto" size="15" maxlength="3" <axis:atr f="axisper005" c="CNACIONALIDAD" a="obligatorio=false"/> value="${__formdata.CNACIONALIDAD}" name="CNACIONALIDAD" id="CNACIONALIDAD" onchange="f_onchange_CNACIONALIDAD()" style="width:18%;" />
                                <img id="findPaisNacionalidad" title="<axis:alt f="axisper005" c="CNACIONALIDAD" lit="9000508"/>" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS_NACIONALIDAD', null)" style="cursor:pointer"/>
                               
                                <span id="TPAISNACIONALIDAD_span"><b>${__formdata.TPAISNACIONALIDAD}</b></span>
                                </td>
                            </tr>
                        </table>
                      </axis:ocultar>
                        </c:if>
                        
                        
                        <!-- ********************************** DATOS TARJETAS ********************************** -->
                        
                   <axis:visible c="DSP_TARJETAS" f="axisper005">       
                        <c:if test="${__formdata.isNew}">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisper005" c="TARJETAS" lit="9902645"/></div>
                        <%-- Datos cuentas bancarias --%>
                        
                        <table class="seccion">
                            <tr>
                                <th style="width:4%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar f="axisper005" c="CTIPCC" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CTIPCC" lit="9902671"/></b> <!-- Tipo Tarjeta -->
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper005" c="CTIPBAN_TARJ" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CTIPBAN_TARJ" lit="9902671"/></b> <!-- Tipo Tarjeta -->
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper005" c="CBANCAR_TARJ" dejarHueco="false">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper005" c="CBANCAR_TARJ" lit="9902646"/></b>  <!-- Num. Tarjeta -->
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper005" c="CBANCO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CBANCO" lit="9000964"/></b>  <!-- *** Banco *** -->
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisper005" c="CCUENTA" dejarHueco="false">
                                 <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper005" c="CCUENTA" lit="9902646"/></b>  <!-- *** Num. Tarjeta *** -->
                                </td>
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                
                                <axis:ocultar f="axisper005" c="CTIPCC_TARJ" dejarHueco="false">
                                    <td class="campocaja" >
                                        <select name="CTIPCC_TARJ" id="CTIPCC_TARJ size="1" class="campowidthselect campo campotexto" style="width:99%;"
                                                onchange=""
                                                title="<axis:alt f="axisper005" c="CTIPCC_TARJ_LIT" lit="9902671"/>"
                                                <axis:atr f="axisper005" c="CTIPCC_TARJ" a="obligatorio=false"/>>&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="CTIPCC_TARJ_ALT2" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.tipBCC_tarjetas}">
                                                <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CTIPCC_TARJ}"> selected </c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar> 
                                
                                <axis:ocultar f="axisper005" c="CTIPBAN_TARJ" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CTIPBAN_TARJ" id="CTIPBAN_TARJ" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                    onchange="">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipTarjeta}">
                                            <option value = "${element.CTIPBAN}" 
                                            <c:if test="${element.CTIPBAN == __formdata.CTIPBAN_TARJ}"> selected </c:if> />
                                                ${element.TTIPO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper005" c="CBANCAR_TARJ" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CBANCAR_TARJ}" name="CBANCAR_TARJ" id="CBANCAR_TARJ" style="width:80%;"/>
                                </td>
                                 </axis:ocultar>
                                
                                <axis:ocultar f="axisper005" c="CBANCO_TARJ" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CBANCO_TARJ" id="CBANCO_TARJ"  <axis:atr f="axisper005" c="CBANCO_TARJ" a="obligatorio=false"/> title="<axis:alt f="axisper005" c="CBANCO_TARJ_ALT1" lit="9000964"/>" size="1" class="campowidthselect campo campotexto" style="width:99%;" >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO_CBANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipBANCO}">
                                            <option value = "${element.CBANCO}" 
                                            <c:if test="${element.CBANCO == __formdata.CBANCO_TARJ}"> selected </c:if> />
                                                ${element.TBANCO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisper014" c="CCUENTA_TARJ" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <input type="text" onkeypress="return ValidNum(event);" <axis:atr f="axisper005" c="CCUENTA_TARJ"  a="obligatorio=false"/>  title="<axis:alt f="axisper005" c="CCUENTA_TARJ_ALT" lit="9902646"/>"  class="campowidthinput campo campotexto" maxlength="20" size="15" value="${__formdata.CCUENTA_TARJ}" name="CCUENTA_TARJ" id="CCUENTA_TARJ" style="width:80%;"/>
                                </td>
                                </axis:ocultar>
                                
                                
                                
                                
                            </tr>
                            
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="FVENCIM" lit="100885"/></b> <!-- Fecha vencimiento -->
                                </td>
                                <axis:ocultar f="axisper005" c="TSEGURI" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="TSEGURI" lit="9902634"/></b>  <!-- Cod. Seguridad -->
                                </td>
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="campocaja">
                                    <input type="text"  class="campowidthinput campo campotexto" size="10" value="${__formdata.FVENCIM}" name="FVENCIM" id="FVENCIM"  style="width:65%;"
                                    <axis:atr f="axisper005" c="FVENCIM" a="obligatorio=false"/> readonly  title="<axis:alt f="axisper005" c="FVENCIM_DAT" lit="100885"/>" obligatorio="false" /> 
                                    <img id="popup_FVENCIM" alt="<axis:alt f="axisper005" c="SEL_FVENCIM" lit="100885"/>" title="<axis:alt f="axisper005" c="ALT_FVENCIM" lit="100885" />" src="images/calendar.gif"/></a>
                                </td>
                                <axis:ocultar f="axisper005" c="TSEGURI" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TSEGURI}" name="TSEGURI" id="TSEGURI" style="width:15%;"/>
                                </td>
                                </axis:ocultar>
                            </tr>
                            
                            
                        </table>                        
                        </c:if>
                        </axis:visible>
                        
                        <!-- *********************************    DATOS CCC   *********************************** -->
                      <axis:visible c="DSP_CUENTAS" f="axisper005"> 
                           <input type="hidden" id="NLONGBANCO" name="NLONGBANCO" value="${__configform.axisper005__NLONGBANCO__valordefecto}"/>
                        <c:if test="${__formdata.isNew}">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisper005" c="CUENTAS" lit="1000091"/></div>
                        <%-- Datos cuentas bancarias --%>
                        
                        <table class="seccion">
                            <tr>
                                <th style="width:4%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar f="axisper005" c="CTIPCC" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CTIPCC" lit="1000374"/></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper005" c="CTIPBAN_CCC" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CTIPBAN" lit="1000374"/></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper005" c="CBANCAR" dejarHueco="false">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper005" c="CBANCAR" lit="100965"/></b>
                                </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axisper005" c="CBANCO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CBANCO" lit="9000964"/></b>  <!-- *** Banco *** -->
                                </td>
                                </axis:ocultar>
                                
                                 <axis:ocultar f="axisper005" c="CCUENTA" dejarHueco="false">
                                 <td class="titulocaja" colspan="2" >
                                    <b><axis:alt f="axisper005" c="CCUENTA" lit="100965"/></b>  <!-- *** Cuenta Bancaria *** -->
                                </td>
                                </axis:ocultar> 
                                
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                
                                <axis:ocultar f="axisper005" c="CTIPCC" dejarHueco="false">
                                    <td class="campocaja" >
                                        <select name="CTIPCC" id="CTIPCC" size="1" class="campowidthselect campo campotexto" style="width:99%;"
                                                onchange=""
                                                title="<axis:alt f="axisper005" c="CTIPCC_LIT" lit="1000374"/>"
                                                <axis:atr f="axisper005" c="CTIPCC" a="obligatorio=false"/>>&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="CTIPCC_ALT2" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.tipBCC_cuentas}">
                                                <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CTIPCC}"> selected </c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar> 
                                
                                <axis:ocultar f="axisper005" c="CTIPBAN_CCC" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CTIPBAN" id="CTIPBAN" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                    onchange="javascript:document.miForm.CBANCAR.value = '';">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipCCC}">
                                            <option value = "${element.CTIPBAN}" 
                                            <c:if test="${element.CTIPBAN == __formdata.CTIPBAN}"> selected </c:if> />
                                                ${element.TTIPO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper005" c="CBANCAR" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CBANCAR}" name="CBANCAR" id="CBANCAR" style="width:80%;"/>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper005" c="CBANCO" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CBANCO" id="CBANCO"  <axis:atr f="axisper005" c="CBANCO" a="obligatorio=false"/> title="<axis:alt f="axisper005" c="CBANCO_ALT1" lit="9000964"/>" size="1" class="campowidthselect campo campotexto" style="width:99%;" >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper014" c="SNV_COMBO_CBANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipBANCO}">
                                            <option value = "${element.CBANCO}" 
                                            <c:if test="${element.CBANCO == __formdata.CBANCO}"> selected </c:if> />
                                                ${element.TBANCO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                               </axis:ocultar>
                                
                               <axis:ocultar f="axisper005" c="CCUENTA" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <input type="text" onkeypress="return ValidNum(event);" <axis:atr f="axisper005" c="CCUENTA"  a="obligatorio=false"/>  title="<axis:alt f="axisper005" c="CCUENTA_ALT" lit="100965"/>"  class="campowidthinput campo campotexto" maxlength="20" size="15" value="${__formdata.CCUENTA}" name="CCUENTA" id="CCUENTA" style="width:99%;"/>
                                </td>
                               </axis:ocultar>
                                
                                
                                
                                
                            </tr>
                        </table>                        
                        </c:if>
                    </axis:visible>
                      <!-- *********************************    DATOS CCC   *********************************** -->    
                        
                   <axis:visible c="DSP_REGFISCAL" f="axisper005">   
                        <c:if test="${__formdata.isNew}">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisper005" c="REGFISCAL" lit="9902257"/></div>
                        <%-- Datos cuentas bancarias --%>
                           
                
                 <table class="seccion">
                            <tr>                                
                                 <th style="width:4%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                            </tr>
                            <tr>          
                             <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisper005" c="FEFECTO">
                                        <td class="titulocaja" id="LIT_FEFECTO">
                                            <b><axis:alt f="axisper005" c="FEFECTO" lit="100883"/></b>
                                        </td>
                                </axis:visible>                                
                                <axis:visible f="axisper005" c="CREGFISCAL">
                                    <td class="titulocaja"> <b><axis:alt f="axisper005" c="LIT_CREGFISCAL" lit="9902257"/></b></td><!-- Regimen fiscal -->  
                                </axis:visible>  
                                <!-- INI CP0025M_SYS_PERS - JLTS - 21/11/2018 -- Se agrega el campo CTIPIVA -->
                                 <axis:ocultar f="axisper005" c="CTIPIVA" dejarHueco="false">
                                  <td class="titulocaja" colspan="2" id="tit_CTIPIVA" >
                                    <b><axis:alt f="axisper005" c="CTIPIVA" lit="101340"/></b>   
                                  </td>
                                </axis:ocultar>
                                <!-- FIN CP0025M_SYS_PERS - JLTS - 21/11/2018 -->
                            </tr>
                            <tr>
                             <td>
                                    &nbsp;
                                </td>
                              <axis:visible f="axisper005" c="FEFECTO" >
                                    <td class="campocaja">
                                                        <input type="text" onblur="javascript:f_formatdate(this,'')" formato="fecha" <axis:atr f="axisper005" c="FEFECTO" a="formato=fecha&modificable=true&isInputText=true"/>  alt="<axis:alt f="axisper005" c="FEFECTO" lit="100883"/>" title="<axis:alt f="axisper005" c="FEFECTO" lit="100883"/>"
                                                        name="FEFECTO" id="FEFECTO"  value="<fmt:formatDate value="${__formdata.FEFECTO}" pattern="dd/MM/yyyy" />" style="width:100px;" class="campowidthinput campo campotexto"/>
                                                        <axis:visible c="ICO_FEFECTO" f="axisper005">
                                                            <a id="icon_FEFECTO" style="vertical-align:middle;">
                                                            <img alt="<axis:alt f="axisper005" c="SELECT" lit="108341"/>" title="<axis:alt f="axisper005" c="ICO_FEFECTO" lit="100883" />" src="images/calendar.gif"/></a>
                                                        </axis:visible>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisper005" c="CREGFISCAL">
                                    <td class="campocaja">
                                        <select title="<axis:alt f="axisper005" c="CREGFISCAL" lit="9902257" />" name="CREGFISCAL" id="CREGFISCAL" 
                                            <axis:atr f="axisper005" c="CREGFISCAL" a="modificable=true&isInputText=false"/> 
                                            size="1" class="campowidthselect campo campotexto" style="width:90%;">&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.regFisc}">
                                                <option value = "${element.CREGFISCAL}" 
                                                <c:if test="${element.CREGFISCAL == __formdata.CREGFISCAL}"> selected </c:if> />
                                                    ${element.TREGFISCAL} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                <!-- INI CP0025M_SYS_PERS - JLTS - 21/11/2018 -- Se agrega el campo CTIPIVA -->
                                <axis:ocultar f="axisper005" c="CTIPIVA" dejarHueco="false">
                                  <td class="campocaja" colspan="2" id="td_CTIPIVA" >
                                    <select name="CTIPIVA" id="CTIPIVA" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                      <axis:atr f="axisper005" c="CTIPIVA" a="obligatorio=true&isInputText=false"/> 
                                        title="<axis:alt f="axisper005" c="CTIPIVA" lit="101340"/>" alt="<axis:alt f="axisper005" c="CTIPIVA" lit="101340"/>">&nbsp;
                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SELEC" lit="1000348"/> - </option></c:if>
                                        <c:forEach var="element" items="${__formdata.listValores.LSTTIPOIVA}">
                                          <option value = "${element.CTIPIVA}"
                                            <c:if test="${__formdata.CTIPIVA == element.CTIPIVA}"> selected = "selected"</c:if> 
                                            <c:if test="${__formdata.CTIPIVA == element.CTIPIVA}"> selected = "selected"</c:if>>
                                              ${element.TTIPIVA} 
                                          </option>
                                        </c:forEach>
                                    </select>
                                  </td>
                                </axis:ocultar>
                                <!-- FIN CP0025M_SYS_PERS - JLTS - 21/11/2018 -->
                            </tr>                           
                            
                        </table>
                        
                        </c:if>
                        </axis:visible>
                        
                        
                        
                        
                    </td>
                </tr>
                </c:if>
                
                
                
                
            </table>			
             	
            <div class="separador">&nbsp;</div>
            <div class="separador">&nbsp;</div>
            <div class="separador">&nbsp;</div>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper005</c:param><c:param name="f">axisper005</c:param>
                <c:param name="__botones">cancelar<c:if test="${!empty __formdata.esHost && __formdata.esHost == 0}">,9000554</c:if><c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}">,aceptar</c:if></c:param>
            </c:import>
        </form>
        
        <%--<c:if test="${(empty __formdata.CTIPPER || __formdata.CTIPPER != 2) && empty __formdata.SPEREAL}">--%> <%-- TIDENTI == 2: Persona Jurídica --%> <!-- ** LCF ** __formdata.TIDENTI -->
        <c:if test="${__formdata.isNew && empty __formdata.FNACIMIcerca || empty __formdata.SPEREAL || empty __formdata.FNACIMI}">
         <%--     <c:if test="${(empty __formdata.CTIPPER || __formdata.CTIPPER != 2)}"> --%>
            <script type="text/javascript">
                Calendar.setup({
                    inputField     :    "FNACIMI",     
                    ifFormat       :    "%d/%m/%Y",      
                    button         :    "popup_calendario_FNACIMI", 
                    singleClick    :    true,
                    firstDay       :    1
                });
            </script>
        </c:if>
          <%--</c:if>--%>
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FNACIMIcerca",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FNACIMIcerca", 
                singleClick    :    true,
                firstDay       :    1
            });    
        </script>
        
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FVENCIM",     
                ifFormat       :    "%m/%Y",      
                button         :    "popup_FVENCIM", 
                singleClick    :    true,
                firstDay       :    1
            });    
             Calendar.setup({
        inputField     :    "FEFECTO",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FEFECTO", 
        singleClick    :    true,
        firstDay       :    1
    });
        </script>
        
        <c:import url="../include/mensajes.jsp" />
     
    </div>
    </body>
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisper005');
      </script >                   
    </c:if>
</html>



