<%/* Revision:# NXrgBhn8oDpGc4K+nrxmtg== # */%>
<%-- 
* Fichero: axisper022.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
**     AXISPER021 i AXISPER022
*     Per tal que funcionin les modals generiques de persones la pantalla PARENT
      que volgui cridar a les modals caldrà 
*     una funció JS que obrir la modal passant-li com a paràmetre el 
      MODO_SWPUBLI i el CAGENTE, tal que :
      function f_abrir_axisper021 () {
*           objUtiles.abrirModal("axisper021", "src", 
            "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBLICAS&CAGENTE=CAGENTE");
      }
      El MODO_SWPUBLI el seu valor serà PERSONAS_PUBLICAS o PERSONAS_PRIVADAS, 
      depenent del que es volgui
      El CAGENTE el valor dependrà des de quina opció estem utilitzant les modals, per exemple :
      al modul de sinistres el CAGENTE serà el de la pòlissa.
      Necessitarem també una funció : 
      function f_cerrar_modalespersona(modal){
      objUtiles.cerrarModal(modal);
      } 
      que ens tancarà qualsevol de les dos modals depenent d'on estiguem.
      també necessitem una funció que al prémer nova persona a la modal axisper021, buscador de persones
      ens obrir la modal d'alta ràpida, s'haurà de dir:
      function f_nova_persona(){
      f_cerrar_modalespersona("axisper021");
      objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE);  
      }

      Per acabar necessitarem un altre funció que acceptarà la persona tant donada d'alta per la axisper021
      com per la axisper022.
      S'haurà d'anomenar, com es veu tindrem el SPERSON, així fent una crida a bbdd podrem obtenir la persona
      buscada o creada. Haurà de ser algu semblant a:
      function f_aceptar_persona(SPERSON,CAGENTE, modal){
        f_cerrar_modalespersona(modal);
         if (!objUtiles.estaVacio(SPERSON)){
        objAjax.invokeAsyncCGI("modal_axissin007.do?SPERSON="+SPERSON+"&CAGENTE="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualiza_persona", this, objJsMessages.jslit_cargando);
        }
      }
      function callbackAjaxActualitzaPersona (ajaxResponseText) {
        try{
            var doc = objAjax.domParse(ajaxResponseText);
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
               
                 objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
                 objDom.setValorPorId("NOMBRE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0));
                 objDom.setValorPorId("CTIPIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPIDE"), 0, 0));
            }          
         
        }catch(e){}
      }

*  Fecha: 24/03/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        	  
         formdataPAIS = '${__formdata.CPAIS}';
         formdataNAC = '${__formdata.CNACIONALIDAD}';
         param='${__formdata.PARAM}';


         if (!objUtiles.estaVacio(param)) {

              var cadena=param.split('#');
              var tpersona=cadena[0];
              var tidenti=cadena[1];       
              var nidenti=cadena[2];
              var nombres=cadena[3];    
              var fnaci=cadena[4];
              var sexo=cadena[5];
              
              document.miForm.TIDENTIcerca.value=tpersona;
              document.miForm.CTIPIDEcerca.value=tidenti;
              document.miForm.NNUMIDEcerca.value=nidenti;
            
              var nombress=nombres.split(' ');
              var nombre=nombress[0];
              var apellido=nombress[1];

              
               document.getElementById("TNOMBRE").value=nombre;
               document.getElementById("TAPELLI1").value=apellido;
               //
               //document.miForm.FNACIMIcerca.value=fnaci;
               //sexo
               if(sexo='Hombre'){
                   sexo='1';
               }else{
                   sexo='2';
               }
               document.getElementById("CSEXPER").value = sexo;
               //document.miForm.CSEXPERcerca.value=sexo;*/
               //formateo fecha
               fnacic=fnaci.split('-');
               fnaci=fnacic[2]+'/'+fnacic[1]+'/'+fnacic[0];
               document.getElementById("FNACIMI").value = fnaci;
               
               if (document.miForm.SPERSON.value!=null && document.miForm.SPERSON.value!=""){
                   if (document.miForm.origen.value == "axissin063"){
                   	   var SPERSON = document.miForm.SPERSON.value;
                       var CAGENTE = document.miForm.CAGENTE.value;
                       var SNIP = document.miForm.SNIP.value;
                       parent.aceptar_axisper022(SPERSON,CAGENTE,SNIP, "axisper022");
                   }
               }else {
            	   //f_personaDuplicada();
               }


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
            }
         }else {
        
          objDom.setValorHTMLPorId("TPAIS_span", "<b></b>");
          objDom.setValorPorId("CPOBLAC","");
          objDom.setValorPorId("CPROVIN","");
           
         }
         } catch (e) {}
         
         
        
        if (!objUtiles.estaVacio(formdataNAC)){
                if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataNAC))){
                    objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + f_buscar_TPAIS(formdataNAC)+"</b>");
                }
           }
            
            var PSPERSONOUT = "${requestScope.PSPERSONOUT}"; 
            var PCAGENTE = "${__formdata.CAGENTE}"; 
            if (!objUtiles.estaVacio(PSPERSONOUT)){
                //alert("Antes de cerrar: "+PSPERSONOUT);
                parent.f_aceptar_persona(PSPERSONOUT, PCAGENTE,"", "axisper022");
            }
         
           f_cargar_propiedades_pantalla();  
            //BUG ini 24780
                 <axis:visible c="SWRUT" f="axisper022">   
                    var CTIPIDE=objDom.getValorPorId("CTIPIDE");
          
                 if ((CTIPIDE == 42 || CTIPIDE == 41)  && !objUtiles.estaVacio(CTIPIDE)){
                     var NNUMIDE=objDom.getValorPorId("NNUMIDE");
                    var qs="operation=ajax_getdigito";
                    qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                    objAjax.invokeAsyncCGI("modal_axisper022.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
                }
                </axis:visible>
          //BUG FIN 24780
           //BUG INI 32649
           <axis:visible c="SWRUT_COLM" f="axisper022">  
            objDom.setValorPorId("SWRUT","1");  
                 var TDIGITOIDE=objDom.getValorPorId("TDIGITOIDE");
                // alert ("TDIGITOIDE: "+TDIGITOIDE);
                 objDom.setValorPorId("TDIGITOIDE_COLM",TDIGITOIDE);
                   var SWRUT=objDom.getValorPorId("SWRUT");
             objDom.setValorPorId("SWRUT_COLM",SWRUT);
                var CTIPIDE=objDom.getValorPorId("CTIPIDE");
                 if ((CTIPIDE == 42 || CTIPIDE == 41) && !objUtiles.estaVacio(CTIPIDE)){
                     var NNUMIDE=objDom.getValorPorId("NNUMIDE");
                    var qs="operation=ajax_getdigito";
                    qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                    objAjax.invokeAsyncCGI("modal_axisper022.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
                }
                objDom.setValorPorId("SWRUT","1"); 
              </axis:visible>
              //BUN FIN 32649
           try{
         	  formdataPAIS =  document.getElementById("CPAIS").value;
           
             if (!objUtiles.estaVacio(formdataPAIS)){
		            if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAIS))){
		                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + f_buscar_TPAIS(formdataPAIS)+"</b>");
		            }
           		}
                
         	  formdataPAISDIRECC =  document.getElementById("CPAIS_DIRECCION").value;
           
             if (!objUtiles.estaVacio(formdataPAISDIRECC)){
		            if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAISDIRECC))){
		                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + f_buscar_TPAIS(formdataPAISDIRECC)+"</b>");
		            }
           		}
         	}catch(e){}
          
        }
                
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
                try { document.miForm.TPAIS.value = document.getElementById("TPAIS_span").innerHTML;} catch (e) {}
                try { document.miForm.TPROVIN.value = document.getElementById("TPROVIN_span").innerHTML;} catch (e) {}
                try { document.miForm.TPOBLAC.value = document.getElementById("TPOBLAC_span").innerHTML;} catch (e) {}
                
                f_habilitar_campos();
                objUtiles.ejecutarFormulario("modal_axisper022.do?CPAISnomodi="+document.miForm.CPAIS.value, "grabarPersona", document.miForm, "_self", objJsMessages.jslit_cargando);   
                
                
                
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
            parent.f_cerrar_axisper022(document.miForm.faceptar.value);
        }  
        
        function f_but_9000554() {
        formdataSPERSON = '${__formdata.SPERSON}';
             if (!objUtiles.estaVacio(formdataSPERSON)){
               objAjax.invokeAsyncCGI("modal_axisper022.do?SPERSON="+formdataSPERSON, callbackAjaxinfohost, "operation=ajaxgetInfoHost", this);
             }
        }
        
        function f_onchange_TIDENTI(TIDENTI) {
            formdataTIDENTI = '${__formdata.CTIPPER}';    <!-- ** LCF ** __formdata.TIDENTI -->
            if (TIDENTI != "<%= Integer.MIN_VALUE %>" && TIDENTI != formdataTIDENTI && (formdataTIDENTI == 2 || TIDENTI == 2)) {
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objUtiles.ejecutarFormulario("modal_axisper022.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
            //BUG 32649 ini 
         function f_onchange_TDIGITOIDE_COLM(TDIGITOIDE_COLM) {
           var TDIGITOIDE=objDom.getValorPorId("TDIGITOIDE");
			 if (document.getElementById("TDIGITOIDE_COLM") != null ){
                document.getElementById("TDIGITOIDE_COLM").value =	 TDIGITOIDE_COLM.toUpperCase();
               }
            if ( TDIGITOIDE != TDIGITOIDE_COLM.toUpperCase() ) {
                 alert("<axis:alt f="axisper022" c="ALER_ERR" lit="9903982"/>"); //digito de control incorreco
				document.getElementById("TDIGITOIDE_COLM").focus();
                  objDom.setValorPorId("TDIGITOIDE_COLM","");
                document.miForm.TDIGITOIDE_COLM.focus();
                 }
        }
           //BUG 32649 fin 
        function f_onblur_CPOSTAL(CPOSTAL) {
            if (!objUtiles.estaVacio(CPOSTAL)){
				document.miForm.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axisper022.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
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
        }
        
        
        function f_onchange_CPAIS() {
            var CPAIS_RESIDENCIA=objDom.getValorPorId("CPAIS");
            
            if (!objUtiles.estaVacio(CPAIS_RESIDENCIA)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS_RESIDENCIA";
                qs=qs+"&CPAIS_RESIDENCIA="+CPAIS_RESIDENCIA
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper022.do", callbackajaxdireccion, qs, this)
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
                objAjax.invokeAsyncCGI("modal_axisper022.do", callbackajaxdireccion, qs, this)
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
                objAjax.invokeAsyncCGI("modal_axisper022.do", callbackajaxdireccion, qs, this)
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
                objAjax.invokeAsyncCGI("modal_axisper022.do", callbackajaxdireccion, qs, this)
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
                qs=qs+"&CPAIS_DIRECCION="+CPAIS_DIRECCION
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper022.do", callbackajaxdireccion, qs, this)
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
                            objDom.setVisibilidadPorId("findPoblacion", "visible");
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
        }

        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
         function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION,CODIGO_CP){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION + "&CODIGO_CP=" + CODIGO_CP);
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
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
                objDom.setValorPorId("CPAIS_DIRECCION", CODIGO);
                objDom.setVisibilidadPorId("findProvincia", "visible");                
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPAIS_DIRECCION");
                 if(document.miForm.sinProvincias.value == 1)
                             objDom.setVisibilidadPorId("findPoblacion2","visible");
            }
            else if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
                objDom.setValorPorId("CPROVIN", CODIGO);
                objDom.setVisibilidadPorId("findPoblacion", "visible");
                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPROVIN");
                  if(document.miForm.sinProvincias.value != 1)
                    objDom.setVisibilidadPorId("findPoblacion", "visible");
            }
            else if (CODIGO_CONSULTA == "LISTA_POBLACION") {
                objDom.setValorPorId("CPOBLAC", CODIGO);
                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
            
            } else if (CODIGO_CONSULTA == "LISTA_POBLACION_NOPROV") {
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
            if ( TIDENTI != formdataTIDENTI ) {
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objUtiles.ejecutarFormulario("modal_axisper022.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }  
        
        function f_onchange_CTIPIDEcerca(CTIPIDE) {
           /* formdataCTIPIDEcerca = '${__formdata.CTIPIDEcerca}';
            if (CTIPIDE != "<%= Integer.MIN_VALUE %>" && CTIPIDE != formdataCTIPIDEcerca ) {
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objDom.setValorPorId("NNUMIDEcerca", "");
                objUtiles.ejecutarFormulario("modal_axisper022.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }*/
            
            formdataCTIPIDEcerca = '${__formdata.CTIPIDEcerca}';
            if (CTIPIDE != "<%= Integer.MIN_VALUE %>" && CTIPIDE != formdataCTIPIDEcerca ) {
               var qs="operation=ajax_getnnumide";
                qs=qs+"&CTIPIDE="+CTIPIDE;
                objAjax.invokeAsyncCGI("modal_axisper022.do", callbackajaxnumideCerca, qs, this, objJsMessages.jslit_cargando);   
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
        objUtiles.ejecutarFormulario("modal_axisper022.do", "busqueda_persona", document.miForm, "_self", objJsMessages.jslit_cargando);   
         ocultarFila();
        }
       }
                
             function f_personaDuplicada() {
               <axis:visible c="DUPLICADANIF" f="axisper022">
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
                 if (!objUtiles.estaVacio(param) ) 
                    qs=qs+"&PARAM="+param;
                
                // if (!objUtiles.estaVacio(document.miForm.NNUMIDEcerca) && document.miForm.NNUMIDEcerca.value != 0) 
                    qs=qs+"&NNUMIDEcerca="+document.miForm.NNUMIDEcerca.value;
                    
                     if (!objUtiles.estaVacio(document.miForm.SWPUBLI) ) 
                    qs=qs+"&SWPUBLI="+document.miForm.SWPUBLI.value;

                        if (!objUtiles.estaVacio(qs)) {
                        
                            qs = op+qs;
                            objAjax.invokeAsyncCGI("modal_axisper022.do", callbackajaxduplicado, qs, this)
                           
                        }else{
                            
                            objUtiles.ejecutarFormulario("modal_axisper022.do", "busqueda_persona", document.miForm, "_self", objJsMessages.jslit_cargando);   
                             
                        }
                    }
                    
            </axis:visible>
            <axis:visible c="CARGARPERSONA" f="axisper022">
                f_cargarPersona();
            </axis:visible>

        }        

        function callbackajaxduplicado (ajaxResponseText){
            try{ 
                var doc = objAjax.domParse(ajaxResponseText);
               
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                  var duplicado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PDUPLICADA"), 0, 0);
                  var modoswpubli = "${__formdata.MODO_SWPUBLI}";
                  var  SWPUBLI = document.miForm.SWPUBLI.value;
                    if (!objUtiles.estaVacio(modoswpubli)){
                    	if ( objUtiles.utilEquals( modoswpubli,'PERSONAS_PUBPRIV') ){
                    			SWPUBLI = '';
                    	}
                    }
                   if (duplicado>0) {
                           objUtiles.abrirModal("axisper024","src","modal_axisper024.do?operation=form&NNUMIDE="+document.miForm.NNUMIDEcerca.value+"&SWPUBLI="+SWPUBLI+"&CTIPIDE="+document.miForm.CTIPIDEcerca.value);
                   }else{
                        f_cargarPersona();
                   }
                }
            } catch (e) {
              if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        function f_aceptar_axisper024(SPERSON,CAGENTE,duplicat){
        
         objUtiles.cerrarModal("axisper024");
                    document.miForm.PDUPLICADO.value=duplicat;
                    
             if (!objUtiles.estaVacio(SPERSON)){
                   document.miForm.CAGENTE_DUP.value=CAGENTE;
                   document.miForm.SWPUBLI.value=0;
                   objUtiles.ejecutarFormulario("modal_axisper022.do?CAGENTEDUP="+CAGENTE+"&SPERSONDUP="+SPERSON, "getPersona", document.miForm, "_self", objJsMessages.jslit_cargando);   
             }else{
                    f_cargarPersona();
            }
                        
        }
        
        
        function f_get_nnumide() {
            var CTIPIDE=objDom.getValorPorId("CTIPIDE");
            
                var qs="operation=ajax_getnnumide";
                qs=qs+"&CTIPIDE="+CTIPIDE;
                objAjax.invokeAsyncCGI("modal_axisper022.do", callbackajaxnumide, qs, this, objJsMessages.jslit_cargando);   
              
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
        }
        
        /****************************************************************************************/
        /************************************** AXISPER023****************************************/
        /****************************************************************************************/    
        function f_abrir_axisper023(selectedPerson,selectedAgente) {
          
            objUtiles.abrirModal("axisper023", "src", "modal_axisper023.do?operation=init&AXISMPRXXX_EST=axisper022&AXISMPRXXX=axisper023&SPERSON="+selectedPerson+"&CAGENTE="+selectedAgente+"&CTIPPER="+$("#CTIPPER").val());
                   
        }
        function f_aceptar_axisper023(selectedPerson,selectedAgente){
            objUtiles.cerrarModal("axisper023");
            f_habilitar_campos();	
            //alert("aa");
            objUtiles.ejecutarFormulario("modal_axisper022.do?SPERSON="+selectedPerson+"&CAGENTE="+selectedAgente, "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
         
        }
        function f_cancelar_axisper023(){
            objUtiles.cerrarModal("axisper023");
        }
      
        
        /****************************************************************************************/
        
         function f_onclickCheckbox(thiss) {
                thiss.value =  (thiss.checked)?1:0;
             if (thiss.value  == 1 ){
                    var CTIPIDE=objDom.getValorPorId("CTIPIDE");
                    var NNUMIDE=objDom.getValorPorId("NNUMIDE");
                    
                    var qs="operation=ajax_getdigito";
                    qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                    objAjax.invokeAsyncCGI("modal_axisper022.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
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
        }
         function ocultarFila() {
              tab=document.getElementById('TIPOSOC');
              var ele= tab.getElementsByTagName('tr');
              var cont = 0;
              var haytd = 0;
                  for (i=0; i<ele.length;  i++) {
                      cont = 0;
                      haytd =0;
                      var eletd = ele[i].getElementsByTagName('td');
                         for (j=0; j<eletd.length; j++) {
                            haytd = 1;
                             try{
                                if (!objUtiles.estaHidden(eletd[j].id)){
                                    cont++;
                                }
                            }catch(e){}
                         }
                     
                      if (cont == 0 && haytd == 1){
                        ele[i].style.display = 'none';
                      }else{
                          if (cont > 0 && haytd == 1){
                               ele[i].style.display = '';
                          }
                      }
                  }
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
		objUtiles.abrirModal("axisper042", "src", "modal_axisper042.do?operation=form");
	}
    </script>
  </head>
    <body onload="f_onload()">
            <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
        
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisper022" c="TIT_AXISPER024" lit="9901871" /></c:param>
                <c:param name="nid" value="axisper024" />
            </c:import>
        <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper022" c="MODPER023" lit="9001817"/>
      </c:param>
      <c:param name="nid" value="axisper023"/>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041" lit="9002274"/></c:param>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper042|<axis:alt c="axisper042_TITULO" f="axisper042" lit="9002274"/></c:param>
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
            <input type="hidden" name="origen" value="${__formdata.origen}"/>
            <%-- Esto es necesario tenerlo como hidden para volverlo a enviar a servidor para grabar --%>
            <input type="hidden" name="isNew" value="${__formdata.isNew}"/>
            <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" name="SWPUBLI"  id="SWPUBLI" value="${__formdata.SWPUBLI}"/>
            <input type="hidden" name="SPEREAL" value="${__formdata.SPEREAL}"/>
            <input type="hidden" name="CESTPER" value="${__formdata.CESTPER}"/>
            <input type="hidden" name="CMUTUALISTA" value="${__formdata.CMUTUALISTA}"/>
            <input type="hidden" name="FDEFUNC" value="${__formdata.FDEFUNC}"/>
            <input type="hidden" name="NORDIDE" value="${__formdata.NORDIDE}"/>
            <input type="hidden" name="FJUBILA " value="${__formdata.FJUBILA }"/>            
            <input type="hidden" name="SMODCON_TLFFIJO" value="${__formdata.SMODCON_TLFFIJO}"/>
            <input type="hidden" name="SMODCON_TLFMOVIL" value="${__formdata.SMODCON_TLFMOVIL}"/>
            <input type="hidden" name="SMODCON_EMAIL" value="${__formdata.SMODCON_EMAIL}"/>
            <%-- BUG 27814 - RCL - 22/10/2013 - Nuevo contacto FAX en el alta rapida de personas --%>
            <input type="hidden" name="SMODCON_FAX" value="${__formdata.SMODCON_FAX}"/>
            <input type="hidden" name="CDOMICI" value="${__formdata.CDOMICI}"/>
            <input type="hidden" name="CNORDBAN" value="${__formdata.CNORDBAN}"/>
            <%-- BUG 22693 - 2012/06/02 - JLTS - Adicion de CNORDBAN_TARJ--%>
            <input type="hidden" name="CNORDBAN_TARJ" value="${__formdata.CNORDBAN_TARJ}"/>
            <input type="hidden" name="TPAIS" value="${__formdata.TPAIS}"/>
            <input type="hidden" name="TPROVIN" value="${__formdata.TPROVIN}"/>
            <input type="hidden" name="TPOBLAC" value="${__formdata.TPOBLAC}"/>
             <input type="hidden" name="PDUPLICADO" id="PDUPLICADO" value="${__formdata.PDUPLICADO}"/>
            <input type="hidden" name="CAGENTE_DUP" id ="CAGENTE_DUP" value="${__formdata.CAGENTE_DUP}" />
            <input type="hidden" name="CTIPPER" id="CTIPPER" value="${__formdata.CTIPPER}" /> 
            <input type="hidden" name="PARAM" id="PARAM" value="${__formdata.PARAM}" /> 
            <input type="hidden" name="sinProvincias" id="sinProvincias" value="${__formdata.sin_provincias}"/>
           <%-- <c:set target="${__formdata}" property="SPEREAL" value="1"/ --%>
           
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper022" c="TIT_AXISPER022" lit="1000214" /></c:param>
                <c:param name="producto"><axis:alt f="axisper022" c="TIT_AXISPER022" lit="1000214" /></c:param>
                <c:param name="form">axisper022</c:param>
            </c:import>
 
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <c:if test="${__formdata.isNew}">
                <tr>
                    <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                            <img src="images/flecha.gif"/> 
                            <b><axis:alt f="axisper022" c="DSP_BUSCADOR" lit="1000235"/></b>
                           
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
                            <axis:ocultar c="SWPUBLI" f="axisper022" dejarHueco="false">
                            <tr>
                            <td></td>
                            <td class="titulocaja" colspan="3"> <b><axis:alt f="axisper022" c="SWPUBLI" lit="9000792"/></b>
                            <input  disabled type="checkbox" id="SWPUBLIselected" name="SWPUBLIselected"
                            <c:if test="${__formdata.SWPUBLI == 1}">checked="true"</c:if>  value="${__formdata.SWPUBLI}"/>
                      
                            </td>
                            </tr>
                            </axis:ocultar>
                              
                            <tr>
                                <td>
                                    &nbsp; 
                                </td>
                                    <axis:ocultar c="TIDENTIcerca" f="axisper022">
                                        <td class="titulocaja" >
                                          <b><axis:alt f="axisper022" c="TIDENTIcerca" lit="102844"/></b>
                                        </td>  
                                    </axis:ocultar>
                                    <axis:ocultar c="CTIPIDEcerca" f="axisper022">
                                        <td class="titulocaja">
                                          <b><axis:alt f="axisper022" c="CTIPIDEcerca" lit="109774"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar c="NNUMIDEcerca" f="axisper022">
                                        <td class="titulocaja">
                                          <b><axis:alt f="axisper022" c="NNUMIDEcerca" lit="105330"/></b>
                                        </td>
                                    </axis:ocultar>
                      
                                <c:if test="${empty __formdata.TIDENTIcerca || __formdata.TIDENTIcerca != 2}">
                                    <axis:ocultar c="CSEXPERcerca" f="axisper022">
                                        <td class="titulocaja" id="tit_CSEXPERcerca">
                                          <b><axis:alt f="axisper022" c="CSEXPERcerca" lit="100962"/></b>
                                        </td>
                                     </axis:ocultar>
                                    <axis:ocultar c="FNACIMIcerca" f="axisper022">
                                        <td class="titulocaja" id="tit_FNACIMIcerca">
                                            <b><axis:alt f="axisper022" c="FNACIMIcerca" lit="1000064"/></b>
                                        </td>
                                     </axis:ocultar>
                                </c:if>
                            </tr>
                            <tr>
                            <td>
                                    &nbsp; 
                            </td>
                            <axis:ocultar c="TIDENTIcerca" f="axisper022">
                             <td class="campocaja">
                            
                                    <select name="TIDENTIcerca" <c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > disabled </c:if> id="TIDENTIcerca" size="1" class="campowidthselect campo campotexto" style="width:90%;" title="<axis:alt f="axisper022" c="TIDENTIcerca" lit="102844"/>"
                                     onchange="f_onchange_TIDENTIcerca(this.value)" <axis:atr f="axisper022" c="TIDENTIcerca" a="isInputText=false&obligatorio=true"/> >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipPerson}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.TIDENTIcerca}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                    
                                </td>
                                 </axis:ocultar>
                                 <axis:ocultar c="CTIPIDEcerca" f="axisper022">
                                
                                     <td class="campocaja">
                                    
                                            <select name="CTIPIDEcerca" onchange="f_onchange_CTIPIDEcerca(this.value)"  <c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > disabled </c:if> id="CTIPIDEcerca" size="1" class="campowidthselect campo campotexto" style="width:100%;" title="<axis:alt f="axisper022" c="CTIPIDEcerca" lit="109774"/>"
                                            <axis:atr f="axisper022" c="CTIPIDEcerca" a="isInputText=false&obligatorio=true"/>>&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listValores.tipDocum}">
                                                    <option value = "${element.CATRIBU}" 
                                                        <c:if test="${element.CATRIBU == __formdata.CTIPIDEcerca}"> selected </c:if> />
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar c="NNUMIDEcerca" f="axisper022">
                                   
                                <td class="campocaja" >
                                    <input type="text" <c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > readonly </c:if> class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMIDEcerca}" name="NNUMIDEcerca" id="NNUMIDEcerca" title="<axis:alt f="axisper022" c="NNUMIDEcerca" lit="105330"/>" style="width:90%;"
                                    <c:if test="${empty __formdata.isNew}"> readonly </c:if>  <c:if test="${!empty __formdata.CTIPIDEcerca && __formdata.CTIPIDEcerca == 0}" > readonly </c:if><axis:atr f="axisper022" c="NNUMIDEcerca" a="modificable=true&obligatorio=true"/>/>
                                     

                                </td>
                                 </axis:ocultar>

                               
								<c:if test="${empty __formdata.TIDENTIcerca || __formdata.TIDENTIcerca != 2}">
                                 <axis:ocultar c="CSEXPERcerca" f="axisper022">
                                <td class="campocaja" >
                                <select name="CSEXPERcerca" <c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > disabled </c:if> id="CSEXPERcerca" size="1" class="campowidthselect campo campotexto" style="width:90%;" title="<axis:alt f="axisper022" c="CSEXPERcerca" lit="100962"/>"
                                    <axis:atr f="axisper022" c="CSEXPERcerca" a="isInputText=false&obligatorio=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipSexo}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CSEXPERcerca}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                
                                    </td>
                                    </axis:ocultar>
                                    <axis:ocultar c="FNACIMIcerca" f="axisper022">
                                        <td class="campocaja">
                                            <input type="text" <c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > disabled </c:if> class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNACIMIcerca}"/>" name="FNACIMIcerca" id="FNACIMIcerca"  style="width:85%;"
                                            <axis:atr f="axisper022" c="FNACIMIcerca" a="modificable=true&formato=fecha&obligatorio=true"/> title="<axis:alt f="axisper022" c="FNACIMIcerca" lit="1000064"/>"/> 
                                             <img id="popup_calendario_FNACIMIcerca" alt="<axis:alt f="axisper022" c="IMG_FNACIMI" lit="108341"/>" title="<axis:alt f="axisper022" c="FNACIMIcerca" lit="1000064" />" src="images/calendar.gif"/></a>
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
                            <b><axis:alt f="axisper022" c="DSP_DADESPERSONA" lit="110275"/></b>
                           
                        </div>
                        <%-- Datos persona --%>
                        <table class="seccion">
                            <tr>
                                <th style="width:4%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                            <tr>
							
							<tr>
                                <td>
                                    &nbsp; 
                                </td>
                                <td class="titulocaja">
                                  <b><axis:alt f="axisper022" c="CTIPPER" lit="102844"/></b>
                                </td>
                                <td class="titulocaja">
                                  <b><axis:alt f="axisper022" c="CTIPIDE" lit="109774"/></b>
                                </td>
                                <td class="titulocaja">
                                  <b><axis:alt f="axisper022" c="NNUMIDE" lit="105330"/></b>
                                </td>
                                <axis:ocultar c="SNIP" f="axisper022"  dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="SNIP" lit="1000088"/></b>
                                
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp; 
                                </td>
                                <td class="campocaja"><!-- ** LCF ** __formdata.TIDENTI NOMBRE CAMPO -->
                                    <select name="CTIPPER" id="CTIPPER" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                     <c:if test="${!__formdata.isNew || !empty __formdata.TIDENTIcerca }"> disabled </c:if> onchange="f_onchange_TIDENTI(this.value)" >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipPerson}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CTIPPER}"> selected </c:if> /> <!-- ** LCF ** __formdata.TIDENTI -->
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja">
                                    <select name="CTIPIDE" id="CTIPIDE" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                    <c:if test="${! __formdata.isNew || !empty __formdata.CTIPIDEcerca }"> disabled </c:if> >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipDocum}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                               
                                </td>
                                <td class="campocaja" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" style="width:50%;"
                                     <c:if test="${!__formdata.isNew || !empty __formdata.NNUMIDE }"> readonly </c:if> />
                                  
                                   
                                </td>
                              <%--  <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> <!-- ** LCF ** __formdata.TIDENTI -->--%>
                               <axis:ocultar c="SNIP" f="axisper022"  dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" <c:if test="${!empty __formdata.SNIP && !__formdata.isNew }"> readonly </c:if> 
                                    class="campowidthinput campo campotexto" size="15" value="${__formdata.SNIP}" 
                                    <axis:atr f="axisper022" c="SNIP" a="modificable=true"/> 
                                    name="SNIP" id="SNIP" style="width:90%;"/>
                                   <%-- <c:if test="${!empty __formdata.SNIP && !__formdata.isNew}"> 
                                    <input type="hidden" class="campowidthinput campo campotexto" size="15" value="${__formdata.SNIP}" name="SNIP" id="SNIP" style="width:90%;"/>
                                    </c:if>--%>
                                </td>
                                </axis:ocultar>
                                <%--</c:if>--%>
                            </tr>
							
                             <c:if test="${(__formdata.CTIPIDE == 36 ||__formdata.CTIPIDE == 41 ||__formdata.CTIPIDE == 42 ) && ( !empty __formdata.TDIGITOIDE || !empty __formdata.isNew)}">
                            <tr>
                            <td></td>
                             <axis:ocultar c="SWRUT" f="axisper022"  dejarHueco="false">
                             <td class="titulocaja" colspan="2" id="tit_SWRUT">
                               <table>
                               <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                            
                                            <td class="titulocaja" >
                                                <b id="label_SWRUT"><axis:alt f="axisper022" c="SWRUT" lit="9903067"/></b>
                                            </td>
                                            <td class="titulocaja" id="tit_TDIGITOIDE">
                                                <b id="label_TDIGITOIDE"><axis:alt f="axisper022" c="TDIGITOIDE" lit="9903068"/></b>
                                            </td>
                                   </tr>
                                   </table>
                                   </td>
                                </axis:ocultar>
                                <%-- BUG 32649 INI--%>
                                 <axis:ocultar c="SWRUT_COLM" f="axisper022"  dejarHueco="false">
                             <td class="titulocaja" colspan="2" id="tit_SWRUT">
                               <table>
                               <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                
                                            <td class="titulocaja" >
                                                <b id="label_SWRUT_COLM"><axis:alt f="axisper022" c="SWRUT_COLM" lit="9904620"/></b>
                                            </td>
                                            <td class="titulocaja" id="tit_TDIGITOIDE_COLM">
                                                <b id="label_TDIGITOIDE_COLM"><axis:alt f="axisper022" c="TDIGITOIDE_COLM" lit="9903068"/></b>
                                            </td>
                                   </tr>
                                   </table>
                                   </td>
                                </axis:ocultar>
                               <%-- BUG 32649 FIN --%>
                            </tr>
                            <tr>
                            <td></td>
                             <axis:ocultar c="SWRUT" f="axisper022"  dejarHueco="false">
                                <td class="campocaja" id="td_SWRUT" colspan="2">
                                <table>
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                               
                                <td class="campocaja">
                               
                                      <input onClick="f_onclickCheckbox(this)" type="checkbox" id="SWRUT" name="SWRUT"  <axis:atr f="axisper022" c="SWRUT" a="isInputText=false"/> 
                                       <c:if test="${empty __formdata.isNew}"><axis:atr f="axisper022" c="SWRUT" a="modificable=false&isInputText=false"/> </c:if>
                                      <c:if test="${__formdata.SWRUT == 1}">checked="true"</c:if>  value="${__formdata.SWRUT}"/>
                                </td>
                                <td class="campocaja" id="td_TDIGITOIDE">
                                   <input type="text" class="campowidthinput campo campotexto" size="50" 
                                    value="${__formdata.TDIGITOIDE}" name="TDIGITOIDE" id="TDIGITOIDE"  style="width:25%;"
                                    <axis:atr f="axisper022" c="TDIGITOIDE" a="modificable=false"/> >
                                            
                                </td>
                                </tr>
                                </table>
                                </td>
                                </axis:ocultar>
                                 <%-- BUG 32649 INI --%>
                                 <axis:ocultar c="SWRUT_COLM" f="axisper022"  dejarHueco="false">
                                <td class="campocaja" id="td_SWRUT_COLM" colspan="2">
                                <table>
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                <td class="campocaja" >
                            				 <input onClick="f_onclickCheckbox(this)" type="checkbox" id="SWRUT_COLM" name="SWRUT_COLM"  <axis:atr f="axisper022" c="SWRUT_COLM" a="modificable=false&isInputText=false"/> 
                                      <c:if test="${__formdata.SWRUT_COLM == 1}">checked="true"</c:if>  value="${__formdata.SWRUT}"/>
                                </td>
                                <td class="campocaja" id="td_TDIGITOIDE_COLM">
                                   <input type="text" class="campowidthinput campo campotexto" size="50" 
                                    title='<axis:alt f="axisper022" c="TDIGITOIDE_COLM" lit="9903068"/>' 
                                    	<axis:atr f="axisper022" c="TDIGITOIDE_COLM" a="modificable=true"/>
                                    value="${__formdata.TDIGITOIDE_COLM}" name="TDIGITOIDE_COLM" id="TDIGITOIDE_COLM" onchange="f_onchange_TDIGITOIDE_COLM(this.value)"  style="width:25%;"
                                    <axis:atr f="axisper022" c="TDIGITOIDE_COLM" /> >
                                            
                                </td>
                                </tr>
                                </table>
                                </td>
                                </axis:ocultar>
                                <%-- BUG 32649 fin--%>
                            </tr>
                              </c:if>     
                         
                         <axis:visible c="TIPOSOC" f="axisper022">
                            <tr>
                                <td class="titulocaja" id="tit_TIPOSOC">
                                    &nbsp; 
                                </td>    
                                <td class="titulocaja" colspan="2" id="tit_TIPOSOC">
                                  <b id="label_TIPOSOC"><axis:alt f="axisper022" c="TIPOSOC" lit="9903269"/></b>
                                </td>   
                            </tr>
                            </axis:visible>
                         
                            <axis:visible c="TIPOSOC" f="axisper022">
                          
                            <tr>
                                <td class="campocaja" id="td_TIPOSOC">
                                    &nbsp; 
                                </td> 
                             
                                <td class="campocaja" id="td_TIPOSOC" colspan="2" >
                                   <input type="text" class="campowidthinput campo campotexto"  size="15" value="${__formdata.TIPOSOC}" id="TIPOSOC" name="TIPOSOC"  readonly>
                                </td>  
                                </tr>
                                </axis:visible>
                               <tr>
                                <td>
                                    &nbsp;
                                </td>   
                               <axis:ocultar f="axisper022" c="TNOMBRE" dejarHueco="false">
                                  <td class="titulocaja"  id="tit_TNOMBRE">
                                      <b id="label_TNOMBRE"><axis:alt f="axisper022" c="TNOMBRE" lit="105940"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper022" c="TNOMBRE1">
                                    <td class="titulocaja"  id="tit_TNOMBRE1" >
                                      <b id="label_TNOMBRE1"><axis:alt f="axisper022" c="TNOMBRE1" lit="105940"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper022" c="TNOMBRE2" dejarHueco="false">
                                    <td class="titulocaja" id="tit_TNOMBRE2" >
                                      <b id="label_TNOMBRE2"><axis:alt f="axisper022" c="TNOMBRE2" lit="9902260"/></b>
                                    </td>
                                </axis:ocultar>                                
                            <axis:ocultar f="axisper022" c="TAPELLI1" dejarHueco="false">
                                <td class="titulocaja" id="tit_TAPELLI1" >
                                    <b  id="label_TAPELLI1"><axis:alt f="axisper022" c="TAPELLI1" lit="108243"/></b>
                                </td>
                            </axis:ocultar>
                       
                            <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}">
                                <td class="titulocaja" id="tit_TAPELLI2">
                                    <b><axis:alt f="axisper022" c="TAPELLI2" lit="108246"/></b>
                                </td>
                             </c:if>  
                               <axis:ocultar f="axisper022" c="FNACIMI" dejarHueco="false">
                                <td class="titulocaja" id="tit_FNACIMI">
                                    <b id="label_FNACIMI"><axis:alt f="axisper022" c="FNACIMI" lit="1000064"/></b>
                                </td>                                
                            </axis:ocultar>
                           <%-- 
                            <c:if test="${__formdata.CTIPPER == 2}"> <!-- ** LCF ** __formdata.TIDENTI -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CIDIOMA" lit="1000246"/></b>
                                </td>
                                 <axis:ocultar c="CPAIS" f="axisper022" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CPAIS" lit="9000789"/></b>
                                </td>
                                </axis:ocultar>
                            </c:if>--%>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                              <axis:ocultar f="axisper022" c="TNOMBRE" dejarHueco="false">
                                  <td class="campocaja" id="td_TNOMBRE">
                                    <input type="text" class="campowidthinput campo campotexto" 
                                    <axis:atr f="axisper022" c="TNOMBRE" a="modificable=true"/>
                                    title="<axis:alt f="axisper022" c="TNOMBRE" lit="105940"/>"
                                    size="15" value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" style="width:90%;"/>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper022" c="TNOMBRE1" dejarHueco="false">
                                 <td class="campocaja" id="td_TNOMBRE1">
                                    <input type="text" class="campowidthinput campo campotexto" 
                                    <axis:atr f="axisper022" c="TNOMBRE1" a="modificable=true"/>
                                    title="<axis:alt f="axisper022" c="TNOMBRE1" lit="105940"/>"
                                    size="15" value="${__formdata.TNOMBRE1}" name="TNOMBRE1" id="TNOMBRE1" style="width:90%;"/>
                                </td>
                                </axis:ocultar>
                                
                              <axis:ocultar f="axisper022" c="TNOMBRE2" dejarHueco="false">
                                 <td class="campocaja" id="td_TNOMBRE2">
                                    <input type="text" class="campowidthinput campo campotexto" 
                                    title="<axis:alt f="axisper022" c="TNOMBRE2" lit="105940"/>"
                                    <axis:atr f="axisper022" c="TNOMBRE2" a="modificable=true"/>
                                    size="15" value="${__formdata.TNOMBRE2}" name="TNOMBRE2" id="TNOMBRE2" style="width:90%;"/>
                                </td>
                            </axis:ocultar>
                           
                          <axis:ocultar f="axisper022"  c="TAPELLI1" dejarHueco="false">
                                <td class="campocaja" id="td_TAPELLI1">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TAPELLI1}"
                                    title="<axis:alt f="axisper022" c="TAPELLI1" lit="108243"/>"
                                    <axis:atr f="axisper022" c="TAPELLI1" a="modificable=true"/>
                                     name="TAPELLI1" id="TAPELLI1" style="width:90%;"/>
                                </td>
                          </axis:ocultar>
                             <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> <!-- ** LCF ** __formdata.TIDENTI -->
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                    title="<axis:alt f="axisper022" c="TAPELLI2" lit="108246"/>"
                                    <axis:atr f="axisper022" c="TAPELLI2" a="modificable=true"/>
                                    value="${__formdata.TAPELLI2}" name="TAPELLI2" id="TAPELLI2" style="width:90%;"/>
                                </td>
                            </c:if>
                                 <axis:ocultar f="axisper022" c="FNACIMI" dejarHueco="false">
                                <td class="campocaja" id="td_FNACIMI">
                                    <input type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNACIMI}"/>" name="FNACIMI" id="FNACIMI"  style="width:85%;"
                                    <axis:atr f="axisper022" c="FNACIMI" a="modificable=true&formato=fecha"/> title="<axis:alt f="axisper022" c="FNACIMI" lit="1000064"/>"
                                     <c:if test="${! __formdata.isNew || !empty __formdata.FNACIMI}"> readonly </c:if>/><c:if test="${__formdata.isNew && empty __formdata.FNACIMI }"><a style="vertical-align:middle;"><img id="popup_calendario_FNACIMI" alt="<axis:alt f="axisper022" c="FNACIMI" lit="1000064"/>" title="<axis:alt f="axisper022" c="FNACIMI" lit="1000064" />" src="images/calendar.gif"/></a></c:if>
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> <!-- ** LCF ** __formdata.TIDENTI -->
                              	
                              	<axis:visible c="CSEXPER" f="axisper022">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CSEXPER" lit="100962"/></b>
                                </td>
                              </axis:visible>
                                </c:if>
                                <axis:ocultar c="CIDIOMA" f="axisper022" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CIDIOMA" lit="1000246"/></b>
                                </td>
                                </axis:ocultar>
                                <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CPROFES" lit="110978"/></b>
                                </td>      
                                </c:if>
                            </tr>                            
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                             <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}">
                                <axis:visible c="CSEXPER" f="axisper022">
                                <td class="campocaja">
                                    <select name="CSEXPER" id="CSEXPER" size="1" class="campowidthselect campo campotexto" style="width:90%;"  title="<axis:alt f="axisper022" c="CSEXPER" lit="100962"/>"
                                    <axis:atr f="axisper022" c="CSEXPER" a="obligatorio=false"/>
                                    <c:if test="${!empty __formdata.SPEREAL}"> disabled </c:if> >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipSexo}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CSEXPER}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                	</td>
                                </axis:visible>
                                </c:if>
                                <axis:ocultar c="CIDIOMA" f="axisper022" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CIDIOMA" id="CIDIOMA" size="1" <axis:atr f="axisper022" c="CIDIOMA" a="modificable=true" /> 
                                    	title="<axis:alt f="axisper022" c="CIDIOMA" lit="1000246"/>"
                                    	class="campowidthselect campo campotexto" style="width:90%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstIdiomas}">
                                            <option value = "${element.CIDIOMA}" 
                                            <c:if test="${element.CIDIOMA == __formdata.CIDIOMA}"> selected </c:if> />
                                                ${element.TIDIOMA} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                    <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> <!-- ** LCF ** __formdata.TIDENTI -->
                                <td class="campocaja">
                                    <select name="CPROFES" id="CPROFES" size="1" class="campowidthselect campo campotexto" style="width:200%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstProfesiones}">
                                            <option value = "${element.CPROFES}" 
                                            <c:if test="${element.CPROFES == __formdata.CPROFES}"> selected </c:if> />
                                                ${element.TPROFES} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </c:if>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>   
                                <axis:ocultar  f="axisper022" c="CPAIS" dejarHueco="false">
                                <td class="titulocaja" id="tit_CPAIS">
                                    <b id="label_CPAIS"><axis:alt f="axisper022" c="CPAIS" lit="9000789"/></b>
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>                            
                                <axis:ocultar c="CPAIS" f="axisper022" dejarHueco="false">
                                        <td class="campocaja">
                                                  <input type="text"  class="campowidthinput campo campotexto" size="3"
                                                  title="<axis:alt f="axisper022" c="CPAIS" lit="9000789"/>"
                                                   maxlength="3" value="${__formdata.CPAIS}<c:if test="${empty __formdata.CPAIS}">${__configform.axisper022__CPAIS__valordefecto}</c:if>" 
                                                  name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS()" <axis:atr f="axisper022" c="CPAIS" a="modificable=true&obligatorio=true"/> style="width:18%;" />
                                                      <axis:visible c="findPaisResidencia" f="axisper022">
                                                      <img id="findPaisResidencia" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS_RESIDENCIA', null)" style="cursor:pointer"/>
                                                      </axis:visible>
                                                   <span id="TPAISRESIDENCIA_span"><b>${__formdata.TPAISRESIDENCIA} </b></span>
                                       </td>   
                                </axis:ocultar>
                            </tr>                            
                        </table>

    <axis:visible c="DSP_PARPER" f="axisper022">
       
                           <div class="separador">&nbsp;</div>
                              <div class="titulo">
                              <div style="float:left;">
                                 <img src="images/flecha.gif"/><b><axis:alt f="axisper022" c="DSP_PARPER" lit="9001817"/></b>
                              </div>
                                <div style="float:right;">
                                 
                                    <img border="0" alt='<axis:alt f="axisper022" c="LIT_EDITAR" lit="100002"/>'
                                         title='<axis:alt f="axisper022" c="LIT_EDITAR" lit="100002"/>' src="images/lapiz.gif"
                                            onclick="f_abrir_axisper023('${__formdata.SPERSON}','${__formdata.CAGENTE}')"/>
                                  
                                </div>
                                </div>
                                
                              <table class="seccion">
                                <tr>
                                  <td>
                                  <div class="separador">&nbsp;</div>
                                    <!-- DisplayTag datos parametros persona -->
                                    <c:set var="title1">
                                      <axis:alt f="axisper022" c="TPARAM" lit="9001819"/>
                                    </c:set>
                                    <c:set var="title2">
                                      <axis:alt f="axisper022" c="TVALPAR" lit="101159"/>
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
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisper022" c="DSP_CONTACTOS" lit="101025"/></div>
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
                                    <b><axis:alt f="axisper022" c="TLFFIJO" lit="1000378"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="TLFMOVIL" lit="1000379"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="EMAIL" lit="109792"/></b>
                                </td>
                                <%-- Inici BUG 27814 - RCL - 22/10/2013 - Nuevo contacto FAX en el alta rapida de personas --%>
                                <axis:ocultar c="FAX" f="axisper022" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisper022" c="FAX" lit="9903323"/></b>
                                    </td>
                                </axis:ocultar>
                                <%-- Fi BUG 27814 - RCL - 22/10/2013 - Nuevo contacto FAX en el alta rapida de personas --%>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TLFFIJO}" name="TLFFIJO" id="TLFFIJO" style="width:90%;" <axis:atr f="axisper022" c="TLFFIJO" a="obligatorio=false"/> />
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TLFMOVIL}" name="TLFMOVIL" id="TLFMOVIL" style="width:90%;" <axis:atr f="axisper022" c="TLFMOVIL" a="obligatorio=false"/> />
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.EMAIL}" name="EMAIL" id="EMAIL" style="width:85%;" <axis:atr f="axisper022" c="EMAIL" a="obligatorio=false"/> />
                                </td>
                                <%-- Inici BUG 27814 - RCL - 22/10/2013 - Nuevo contacto FAX en el alta rapida de personas --%>
                                <axis:ocultar c="FAX" f="axisper022" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.FAX}" name="FAX" id="FAX" style="width:85%;" title="<axis:alt f="axisper022" c="FAX" lit="9903323"/>"
                                            <axis:atr f="axisper022" c="FAX" a="obligatorio=false"/>/>
                                    </td>
                                </axis:ocultar>
                                <%-- Fi BUG 27814 - RCL - 22/10/2013 - Nuevo contacto FAX en el alta rapida de personas --%>
                            </tr>
                        </table>
                
                        <c:if test="${__formdata.isNew}">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisper022" c="DSP_DIRECCION" lit="105889"/></div>
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
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CTIPDIR" lit="100565"/></b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="campocaja">
                                    <select name="CTIPDIR" id="CTIPDIR" size="1" class="campowidthselect campo campotexto" style="width:80%;"
                                    	title="<axis:alt f="axisper022" c="CTIPDIR" lit="100565"/> <axis:alt f="axisper022" c="DSP_DIRECCION" lit="105889"/>"
                                    <axis:atr f="axisper022" c="CTIPDIR" a="obligatorio=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstTipoDireccion}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CTIPDIR}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <axis:visible f="axisper022" c="DSP_DIRECCION"> 
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axisper022" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CSIGLAS" lit="110028"/></b>
                                </td>
                                </axis:ocultar>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="TNOMVIA" lit="110029"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="NNUMVIA" lit="800440"/></b>
                                </td>
                                <axis:ocultar c="TCOMPLE" f="axisper022" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="TCOMPLE" lit="110031"/></b>
                                </td>                                
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axisper022" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CSIGLAS" id="CSIGLAS" size="1" class="campowidthselect campo campotexto" style="width:80%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO" lit="1000348"/> - </option>
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
                                    style="width:95%;" maxlength="200" <axis:atr f="axisper022" c="TNOMVIA" a="obligatorio=false"/> />
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMVIA}" name="NNUMVIA" id="NNUMVIA" 
                                    style="width:20%;" maxlength="5"/>
                                </td>
                                <axis:visible c="TCOMPLE" f="axisper022">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TCOMPLE}" name="TCOMPLE" id="TCOMPLE" 
                                    style="width:95%;" maxlength="100"/>
                                </td>                                
                                </axis:visible>
                            </tr>
                         </axis:visible>   
                            <%-- Direccion para colombia --%>
                        <axis:visible f="axisper022" c="DSP_DIRECCIONCOL">  
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
                               <axis:visible f="axisper022" c="CVIAVP"> 

                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CVIAVP" lit="9902408"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper022" c="TNOMVIA"> 
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper012" c="TNOMVIA" lit="9903010"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper022" c="CLITVP"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CLITVP" lit="9902409"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper022" c="CBISVP"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CBISVP" lit="9902410"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper022" c="CORVP"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CORVP" lit="9902411"/></b>
                                </td>
								</axis:visible>
                                
                            </tr>
                            <tr>
								<axis:visible f="axisper022" c="CVIAVP"> 

                                <td class="campocaja">
                                    <select name="CVIAVP" id="CVIAVP" size="1" class="campowidthselect campo campotexto" style="width:80%;" onchange="f_cargar_propiedades_pantalla()"
                                        <axis:atr f="axisper022" c="CVIAVP" a="obligatorio=false"/> title="<axis:alt f="axisper022" c="CSIGLAS2" lit="9902408"/>">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstTipoVia}">
                                            <option value = "${element.CSIGLAS}" 
                                            <c:if test="${element.CSIGLAS == __formdata.CVIAVP}"> selected </c:if> />
                                                ${element.TDENOM} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								<axis:visible f="axisper022" c="TNOMVIA"> 
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA" <axis:atr f="axisper022" c="TNOMVIA" a="obligatorio=false"/> />
                                </td>
								</axis:visible>
								<axis:visible f="axisper022" c="CLITVP"> 
                                <td class="campocaja">
                                    <select name="CLITVP" id="CLITVP" size="1" class="campowidthselect campo campotexto" style="width:70%;"
                                     <axis:atr f="axisper022" c="CLITVP" a="obligatorio=false"/> title="<axis:alt f="axisper022" c="CLITVP" lit="9902409"/>">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCLITVP}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CLITVP}"> selected </c:if> >
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								<axis:visible f="axisper022" c="CBISVP"> 
                                <td class="campocaja">
                                    <select name="CBISVP" id="CBISVP" size="1" class="campowidthselect campo campotexto" style="width:70%;">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCBISVP}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CBISVP}"> selected </c:if> >
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								<axis:visible f="axisper022" c="CORVP"> 
                                <td class="campocaja">
                                    <select name="CORVP" id="CORVP" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="BLANCO" lit="1000348"/> - </option>
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
							    
								<axis:visible f="axisper022" c="NVIAADCO"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="NVIAADCO" lit="9902414"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper022" c="CLITCO"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CLITCO" lit="9902409"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper022" c="CORCO"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CORCO" lit="9902411"/></b>
                                </td>
								</axis:visible>
                                <axis:visible f="axisper022" c="NPLACACO"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="NPLACACO" lit="9902415"/></b>
                                </td>
                                </axis:visible> 
                                
                                <axis:visible f="axisper022" c="COR2CO"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="COR2CO" lit="9902411"/></b>
                                </td>
                                </axis:visible> 
                            </tr>
                            <tr>
							    
								<axis:visible f="axisper022" c="NVIAADCO"> 
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NVIAADCO}" name="NVIAADCO" id="NVIAADCO" 
                                       <axis:atr f="axisper022" c="NVIAADCO" a="obligatorio=false"/>    style="width:70%;" formato="entero" title="<axis:alt f="axisper022" c="NVIAADCO" lit="9902414"/>"/>
                                </td>
								</axis:visible>
								<axis:visible f="axisper022" c="CLITCO"> 
                                <td class="campocaja">
                                    <select name="CLITCO" id="CLITCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCLITCO}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CLITCO}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								<axis:visible f="axisper022" c="CORCO"> 
                                <td class="campocaja">
                                    <select name="CORCO" id="CORCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCORCO}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CORCO}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
                                <axis:visible f="axisper022" c="NPLACACO"> 
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NPLACACO}" name="NPLACACO" id="NPLACACO" 
                                      <axis:atr f="axisper022" c="NPLACACO" a="obligatorio=false"/> style="width:70%;" formato="entero" title="<axis:alt f="axisper022" c="NPLACACO" lit="9902415"/>"/>
                                </td>
                                </axis:visible> 
                                
                                <axis:visible f="axisper022" c="COR2CO"> 
                                <td class="campocaja">
                                    <select name="COR2CO" id="COR2CO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="BLANCO" lit="1000348"/> - </option>
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
                                <axis:visible  f="axisper022" c="CDET1IA">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CDET1IA" lit="9902417"/></b>
                                </td>
                                </axis:visible>
                                
                                <axis:visible  f="axisper022" c="TNUM1IA">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper022" c="TNUM1IA" lit="9902418"/></b>
                                </td>
                                </axis:visible>
                                
                                <axis:visible  f="axisper022" c="CDET2IA">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CDET2IA" lit="9902419"/></b>
                                </td>
                                </axis:visible>
                                
                                <axis:visible  f="axisper022" c="TNUM2IA">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper022" c="TNUM2IA" lit="9902420"/></b>
                                </td>
                                </axis:visible>
                                
                            </tr>
                            <tr>
                                <axis:visible  f="axisper022" c="CDET1IA">
                                <td class="campocaja">
                                    <select name="CDET1IA" id="CDET1IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCDET}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CDET1IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                
                                <axis:visible  f="axisper022" c="TNUM1IA">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.TNUM1IA}" name="TNUM1IA" id="TNUM1IA" 
                                       style="width:90%;" />
                                </td>
                                </axis:visible>                           
                                                               
                                <axis:visible  f="axisper022" c="CDET2IA">
                                <td class="campocaja">
                                    <select name="CDET2IA" id="CDET2IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCDET}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CDET2IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                <axis:visible  f="axisper022" c="TNUM2IA">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.TNUM2IA}" name="TNUM2IA" id="TNUM2IA" 
                                       style="width:90%;" />
                                </td>
                                </axis:visible>
                            
                            </tr>
                            <tr>
                                <axis:visible  f="axisper022" c="CDET3IA">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CDET3IA" lit="9902421"/></b>
                                </td>
                                </axis:visible>
                                
                                <axis:visible  f="axisper022" c="TNUM3IA">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper022" c="TNUM3IA" lit="9902422"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible  f="axisper022" c="CDET3IA">
                                <td class="campocaja">
                                    <select name="CDET3IA" id="CDET3IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCDET}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CDET3IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                
                                <axis:visible  f="axisper022" c="TNUM3IA">                                
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.TNUM3IA}" name="TNUM3IA" id="TNUM3IA" 
                                       style="width:90%;" />
                                </td>
                                </axis:visible>
                            </tr>
                            </table>
                            </td>
                            </tr>
                            </axis:visible>
                            <axis:visible f="axisper022" c="DSP_DIRECCIONCHI" >
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axisper022" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CSIGLAS" lit="110028"/></b>
                                </td>
                                </axis:ocultar>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="TNOMVIA" lit="110029"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="NNUMVIA" lit="9904598"/></b>
                                </td>                     
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axisper022" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CSIGLAS" id="CSIGLAS" size="1" class="campowidthselect campo campotexto" style="width:80%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO" lit="1000348"/> - </option>
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
                                    style="width:95%;" <axis:atr f="axisper022" c="TNOMVIA" a="obligatorio=false"/> />
                                </td>
                                <td class="campocaja" colspan="3" >
                                    <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM1IA}" name="TNUM1IA" id="TNUM1IA" 
                                       style="width:15%;"  maxlength="100"/>
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
                                        <b><axis:alt f="axisper022" c="TNUM2IA" lit="9904595"/></b>
                                    </td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper022" c="TNUM3IA" lit="9904596"/></b>
                                    </td> 
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM2IA}" name="TNUM2IA" id="TNUM2IA" 
                                            style="width:90%;"  title="<axis:alt f="axisper022" c="TNUM2IA" lit="9904595"/>" maxlength="100"/>
                                    </td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM3IA}" name="TNUM3IA" id="TNUM3IA" 
                                            style="width:90%;"  title="<axis:alt f="axisper022" c="TNUM3IA" lit="9904596"/>" maxlength="100"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper022" c="LOCALIDAD" lit="9903353"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.LOCALIDAD}" name="LOCALIDAD" id="LOCALIDAD" 
                                            style="width:90%;"  title="<axis:alt f="axisper022" c="LOCALIDAD" lit="9903353"/>" />
                                    </td>
                                </tr>
                            </axis:visible>
                     
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CPOSTAL" f="axisper022" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CPOSTAL" lit="101081"/></b>
                                </td>    
                                </axis:ocultar>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CPAIS_DIRECCION" lit="100816"/></b>
                                </td>
                                <axis:ocultar c="CPROVIN" f="axisper022" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CPROVIN" lit="100756"/></b>
                                </td>
                                </axis:ocultar>
                                <td class="titulocaja">                                    
                                    <b><axis:alt f="axisper022" c="CPOBLAC" lit="100817"/></b>
                                </td>
 
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
				<axis:ocultar c="CPOSTAL" f="axisper022" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL" 
                                    style="text-transform:uppercase;width:60%;" onblur="f_onblur_CPOSTAL(this.value)"/>
									&nbsp;
									<axis:ocultar c="CPOSTALFIND" f="axisper022" dejarHueco="false">
										<img id="findCpostal" border="0" src="images/find.gif" onclick="f_abrir_axisper042();" style="cursor:pointer" alt=""/>
									</axis:ocultar>
                                </td>  
				</axis:ocultar>                              
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="3" maxlength="3" value="${__formdata.CPAIS_DIRECCION}<c:if test="${empty __formdata.CPAIS_DIRECCION}">${__configform.axisper022__CPAIS_DIRECCION__valordefecto}</c:if>" name="CPAIS_DIRECCION" id="CPAIS_DIRECCION" onchange="f_onchange_CPAIS_DIRECCION()" style="width:18%;" 
                                    title="<axis:alt f="axisper022" c="CPAIS_DIRECCION" lit="100816"/>" <axis:atr f="axisper022" c="CPAIS_DIRECCION" a="obligatorio=true"/>/>&nbsp;<img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                                    &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                                </td>
               <axis:ocultar c="CPROVIN" f="axisper022" dejarHueco="false">
                 
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="3" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;" 
                                    title="<axis:alt f="axisper022" c="CPROVIN" lit="100756"/>" <axis:atr f="axisper022" c="CPROVIN" a="obligatorio=true"/>/>
                                    &nbsp;<img id="findProvincia" style="visibility:${empty __formdata.CPAIS_DIRECCION ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.miForm.CPAIS_DIRECCION.value)"/>                
                                    &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                                </td>
              </axis:ocultar>                  
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="5" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;" 
                                    title="<axis:alt f="axisper022" c="CPOBLAC" lit="100817"/>" <axis:atr f="axisper022" c="CPOBLAC" a="obligatorio=true"/>/>
                                    &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CPROVIN.value, document.miForm.CPOSTAL.value)"/>                
                                    &nbsp;<img id="findPoblacion2" style="visibility:${ ( __formdata.sin_provincias == 1 && !empty __formdata.CPAIS_DIRECCION ) ? 'visible' : 'hidden'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION_NOPROV', document.miForm.CPAIS.value, document.miForm.CPAIS.value)"/>             
                                    &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                                    
                                </td>
 
                            </tr>
                        </table>
                        
                        </c:if>                       
                        
                        <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> <%-- TIDENTI == 2: Persona Jurídica --%> <!-- ** LCF ** __formdata.TIDENTI -->
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisper022" c="DSP_NACIONALIDADES" lit="1000304"/></div>
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
                                    <b><axis:alt f="axisper022" c="CNACIONALIDAD" lit="1000304"/></b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="campocaja">
                                <input type="text"  class="campowidthinput campo campotexto" size="15" maxlength="3" value="${__formdata.CNACIONALIDAD}" name="CNACIONALIDAD" id="CNACIONALIDAD" onchange="f_onchange_CNACIONALIDAD()" style="width:18%;" <axis:atr f="axisper022" c="CNACIONALIDAD" a="obligatorio=false"/> />
                                <img id="findPaisNacionalidad" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS_NACIONALIDAD', null)" style="cursor:pointer"/>
                               
                                <span id="TPAISNACIONALIDAD_span"><b>${__formdata.TPAISNACIONALIDAD}</b></span>
                               
                                </td>
                            </tr>
                        </table>
                        </c:if>
                        
                        <!-- ************************************* DATOS TARJETA       ******************************* -->
                        <axis:visible c="DSP_TARJETAS" f="axisper022">       
                        <c:if test="${__formdata.isNew}">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisper022" c="TARJETAS" lit="9902645"/></div>
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
                                <axis:ocultar f="axisper022" c="CTIPCC_TARJ" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CTIPCC_TARJ" lit="9902671"/></b> <!-- Tipo Tarjeta -->
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper022" c="CTIPBAN_TARJ" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CTIPBAN_TARJ" lit="1000374"/></b> <!-- Tipo Cuenta -->
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper022" c="CBANCAR_TARJ" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CBANCAR_TARJ" lit="9902646"/></b>  <!-- Num. Tarjeta -->
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper022" c="CBANCO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CBANCO" lit="9000964"/></b>  <!-- *** Banco *** -->
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper022" c="CCUENTA" dejarHueco="false">
                                 <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper022" c="CCUENTA" lit="9902646"/></b>  <!-- *** Num. Tarjeta *** -->
                                </td>
                                </axis:ocultar>

                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                
                                <axis:ocultar f="axisper022" c="CTIPCC_TARJ" dejarHueco="false">
                                    <td class="campocaja" >
                                        <select name="CTIPCC_TARJ" id="CTIPCC_TARJ" size="1" class="campowidthselect campo campotexto" style="width:99%;"
                                                onchange=""
                                                title="<axis:alt f="axisper022" c="CTIPCC_TARJ_LIT" lit="1000374"/>"
                                                <axis:atr f="axisper022" c="CTIPCC_TARJ" a="obligatorio=false"/>>&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="CTIPCC_TARJ_ALT2" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.tipBCC_tarjetas}">
                                                <option value = "${element.CATRIBU}" 
                                               <c:if test="${element.CATRIBU == __formdata.CTIPCC_TARJ}"> selected </c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar> 
                            
                                
                                <axis:ocultar f="axisper022" c="CTIPBAN_TARJ" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CTIPBAN_TARJ" id="CTIPBAN_TARJ" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                    onchange="">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipTarjeta}">
                                            <option value = "${element.CTIPBAN}" 
                                            <c:if test="${element.CTIPBAN == __formdata.CTIPBAN_TARJ}"> selected </c:if> />
                                                ${element.TTIPO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper022" c="CBANCAR_TARJ" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CBANCAR_TARJ}" name="CBANCAR_TARJ" id="CBANCAR_TARJ" style="width:80%;"/>
                                </td>
                                </axis:ocultar>
                                
                               
                                <axis:ocultar f="axisper022" c="CBANCO_TARJ" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CBANCO_TARJ" id="CBANCO_TARJ"  <axis:atr f="axisper022" c="CBANCO_TARJ" a="obligatorio=false"/> title="<axis:alt f="axisper022" c="CBANCO_TARJ_ALT1" lit="9000964"/>" size="1" class="campowidthselect campo campotexto" style="width:99%;" >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO_CBANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipBANCO}">
                                            <option value = "${element.CBANCO}" 
                                            <c:if test="${element.CBANCO == __formdata.CBANCO_TARJ}"> selected </c:if> />
                                                ${element.TBANCO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisper022" c="CCUENTA_TARJ" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <input type="text"  <axis:atr f="axisper022" c="CCUENTA_TARJ"  a="obligatorio=false"/>  title="<axis:alt f="axisper022" c="CCUENTA_TARJ_ALT" lit="9902646"/>"  class="campowidthinput campo campotexto" maxlength="20" size="15" value="${__formdata.CCUENTA_TARJ}" name="CCUENTA_TARJ" id="CCUENTA_TARJ" style="width:80%;"/>
                                </td>
                                </axis:ocultar>                         
                                
                            </tr>
                            
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="FVENCIM" lit="100885"/></b> <!-- Fecha vencimiento -->
                                </td>
                                <axis:ocultar f="axisper022" c="TSEGURI" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="TSEGURI" lit="9902634"/></b>  <!-- Cod. Seguridad -->
                                </td>
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                
                                <td class="campocaja">
                                    <input type="text"  class="campowidthinput campo campotexto" size="10" value="${__formdata.FVENCIM}" name="FVENCIM" id="FVENCIM"  style="width:65%;"
                                    <axis:atr f="axisper022" c="FVENCIM_SIG" a="obligatorio=false"/> readonly  title="<axis:alt f="axisper022" c="FVENCIM_TIT" lit="100885"/>"  /> 
                                    <img id="popup_FVENCIM" alt="<axis:alt f="axisper022" c="SEL_FVENCIM" lit="100885"/>" title="<axis:alt f="axisper022" c="ALT_FVENCIM" lit="100885" />" src="images/calendar.gif"/></a>
                                </td>
                                <axis:ocultar f="axisper022" c="TSEGURI" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TSEGURI}" name="TSEGURI" id="TSEGURI" style="width:60%;"/>
                                </td>
                                </axis:ocultar>
                            </tr>                        
                            
                        </table>                        
                        </c:if>
                        
                        </axis:visible>
                        
                        <!-- ********************************* DATOS CUENTAS BANCARIOS ******************************* -->
                       <axis:visible c="DSP_CCC" f="axisper022">    
                        <c:if test="${__formdata.isNew}">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisper022" c="DSP_CCC" lit="1000091"/></div>
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
                                <axis:ocultar f="axisper022" c="CTIPCC" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CTIPCC" lit="1000374"/></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper022" c="CTIPBAN_CCC" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CTIPBAN" lit="1000374"/></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper022" c="CBANCAR" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CBANCAR" lit="100965"/></b>
                                </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axisper022" c="CBANCO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper022" c="CBANCO" lit="9000964"/></b>  <!-- *** Banco *** -->
                                </td>
                                </axis:ocultar>
                                
                                 <axis:ocultar f="axisper022" c="CCUENTA" dejarHueco="false">
                                 <td class="titulocaja" colspan="2" >
                                    <b><axis:alt f="axisper022" c="CCUENTA" lit="100965"/></b>  <!-- *** Cuenta Bancaria *** -->
                                </td>
                                </axis:ocultar> 
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                        
                                 <axis:ocultar f="axisper022" c="CTIPCC" dejarHueco="false">
                                    <td class="campocaja" >
                                        <select name="CTIPCC" id="CTIPCC" size="1" class="campowidthselect campo campotexto" style="width:99%;"
                                                onchange=""
                                                title="<axis:alt f="axisper022" c="CTIPCC_LIT" lit="1000374"/>"
                                                <axis:atr f="axisper022" c="CTIPCC" a="obligatorio=false"/>>&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="CTIPCC_ALT2" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.tipBCC_cuentas}">
                                                <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CTIPCC}"> selected </c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar> 
                                
                                <axis:ocultar f="axisper022" c="CTIPBAN_CCC" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CTIPBAN" id="CTIPBAN" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                    onchange="javascript:document.miForm.CBANCAR.value = '';">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipCCC}">
                                            <option value = "${element.CTIPBAN}" 
                                            <c:if test="${element.CTIPBAN == __formdata.CTIPBAN}"> selected </c:if> />
                                                ${element.TTIPO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper022" c="CBANCAR" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CBANCAR}" name="CBANCAR" id="CBANCAR" style="width:80%;"/>
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisper022" c="CBANCO" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CBANCO" id="CBANCO"  <axis:atr f="axisper022" c="CBANCO" a="obligatorio=false"/> title="<axis:alt f="axisper022" c="CBANCO_ALT1" lit="9000964"/>" size="1" class="campowidthselect campo campotexto" style="width:99%;" >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO_CBANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipBANCO}">
                                            <option value = "${element.CBANCO}" 
                                            <c:if test="${element.CBANCO == __formdata.CBANCO}"> selected </c:if> />
                                                ${element.TBANCO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                               </axis:ocultar>                        
                               <axis:ocultar f="axisper022" c="CCUENTA" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <input type="text"  <axis:atr f="axisper022" c="CCUENTA"  a="obligatorio=false"/>  title="<axis:alt f="axisper022" c="CCUENTA_ALT" lit="100965"/>"  class="campowidthinput campo campotexto" maxlength="20" size="15" value="${__formdata.CCUENTA}" name="CCUENTA" id="CCUENTA" style="width:99%;"/>
                                </td>
                               </axis:ocultar>
                                
                            </tr>
                        </table>  
                        
                        </c:if>
                        </axis:visible>
                        <axis:visible c="DSP_REGFISCAL" f="axisper022">   
                        <c:if test="${__formdata.isNew}">
                        
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisper022" c="REGFISCAL" lit="9902257"/></div>
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
                                <axis:visible f="axisper022" c="FEFECTO">
                                        <td class="titulocaja" id="LIT_FEFECTO">
                                            <b><axis:alt f="axisper022" c="FEFECTO" lit="100883"/></b>
                                        </td>
                                </axis:visible>                                
                                <axis:visible f="axisper022" c="CREGFISCAL">
                                    <td class="titulocaja"> <b><axis:alt f="axisper022" c="LIT_CREGFISCAL" lit="9902257"/></b></td><!-- Regimen fiscal -->  
                                </axis:visible>                           
                            </tr>
                            <tr>
                             <td>
                                    &nbsp;
                                </td>
                              <axis:visible f="axisper022" c="FEFECTO" >
                                    <td class="campocaja">
                                                        <input type="text" onblur="javascript:f_formatdate(this,'')" formato="fecha" <axis:atr f="axisper022" c="FEFECTO" a="formato=fecha&modificable=true&isInputText=true"/>  alt="<axis:alt f="axisper022" c="FEFECTO" lit="100883"/>" title="<axis:alt f="axisper022" c="FEFECTO" lit="100883"/>"
                                                        name="FEFECTO" id="FEFECTO"  value="<fmt:formatDate value="${__formdata.FEFECTO}" pattern="dd/MM/yyyy" />" style="width:100px;" class="campowidthinput campo campotexto"/>
                                                        <axis:visible c="ICO_FEFECTO" f="axisper022">
                                                            <a id="icon_FEFECTO" style="vertical-align:middle;">
                                                            <img alt="<axis:alt f="axisper022" c="SELECT" lit="108341"/>" title="<axis:alt f="axisper022" c="ICO_FEFECTO" lit="100883" />" src="images/calendar.gif"/></a>
                                                        </axis:visible>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisper022" c="CREGFISCAL">
                                    <td class="campocaja">
                                        <select name="CREGFISCAL" id="CREGFISCAL" 
                                            <axis:atr f="axisper022" c="CREGFISCAL" a="modificable=true&isInputText=false"/> 
                                            size="1" class="campowidthselect campo campotexto" style="width:90%;">&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper022" c="SNV_COMBO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.regFisc}">
                                                <option value = "${element.CREGFISCAL}" 
                                                <c:if test="${element.CREGFISCAL == __formdata.CREGFISCAL}"> selected </c:if> />
                                                    ${element.TREGFISCAL} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>                                                           
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
         
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper022</c:param>
                <c:param name="__botones">cancelar<c:if test="${!empty __formdata.esHost && __formdata.esHost == 0}">,9000554</c:if><c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}">,aceptar</c:if></c:param>
            </c:import>
        </form>
        
    <%--    <c:if test="${(empty __formdata.CTIPPER || __formdata.CTIPPER != 2) && empty __formdata.SPEREAL}"> <%-- TIDENTI == 2: Persona Jurídica --%> <!-- ** LCF ** __formdata.TIDENTI -->
        <c:if test="${__formdata.isNew && empty __formdata.FNACIMIcerca || empty __formdata.SPEREAL || empty __formdata.FNACIMI}">
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
</html>

