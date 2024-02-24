<%/* Revision:# e8JTYpQZ1vfMC5Wn99GwnQ== # */%>
<!--**********************************************AXISADM093 JSP ******************************** -->
<!--*********************************** Payment and Breakdown without selecting invoice ******************************** -->
<!--*********************************** JOHN BENITEZ  - ABRIL 2015 - BUG 33886/199826 ******************************** -->
<!-- INCLUDING LIBRARIES AND SETTING LOCAL VARIABLES -->
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- HTML START -->
<html>
<!-- HEAD START -->
<head>
       <!-- HEAD IMPORTS -->
       <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
       <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
       <link rel="stylesheet" href="styles/displaytag.css"></link>
       <style type="text/css" id="page-css"> </style>
       <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
       <c:import url="../include/carga_framework_js.jsp"/>
       <c:import url="../include/precargador_ajax.jsp">
       <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
       </c:import>
          <!-- CALENDAR -->
          <!-- Calendar css -->
          <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
          <!-- Calendar Scripts -->
          <script type="text/javascript" src="scripts/calendar.js"></script>
          <!-- Calendar Language-->
          <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
          <!-- Calendar Setup -->
          <script type="text/javascript" src="scripts/calendar-setup.js"></script>
<!--************************ JAVASCRIPTS FUNCTIONS ************************* -->
<!-- JAVASCRIPTS FUNCTIONS START -->
<script  language="Javascript" type="text/javascript">
/****************************************************************************************/
/************************************** LOAD PAGE***********************************/
/****************************************************************************************/ 
    function f_onload() {
        f_cargar_propiedades_pantalla();
    }  
/****************************************************************************************/
/************************************** BUTTON´S ACTIONS**********************************/
/****************************************************************************************/ 
    function f_but_salir() {
        objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
    }
    
    function f_but_9907708() {
    
        if (objValidador.validaEntrada()){
            //validating inputs and lists
            if (objUtiles.estaVacio(document.miForm.PAYER.value)||objUtiles.estaVacio(document.miForm.PAYERID.value)){
                alert('<axis:alt f="axisadm093" c="CHNUM" lit="9908087"/>');            
            }else if (document.miForm.FINDPAYS.value=="null"){
                alert( '<axis:alt f="axisadm093" c="CHNUM" lit="9908094"/>');
            }else if(ValPayMethod()==true){                 
                if(document.miForm.AMOPAY.value != document.miForm.SUM.value){
                    alert('<axis:alt f="axisadm093" c="CHNUM" lit="9908095"/>');  
                }
                else{
                    var PSPERSON = objDom.getValorPorId("SPERSON_REL");  
                    var PCURRENCY = objDom.getValorPorId("CURRENCY");
                    var PPAYREASON = objDom.getValorPorId("PAYREASON");
                    var PAMOPAY = objDom.getValorPorId("AMOPAY");
                    var PDATEREC = objDom.getValorPorId("DATEREC");
                    var PPAYMET = objDom.getValorPorId("PAYMET");
                    var PCHTYPE = objDom.getValorPorId("CHTYPE");
                    var PTID = objDom.getValorPorId("TID");
                    var PPAYTEXT = objDom.getValorPorId("PAYTEXT");  
                    var PBNAME = objDom.getValorPorId("BNAME");
                    var POBANK = objDom.getValorPorId("OBANK");
                    var PCHNUM = objDom.getValorPorId("CHNUM");
                    var PCLIMOP = objDom.getValorPorId("CLIMOP");
                    var PCHDRTYPE = objDom.getValorPorId("CHDRTYPE");
                    var PACCONUM = objDom.getValorPorId("ACCONUM");
                  var PACCOHOLD = objDom.getValorPorId("ACCOHOLD");
                  var PMENSWARNINFO = objDom.getValorPorId("MENSWARNINFO");
                  objAjax.invokeAsyncCGI("axis_axisadm093.do", callbackGuardarEmitir, "operation=DoTransaction&SPERSON_REL=" + PSPERSON + "&CURRENCY=" + PCURRENCY + "&PAYREASON=" + PPAYREASON + "&AMOPAY=" + PAMOPAY + "&DATEREC=" + PDATEREC + "&PAYMET=" + PPAYMET + "&CHTYPE=" + PCHTYPE + "&TID=" + PTID + "&PAYTEXT=" + PPAYTEXT + "&BNAME=" + PBNAME + "&OBANK=" + POBANK + "&CHNUM=" + PCHNUM + "&CLIMOP=" + PCLIMOP + "&CHDRTYPE=" + PCHDRTYPE + "&ACCONUM=" + PACCONUM + "&ACCOHOLD=" + PACCOHOLD+"&MENSWARNINFO="+PMENSWARNINFO, this, '<axis:alt f="axisctr009" c="JSLIT_ENVIAR" lit="1000399"/>');
                }            
            }
        }
    }
  
  
    function callbackGuardarEmitir (ajaxResponseText) {
    
        var doc = objAjax.domParse(ajaxResponseText);             
        var  TIPERROR = 0;
        var CERROR = 0;
        var TERROR = "";          
        try{
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                objDom.setVisibilidadPorId("but_9907708", "hidden");
                objDom.setVisibilidadPorId("BT_BT_SHPERSON", "hidden");
                var PTID = objDom.getValorPorId("TID");
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=refdeposito&MENSAJE= &CTIPO=REFDEPOSITO&REFDEPOSITO="+PTID , 0, 0);
            }
        } 
        catch (e) {
        TIPERROR = 0;
        CERROR = 0;
        TERROR = 0;
        }
    }

    /****************************************************************************************/
    /************************************** AXISADM093A****************************************/
    /****************************************************************************************/ 
    function f_abrir_axisadm093a() {
        if (objValidador.validaEntrada()){
            objUtiles.abrirModal("axisadm093a","src","modal_axisadm093a.do?operation=form");
        }
    }
 
    function f_cerrar_axisadm093a(){
        objUtiles.cerrarModal("axisadm093a");
    }
   
    function f_aceptar_axisadm093a (POLIZA,MONTO) {
        objUtiles.cerrarModal("axisadm093a");    
        
        var PAYMET = document.miForm.PAYMET.value;
        
        if (objUtiles.estaVacio(document.miForm.AMOPAY.value) && PAYMET != 9 ){
            alert('<axis:alt f="axisadm093" c="CHNUM" lit="9908090"/>');  
        }
        else{
            var TID;
            document.miForm.POLICY.value=POLIZA;
            document.miForm.AMOUNT.value=MONTO;
            TID=document.miForm.TID.value;
            var PERSON = document.miForm.SPERSON_REL.value;
            var AMOPAY;
            
            if (PAYMET != 9){
              AMOPAY = document.miForm.AMOPAY.value;
            }else{
              AMOPAY = document.miForm.MONPOL.value;
            }
            
            var params = "&AMOUNT="+MONTO+"&POLICY="+POLIZA+"&AMOPAY="+AMOPAY+"&TID="+TID+"&SPERSON_REL="+PERSON;
            objAjax.invokeAsyncCGI("axis_axisadm093.do", CallbackReloadTable, "operation=ajax_search_amount" + params, this, objJsMessages.jslit_cargando);
        }
        
        
        
        
        
    }                      
/****************************************************************************************/
/***************************** REALOADING TABLE WITH AJAX DATA*************************/
/****************************************************************************************/
  function CallbackReloadTable(ajaxResponseText){
 
        var doc=objAjax.domParse(ajaxResponseText);
        
        
       
           //vars and cycle FOR to verify if stempo is 1,null or different
                      var CatchOne = new Array(1); 
                      var NoYesOne;
                      for (var j = 0; j < objDom.numeroDeTags(doc, "SEQTEMPO") ; j++) {
          CatchOne[0] = parseInt(
          ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SEQTEMPO")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("SEQTEMPO"), 0, 0) : "")
          );
          
          if (CatchOne[0] == 1) {
              NoYesOne = true;
          }
          else {
              NoYesOne = false;

          }
      }
      if (NoYesOne == null) {
          document.miForm.FINDPAYS.value = "null";
      }
      else {
          document.miForm.FINDPAYS.value = 1;
      }
           //starting ajax paint
     if (NoYesOne==false || NoYesOne ==null){ 
     
       
           //var Plus to Sum all premiums
           var Plus = 0;
           //getting the table params
           var table = document.getElementById("MODINVFONDO");
           var tbody = table.getElementsByTagName("tbody")[0];
           var tr = tbody.getElementsByTagName("tr");
           // delete existing rows
           objLista.borrarFilasDeLista ("MODINVFONDO", "6", "<axis:alt f='axisadm093' c='MODINVFONDO_LIT_EMPTY' lit='1000254' />");
           //if  find data, delete "not data found"
           if (objDom.existeTag(doc, "SEQTEMPO"))
                objLista.borrarFilaVacia(tbody, tr);
            
                
           //painting data in the table
           for (var i = 0; i < objDom.numeroDeTags(doc, "NPOLIZA") ; i++) {
           
           
              // row style
              var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
              // Creating row, putting style
              var newtr = objLista.crearNuevaFila(rowstyle);
              // row array
              var newtd = new Array(5); 
              // Creating columns and putting in the array
              //newtd[0] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPOLIZA"), i, 0));
              newtd[0] = objLista.addTextoEnLista(((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NPOLIZA")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPOLIZA"), i, 0) : ""));
              //newtd[1] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), i, 0));
              newtd[1] = objLista.addTextoEnLista(((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), i, 0) : ""));
             // newtd[2] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("ITOTPRI"), i, 0));
              newtd[2] = objLista.addTextoEnLista(((objUtiles.hayValorElementoXml(doc.getElementsByTagName("ITOTPRI")[i]))? objNumero.formateaNumeroMoneda(objDom.getValorNodoDelComponente(doc.getElementsByTagName("ITOTPRI"), i, 0)) : ""));
             // newtd[3] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CDEBHAB"), i, 0));
              newtd[3] = objLista.addTextoEnLista(((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CDEBHAB")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CDEBHAB"), i, 0) : ""));
              newtd[4] = objLista.addTextoEnLista('<img src="images/delete.gif" onclick="f_del(' + objDom.getValorNodoDelComponente(doc.getElementsByTagName("SEQTEMPO"), i, 0) + ')" />');
              //newtd[4] = objLista.addTextoEnLista('<img src="images/delete.gif" onclick="f_del(' +((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SEQTEMPO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("SEQTEMPO"), i, 0) : ""));
                     Plus = Plus + parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("ITOTPRI"), i, 0));
                   // Add new row and columns
              objLista.addNuevaFila(newtd, newtr, tbody);
            } 
           // deleting error messages 
           document.getElementById('labelo').innerHTML = '';
           document.getElementById('labelFail').innerHTML = '';
           document.getElementById('labelSum').innerHTML = 'Total Premium´s Sum:  ' + objNumero.formateaNumeroMoneda(Plus);
           document.miForm.SUM.value = objNumero.formateaNumeroMoneda(Plus);
     }else {
     
 
     
         // paint in labels error messages when add a amount fail
         document.getElementById('labelFail').innerHTML =  '<axis:alt f="axisadm093" c="CHNUM" lit="9908096"/>';
         document.getElementById('labelFail').innerHTML = '<axis:alt f="axisadm093" c="CHNUM" lit="9908097"/>';
     }
  } 
         
    function f_del (STEMPO) {
        var TID;
        TID=document.miForm.TID.value;
        document.miForm.STEMPO.value=STEMPO;
        var params = "&STEMPO="+STEMPO+"&TID="+TID;
        objAjax.invokeAsyncCGI("axis_axisadm093.do", CallbackReloadTable, "operation=ajax_delete_amount" + params, this, objJsMessages.jslit_cargando);
    }
/****************************************************************************************/
/************************************** AXISADM093B****************************************/
/****************************************************************************************/
    function f_cerrar_axisadm093b(){
        objUtiles.cerrarModal("axisadm093b");
    }
  
    function f_abrir_axisadm093b() {
        objUtiles.abrirModal("axisadm093b","src","modal_axisadm093b.do?operation=init");
    }
  
    function f_aceptar_axisadm093b (NNUMIDE,NOMBRE) {
        objUtiles.cerrarModal("axisadm093b");
        document.miForm.PAYER.value=NOMBRE;
        document.miForm.PAYERID.value=NNUMIDE;
    } 
/****************************************************************************************/
/************************************** OTHERS - UTILITIES*********************************/
/****************************************************************************************/
    function isInteger(value){
        var re = /^\-?[0-9]+$/;
        return re.test(value);
    }
           
    function isDate(value){
        var re = /^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$/g; 
        return re.test(value);
    }
           
  function ValPayMethod() {
      var Allowed;
    
      Allowed = true;
        return Allowed;
  }
  
    function f_cerrar_modalespersona(modal){
        objUtiles.cerrarModal(modal);
    }
    
    function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
        f_cerrar_modalespersona(modal);
        var porigen = 'INT';
        if (modal == 'axisper022')
            porigen = 'NUEVO';
        
        document.miForm.ORIGEN.value = porigen;
        document.miForm.SNIP.value = SNIP;      
        document.miForm.CAGENTE_VISIO.value = CAGENTE;
        
         if (!objUtiles.estaVacio(SPERSON)){          
          objAjax.invokeAsyncCGI("axis_axisadm093.do?SPERSON_REL=" + SPERSON + "&CAGENTE1=" + CAGENTE, callbackAjaxActualizaPersona, "operation=ajax_actualizar_persona", this, objJsMessages.jslit_cargando);
        }
    }
    
    function callbackAjaxActualizaPersona (ajaxResponseText) {
        try{            
            var doc = objAjax.domParse(ajaxResponseText);            
            
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
            
                objDom.setValorPorId("PAYERID", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));                
                var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
                var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");
                var NOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");
                var MONPOL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("MONTO")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("MONTO"), 0, 0) : "");
                objDom.setValorPorId("PAYER", NOMBRE + ' ' + APELLIDO1 + ' ' + APELLIDO2);  
                //objDom.setValorPorId("MONPOL", MONPOL); 
                val_numberMonpol(MONPOL);
                objDom.setValorPorId("SPERSON_REL", objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
            
            }          
            
        }catch(e){}
    }
    
    function f_abrir_axisper021 () {
        var SSEGURO = "${__formdata.SSEGURO}";
        var CAGENTE = "${__formdata.CAGENTE}";
        objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE+"&SSEGURO="+SSEGURO);
    }
    
    function f_nova_persona(){
        f_cerrar_modalespersona("axisper021");
        var CAGENTE = "${__formdata.CAGENTE_PERSN}";
        objUtiles.abrirModal("axisper022", "src", "modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE);  
    }
    
    function f_cerrar_axisper022(){
        f_cerrar_modalespersona("axisper022");
    }
    
    function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
                objUtiles.ejecutarFormulario ("axis_axisadm093.do", "init", document.miForm, "_self");
         
            }
    
    function val_number(valor){
        try{
            if (objDom.getValorPorId('PAYMET') == 6){                
                if(!objUtiles.estaVacio(valor)){
                    if(objNumero.validarNegativos(valor)){
                        entrada = objNumero.formateaNumero(valor, true);  
                        entrada = objNumero.quitarSeparadorMiles(entrada);
                        document.miForm.AMOPAY.value = objNumero.formateaNumeroMoneda(valor);
                    }
                    else {
                        alert(objJsMessages.jslit_valor_numerico);
                        document.miForm.AMOPAY.value = '';
                        document.miForm.AMOPAY.focus();
                    }
                }
            }
            else{
                valor = objValidador.valorFormateadoCampoNumerico(valor, true, false);
                if(objNumero.validaNumero(valor, true)) {
                    document.miForm.AMOPAY.value = objNumero.formateaNumeroMoneda(valor);                        
                }else{
                    document.miForm.AMOPAY.value = '';
                    document.miForm.AMOPAY.focus();
                }    
            }
        }catch(e){
            alert (e.name + " " + e.message);
        }
    }
    
/****************************************************************************************/
/************************************** PAGO DE LA POLIZA 0******************************/
/****************************************************************************************/    
  
    function f_proceso_pol(){
      var pagoPolizaCero = 0;
       
       var table = document.getElementById("MODINVFONDO");
        for (var i = 1, row; row = table.rows[i]; i++) {
           //iterate through rows
           //rows would be accessed using the "row" variable assigned in the for loop
         var vPolizas = document.getElementById('MODINVFONDO').rows[i].cells[0].textContent ;
             //console.log(document.getElementById('MODINVFONDO').rows[i].cells[0]);
             
             if(vPolizas == 0){
               pagoPolizaCero = 1;
               break;
             }
             
         
        }
       
       
        if(pagoPolizaCero != 0){
            alert('<axis:alt f="axisadm093" c="CHNUM" lit="9908852"/>');   
        }
        else if (objUtiles.estaVacio(document.miForm.PAYER.value) || objUtiles.estaVacio(document.miForm.PAYERID.value)){
            alert('<axis:alt f="axisadm093" c="CHNUM" lit="9908087"/>');        
        }
        else if (document.miForm.MONPOL.value <= 0){
            alert('<axis:alt f="axisadm093" c="CHNUM" lit="9908444"/>');        
        }
		else if (document.miForm.PAYMET.value != 9){
            alert('<axis:alt f="axisadm093" c="CHNUM" lit="9908984"/>');   
        }else {  
            if  (document.miForm.MONPOL.value != document.miForm.SUM.value){
                alert('<axis:alt f="axisadm093" c="CHNUM" lit="9908095"/>');  
            }
            else{            
                var PSPERSON = objDom.getValorPorId("SPERSON_REL");
                var MONPOL = objDom.getValorPorId("MONPOL");
                var PTID = objDom.getValorPorId("TID");
                var PCURRENCY = objDom.getValorPorId("CURRENCY");
                var PPAYREASON = objDom.getValorPorId("PAYREASON");
                var PAMOPAY = objDom.getValorPorId("AMOPAY");
                var PDATEREC = objDom.getValorPorId("DATEREC");
                var PPAYMET = objDom.getValorPorId("PAYMET");
                var PCHTYPE = objDom.getValorPorId("CHTYPE");
                var PPAYTEXT = objDom.getValorPorId("PAYTEXT");  
                var PBNAME = objDom.getValorPorId("BNAME");
                var POBANK = objDom.getValorPorId("OBANK");
                var PCHNUM = objDom.getValorPorId("CHNUM");
                var PCLIMOP = objDom.getValorPorId("CLIMOP");
                var PCHDRTYPE = objDom.getValorPorId("CHDRTYPE");
                var PACCONUM = objDom.getValorPorId("ACCONUM");            
                objAjax.invokeAsyncCGI("axis_axisadm093.do", f_recargar, "operation=PagoPoliza&SPERSON_REL=" + PSPERSON + "&MONPOLI=" + MONPOL+"&TIDE="+PTID +"&CURRENCY="+PCURRENCY+"&PAYREASON="+PPAYREASON+"&AMOPAY="+PAMOPAY+"&DATEREC="+PDATEREC+
                "&PAYMET="+PPAYMET+"&CHTYPE="+PCHTYPE+"&TID="+PTID+"&PAYTEXT="+PPAYTEXT+"&BNAME="+PBNAME+"&OBANK="+POBANK+"&CHNUM="+PCHNUM+"&CLIMOP="+PCLIMOP+"&CHDRTYPE="+PCHDRTYPE+"&ACCONUM="+PACCONUM, this, '<axis:alt f="axisctr009" c="JSLIT_ENVIAR" lit="1000399"/>');            
            }        
        }    
    }
    
    function f_limpia_monto(){
       document.miForm.AMOPAY.value = '';
    }

  function f_dependencia() {
      var TIPOCHEQUE = objDom.getValorPorId("CHTYPE");
      
      
      if (TIPOCHEQUE == 0 || TIPOCHEQUE == 2) {
          document.getElementById("PAYTEXT").style.visibility = 'hidden';
          document.getElementById("tit_PAYTEXT").style.visibility = 'visible';
          document.getElementById("OBANK").style.visibility = 'visible';
          document.getElementById("tit_OBANK").style.visibility = 'visible';
          document.getElementById("CHDRTYPE").style.visibility = 'hidden';
          document.getElementById("tit_CHDRTYPE").style.visibility = 'hidden';
          document.getElementById("tit_BNAME").style.visibility = 'visible';
          document.getElementById("BNAME").style.visibility = 'visible';
          document.getElementById("tit_CHNUM").style.visibility = 'visible';
          document.getElementById("CHNUM").style.visibility = 'visible';
          document.getElementById("tit_ACCONUM").style.visibility = 'visible';
          document.getElementById("ACCONUM").style.visibility = 'visible';
          document.getElementById("tit_ACCOHOLD").style.visibility = 'visible';
          document.getElementById("ACCOHOLD").style.visibility = 'visible';
          document.getElementById("PAYTEXT").style.visibility = 'visible';
          
          document.getElementById("ACCONUM").className  = "campowidthinput campo campotexto campotexto_ob";
          document.getElementById("BNAME").className  = "campowidthinput campo campotexto campotexto_ob";
          document.getElementById("CHNUM").className  = "campowidthinput campo campotexto campotexto_ob";
          document.getElementById("PAYTEXT").className  = "campowidthinput campo campotexto campotexto_ob";
          
          if (TIPOCHEQUE == 0){
                document.getElementById("ACCOHOLD").className  = "campowidthinput campo campotexto";
                document.miForm.ACCOHOLD.setAttribute("obligatorio","false");
            }
            if (TIPOCHEQUE == 2){
                document.getElementById("ACCOHOLD").className  = "campowidthinput campo campotexto campotexto_ob";
                document.miForm.ACCOHOLD.setAttribute("obligatorio","true");
            }

          document.miForm.ACCONUM.setAttribute("obligatorio","true");
          document.miForm.BNAME.setAttribute("obligatorio","true");
          document.miForm.CHNUM.setAttribute("obligatorio","true");
          document.miForm.PAYTEXT.setAttribute("obligatorio","true");

          
                    
          objAjax.invokeAsyncCGI("axis_axisadm093.do?TCHEQUE= "+TIPOCHEQUE, callbackCargarLista, "operation=loadBox", this, '<axis:alt f="axisctr009" c="JSLIT_ENVIAR" lit="1000399"/>');


      }

      if (TIPOCHEQUE == 1) {
          
          document.getElementById("OBANK").style.visibility = 'visible';
          document.getElementById("tit_OBANK").style.visibility = 'visible';
          document.getElementById("CHDRTYPE").style.visibility = 'visible';
          document.getElementById("tit_CHDRTYPE").style.visibility = 'visible';
          document.getElementById("tit_BNAME").style.visibility = 'visible';
          document.getElementById("BNAME").style.visibility = 'visible';
          document.getElementById("tit_CHNUM").style.visibility = 'visible';
          document.getElementById("CHNUM").style.visibility = 'visible';
          document.getElementById("tit_ACCONUM").style.visibility = 'visible';
          document.getElementById("ACCONUM").style.visibility = 'visible';
          document.getElementById("tit_ACCOHOLD").style.visibility = 'visible';
          document.getElementById("ACCOHOLD").style.visibility = 'visible';
          document.getElementById("PAYTEXT").style.visibility = 'visible';
          document.getElementById("tit_PAYTEXT").style.visibility = 'visible';

         
          document.getElementById("ACCONUM").className  = "campowidthinput campo campotexto campotexto_ob";
          document.getElementById("BNAME").className  = "campowidthinput campo campotexto campotexto_ob";
          document.getElementById("CHNUM").className  = "campowidthinput campo campotexto campotexto_ob";
          document.getElementById("ACCOHOLD").className  = "campowidthinput campo campotexto campotexto_ob";
          //document.getElementById("CHDRTYPE").className  = "campowidthinput campo campotexto campotexto_ob";
          document.getElementById("PAYTEXT").className  = "campowidthinput campo campotexto campotexto_ob";


          document.miForm.ACCONUM.setAttribute("obligatorio","true");
          document.miForm.BNAME.setAttribute("obligatorio","true");
          document.miForm.CHNUM.setAttribute("obligatorio","true");
          document.miForm.ACCOHOLD.setAttribute("obligatorio","true");
          document.miForm.PAYTEXT.setAttribute("obligatorio","true");
          
          
          
          objAjax.invokeAsyncCGI("axis_axisadm093.do?TCHEQUE= "+TIPOCHEQUE, callbackCargarLista, "operation=loadBox", this, '<axis:alt f="axisctr009" c="JSLIT_ENVIAR" lit="1000399"/>');

      }
      
      if (TIPOCHEQUE == 3) {
      
          document.getElementById("PAYTEXT").style.visibility = 'visible';
          document.getElementById("tit_PAYTEXT").style.visibility = 'visible';
          document.getElementById("OBANK").style.visibility = 'hidden';
          document.getElementById("tit_OBANK").style.visibility = 'hidden';
          document.getElementById("CHDRTYPE").style.visibility = 'visible';
          document.getElementById("tit_CHDRTYPE").style.visibility = 'visible';
          document.getElementById("tit_BNAME").style.visibility = 'hidden';
          document.getElementById("BNAME").style.visibility = 'hidden';
          document.getElementById("tit_CHNUM").style.visibility = 'hidden';
          document.getElementById("CHNUM").style.visibility = 'hidden';
          document.getElementById("tit_ACCONUM").style.visibility = 'hidden';
          document.getElementById("ACCONUM").style.visibility = 'hidden';
          document.getElementById("tit_ACCOHOLD").style.visibility = 'hidden';
          document.getElementById("ACCOHOLD").style.visibility = 'hidden';
          
         objAjax.invokeAsyncCGI("axis_axisadm093.do?TCHEQUE= "+TIPOCHEQUE, callbackCargarLista, "operation=loadBox", this, '<axis:alt f="axisctr009" c="JSLIT_ENVIAR" lit="1000399"/>');

      }
      
      if (TIPOCHEQUE == 4) {
        
          document.getElementById("PAYTEXT").style.visibility = 'visible';
          document.getElementById("tit_PAYTEXT").style.visibility = 'visible';
          document.getElementById("OBANK").style.visibility = 'hidden';
          document.getElementById("tit_OBANK").style.visibility = 'hidden';
          document.getElementById("CHDRTYPE").style.visibility = 'hidden';
          document.getElementById("tit_CHDRTYPE").style.visibility = 'hidden';
          document.getElementById("tit_BNAME").style.visibility = 'hidden';
          document.getElementById("BNAME").style.visibility = 'hidden';
          document.getElementById("tit_CHNUM").style.visibility = 'hidden';
          document.getElementById("CHNUM").style.visibility = 'hidden';
          document.getElementById("tit_ACCONUM").style.visibility = 'hidden';
          document.getElementById("ACCONUM").style.visibility = 'hidden';
          document.getElementById("tit_ACCOHOLD").style.visibility = 'hidden';
          document.getElementById("ACCOHOLD").style.visibility = 'hidden';
          
        
      }

  }
  
  
function callbackCargarLista(ajaxResponseText) {
		var motivosCombo = document.miForm.CHDRTYPE;
		try {
			var doc=objAjax.domParse(ajaxResponseText);
                        
								
			if(!objAppMensajes.existenErroresEnAplicacion(doc)){
				if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
					objDom.borrarOpcionesDeCombo(motivosCombo);
					 objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, 0);
					for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
						var TMOTSIN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
						var CMOTSIN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
						
						objDom.addOpcionACombo(TMOTSIN,CMOTSIN, motivosCombo, i+1);
					}
				}else{
					objDom.borrarOpcionesDeCombo (motivosCombo);
					objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, null);
				}
			}
			
			//f_call_asistencia();
		} catch (e) {
			objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, null);
			alert(objJsMessages.jslit_sin_motivos);
		}
	}
        
        
  function valida(){
  
  f_cargar_propiedades_pantalla();
 
  var tipoCheque = document.getElementById("CHTYPE").value;
  
  var tipoDraft = document.getElementById("CHDRTYPE").value;

  if (tipoCheque == 3){
  
  document.getElementById("CHNUM").className  = "campowidthinput campo campotexto campotexto_ob";
  document.getElementById("ACCONUM").className  = "campowidthinput campo campotexto campotexto_ob";

  document.miForm.CHNUM.setAttribute("obligatorio","true");
  document.miForm.ACCONUM.setAttribute("obligatorio","true");
  
  }
  
   if (tipoCheque == 1){
  
  document.getElementById("CHNUM").className  = "campowidthinput campo campotexto campotexto_ob";
  document.getElementById("ACCONUM").className  = "campowidthinput campo campotexto campotexto_ob";
  document.getElementById("ACCOHOLD").className  = "campowidthinput campo campotexto campotexto_ob";
  document.getElementById("PAYTEXT").className  = "campowidthinput campo campotexto campotexto_ob";

  document.miForm.CHNUM.setAttribute("obligatorio","true");
  document.miForm.ACCONUM.setAttribute("obligatorio","true");
  document.miForm.ACCOHOLD.setAttribute("obligatorio","true");
  document.miForm.PAYTEXT.setAttribute("obligatorio","true");
  
  }
          
  } 
  
function f_recargar(){
        alert('<axis:alt f="axisadm093" c="CHNUM" lit="9901058"/>'); 
        objUtiles.ejecutarFormulario ("axis_axisadm093.do", "init", document.miForm, "_self");
    }
 //---------------------- formateo monto poliza 0-----------------------------
  
function val_numberMonpol(valor){
        try{
                if(objNumero.validarNegativos(valor)) {
                    entrada = objNumero.formateaNumero(valor, true);  
                    entrada = objNumero.quitarSeparadorMiles(entrada);
                    document.miForm.MONPOL.value = objNumero.formateaNumeroMoneda(valor);                        
                }else{
                    document.miForm.MONPOL.value = '';
                    document.miForm.MONPOL.focus();
                }    
            
        }catch(e){
            alert (e.name + " " + e.message);
        }
    
}  
  
  
</script>
<!-- JAVASCRIPTS FUNCTIONS FINISH -->
</head>
<!-- HEAD FINISH -->
<!-- BODY START -->
<body onload="f_onload()">
<!-- FORM START -->
<form name="miForm" action="axis_axisadm093.do" method="POST">
<!-- HIDDENS INPUTS -->
<input type="hidden" id="operation" name="operation" value=""/>
<input type="hidden" name="POLICY" id="POLICY" value="${__formdata.NPOLIZA}" />
<input type="hidden" name="AMOUNT" id="AMOUNT" value="${__formdata.AMOUNT}" />
<input type="hidden" name="STEMPO" id="STEMPO" value="${__formdata.SEQTEMPO}" />
<input type="hidden" name="FINDPAYS" id="FINDPAYS" value="null" />
<input type="hidden" name="IDPAYS" id="IDPAYS" value="${__formdata.IDPAYS}" />
<input type="hidden" name="IDCHTYPE" id="IDCHTYPE" value="${__formdata.IDCHTYPE}" />
<input type="hidden" name="SUM" id="SUM" value="${__formdata.SUM}" />
<input type="hidden" name="TID" id="TID" value="${__formdata.listValores.TID}" />
<input type="hidden" id="ORIGEN" name="ORIGEN" value="" />
<input type="hidden" id="SNIP" name="SNIP" value="" />
<input type="hidden" id="CAGENTE_VISIO" name="CAGENTE_VISIO" value="" />
<input type="hidden" id="SPERSON_REL" name="SPERSON_REL" value="${__formdata.SPERSON_REL}"/>
<input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
<input type="hidden" name="MENSWARNINFO" id ="MENSWARNINFO" value="${__formdata.MENSWARNINFO}" />
<!-- MODAL IMPORTS -->
<c:import url="../include/modal_estandar.jsp">
    <c:param name="titulo"><axis:alt f="axisadm093" c="TITULO" lit="9907770" /></c:param>
    <c:param name="nid" value="axisadm093a" />
</c:import>
 <c:import url="../include/modal_estandar.jsp">
    <c:param name="titulo"><axis:alt f="axisadm093" c="TITULO" lit="9907781" /></c:param>
    <c:param name="nid" value="axisadm093b" />
</c:import>
<c:import url="../include/modal_estandar.jsp">
    <c:param name="titulo"><axis:alt f="axisadm093" c="MOD_PANTALLA_PERS" lit="1000235"/></c:param>
    <c:param name="nid" value="axisper021" />
</c:import>
<c:import url="../include/modal_estandar.jsp">
    <c:param name="titulo"><axis:alt f="axisadm093" c="MOD_PANTALLA_APERS" lit="1000214"/></c:param>
    <c:param name="nid" value="axisper022" />
</c:import>

<c:import url="../include/modal_estandar.jsp">
    <c:param name="nid_y_titulo">axisctr019|<axis:alt f="axisctr020" c="MOD_PANT_AXICTR019" lit="1000188"/>#axisimprimir|<axis:alt f="axisctr020" c="MOD_PANT_IMPRIMIR" lit="1000205"/>|true#axisgedox|<axis:alt f="${pantalla}" c="LIT_GEDOX" lit="1000201"></axis:alt>#axisctr023|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR023" lit="1000191"/>#axisctr025|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR025" lit="140360"/>#axisctr029|<axis:alt f="${pantalla}" c="LIT_PANTALLA_DETASE" lit="1000195"/>#axisctr148|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR148" lit="1000199"/>#axisctr030|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR030" lit="1000196"/>#axisctr039|Suplementos#axisadm028|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISADM028" lit="1000568"/>#axisopenurl||<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISOPENURL" lit="1000568"/></c:param>
</c:import>
<!-- AXIS TITTLE IMPORT -->
<c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisadm093" c="TITULO" lit="9907763"/></c:param>     
            <c:param name="formulario"><axis:alt f="axisadm093" c="TITULO" lit="9907763"/></c:param>
            <c:param name="form">axisadm093</c:param>
</c:import>
<!-- FIRST MAIN TABLE START -->
<table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td>
     <!--start title red SEARCH PERSON -->
     <div class="titulo">
        <img src="images/flecha.gif"/><axis:alt f="axisadm093" c="TIT_SEARCH_PERSON" lit="9907916"/>
     </div>
     <div style="clear:both;">
        <hr class="titulo"/>
     </div> 
     <!-- end title red SEARCH PERSON -->
     <!-- SECOND MAIN TABLE START -->
     <table  align="center">
        <tr>
        <th style="width:20%;height:0px"></th>
        <th style="width:20%;height:0px"></th>
        <th style="width:20%;height:0px"></th>
        <th style="width:20%;height:0px"></th>
        <th style="width:20%;height:0px"></th>   
        </tr>
        <tr>
        <!-- FORM ITEMS START START -->
        <!-- payerid block -->
      
            
        
        <axis:ocultar f="axisadm093" c="PAYERID" dejarHueco="false">
             <td class="titulocaja" id="tit_PAYERID" ><b><axis:alt f="axisadm093" c="PAYERID" lit="9907917"/></b></td>
        </axis:ocultar>
        <axis:visible f="axisadm093" c="PAYERID">
             <td class="campocaja" id="td_PAYERID" >
             <input type="text" class="campo campotexto" value="" name="PAYERID" id="PAYERID" size="15" readonly="true" style="width:80%;"
             <axis:atr f="axisadm093" c="PAYERID" a="obligatorio=true"/>/>
              <!-- search people image start-->
             <axis:visible f="axisadm093" c="BT_SHPERSON">
                 &nbsp;<img id="BT_BT_SHPERSON" border="0" src="images/find.gif" onclick="f_abrir_axisper021();" style="cursor:pointer"/>
             </axis:visible>
            <!-- search people image end-->
             </td>
        </axis:visible>
        
        <!-- payer block -->
        <axis:ocultar f="axisadm093" c="PAYER" dejarHueco="false">
             <td class="titulocaja" id="tit_PAYER" align="right"> 
             <b><axis:alt f="axisadm093" c="PAYER" lit="9907726"/></b> </td>
        </axis:ocultar>
        <axis:visible f="axisadm093" c="PAYER">
             <td class="campocaja" id="td_PAYER">
             <input type="text" class="campo campotexto" value="" name="PAYER" id="PAYER" size="15" readonly="true"/></td>
        </axis:visible>
        
        
        </tr>
        
        
        <tr>
        
        
        <axis:ocultar f="axisadm093" c="tit_MONPOL" dejarHueco="false">
             <td class="titulocaja" id="tit_MONPOL" ><b><axis:alt f="axisadm093" c="MONPOL" lit="9908443"/></b></td>
        </axis:ocultar>
        <axis:visible f="axisadm093" c="MONPOL">
             <td class="campocaja" id="td_MONPOL" >
             <input type="text" class="campo campotexto" value="" name="MONPOL" id="MONPOL" size="15" readonly="true" style="width:80%;"
            
            <!-- search people image end-->
            
              <axis:visible f="axisadm093" c="BT_COBRAR">
                 &nbsp;<img id="BT_BT_SHPERSON" border="0" src="images/cobrar.gif" onclick=" f_proceso_pol()" style="cursor:pointer"/>
             </axis:visible>
             </td>
        </axis:visible>
        
        </tr>
        
        
        
        
        <tr>
        <!-- title red PAYMENT DETAILS -->
        <td>
        <div class="titulo">
        <img src="images/flecha.gif"/><axis:alt f="axisadm093" c="PAY_DETAILS" lit="9907918"/>
        </div>                             
        </td>
        </tr>
        <!-- end title red PAYMENT DETAILS -->
        <tr>
        <td>
        <hr align="left" noshade="noshade" size="2" width="473%"/>
        </td>
        </tr>
        <tr>
        <!-- currency block -->
        <axis:ocultar f="axisadm093" c="CURRENCY" dejarHueco="false">
           <td class="titulocaja" id="tit_CURRENCY" width="100px;"><b><axis:alt f="axisadm093" c="CURRENCY" lit="9907718"/></b></td>
        </axis:ocultar>
        <axis:visible f="axisadm093" c="CURRENCY" >
            <td class="campocaja" id="td_CURRENCY" >
               <select name="CURRENCY" id="CURRENCY" size="1" disabled="true" class="campowidthselect campo campotexto" <axis:atr f="axisadm093" c="CURRENCY" a="obligatorio=true"/>>
                 
                      <c:forEach var="element" items="${__formdata.listValores.currency}">
                        <option value="${element.CMONEDA}"
                               <c:if test="${element.CMONEDA == __formdata.CTIPIDE}"> selected </c:if> > 
                                ${element.TMONEDA}
                        </option>
                      </c:forEach>
               </select>
            </td>
        </axis:visible>
        <!-- pay reason block -->
        <axis:ocultar f="axisadm093" c="PAYREASON" dejarHueco="false">
        <td class="titulocaja" id="tit_PAYREASON" width="100px;"><b><axis:alt f="axisadm093" c="PAYREASON" lit="9907720"/></b></td>
        </axis:ocultar>
        <axis:visible f="axisadm093" c="PAYREASON">
        <td class="campocaja" id="td_PAYREASON">
            <select name="PAYREASON" id="PAYREASON" size="1" class="campowidthselect campo campotexto" <axis:atr f="axisadm093" c="PAYREASON" a="obligatorio=true"/>
            title="<axis:alt f="axisadm093" c="PAYMET" lit="9907720"/>">
            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm093" c="PAYREASON" lit="1000348"/> - </option>
            <c:forEach var="element" items="${__formdata.listValores.payreason}">
                <option value="${element.CATRIBU}" <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if>> 
                    ${element.TATRIBU}
                </option>
            </c:forEach> 
            </select> 
        </td>
        </axis:visible>
        </tr>
        
        <tr>
            <!-- pay method block -->
            <axis:ocultar f="axisadm093" c="PAYMET" dejarHueco="false">
                <td class="titulocaja" id="tit_PAYMET" width="100px;"><b><axis:alt f="axisadm093" c="PAYMET" lit="9907711"/></b></td>
            </axis:ocultar>
            
            <axis:visible f="axisadm093" c="PAYMET"> 
            <td class="campocaja" id="td_PAYMET">
                <select name="PAYMET" id="PAYMET" size="1" class="campowidthselect campo campotexto" onchange="f_limpia_monto();f_cargar_propiedades_pantalla();"
                        <axis:atr f="axisadm093" c="PAYMET" a="obligatorio=true"/> title="<axis:alt f="axisadm093" c="PAYMET" lit="9907711"/>">
                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm093" c="PAYMET" lit="1000348"/> - </option>
                <c:forEach var="element" items="${__formdata.listValores.paymet}">
                    <option value="${element.CATRIBU}" <c:if test="${element.CATRIBU == __formdata.PAYMET}">  selected = "selected" </c:if> > 
                        ${element.TATRIBU}
                    </option>
                </c:forEach>
                </select>
            </td>
            </axis:visible>
        
        </tr>
        
        <!-- amopay block -->
        <tr>        
        <axis:ocultar f="axisadm093" c="AMOPAY" dejarHueco="false">
            <td class="titulocaja" id="tit_AMOPAY" width="100px;"><b><axis:alt f="axisadm093" c="AMOPAY" lit="9907719"/></b></td>
        </axis:ocultar>
        <axis:visible f="axisadm093" c="AMOPAY"> 
        <td class="campocaja" id="td_AMOPAY">
            <input type="text" class="campo campotexto" value="" name="AMOPAY" id="AMOPAY" size="15" onchange="val_number(this.value);" 
            <axis:atr f="axisadm093" c="AMOPAY" a="obligatorio=true"/> title="<axis:alt f="axisadm093" c="AMOPAY" lit="9907719"/>"/>
        </td>
        </axis:visible>
        </tr>
        <!-- date recivied block -->
        <tr><axis:ocultar f="axisadm093" c="DATEREC" dejarHueco="false"><td class="titulocaja" id="tit_DATAREC" width="100px;"><b><axis:alt f="axisadm093" c="DATEREC" lit="9907723"/></b></td>
        </axis:ocultar>
        <axis:visible f="axisadm093" c="DATEREC"><td class="campocaja" id="td_DATAREC" width="100px;">
        <input type="text" class="campowidthinput campo campotexto" size="10" value="" name="DATEREC" id="DATEREC"  style="width:85%;"
        <axis:atr f="axisadm093" c="DATEREC" a="modificable=true&formato=fecha&obligatorio=true"/> title="<axis:alt f="axisadm093" c="DATEREC" lit="9907723"/>"/> 
        <a id="icon_DATEREC" style="vertical-align:middle;" href="#"><img id="popup_calendario_DATEREC" border="0" alt="<axis:alt f="axisadm093" c="DATEREC_CAL" lit="9907723"/>" title="<axis:alt f="axisadm093" c="TIT_DATEREC" lit="9907723" />" src="images/calendar.gif"/></a>
        </td>
        </axis:visible>  
        </tr>
        <tr>
        <!-- title red PAYMENT METHOD -->
        <td>
        <div class="titulo">
        <img src="images/flecha.gif"/><axis:alt f="axisadm093" c="PAY_METHOD" lit="9907711"/>
        </div>                             
        </td>
        </tr>
        <!-- end title red PAYMENT METHOD -->
        <tr>
        <td>
        <hr align="left" noshade="noshade" size="2" width="473%"/>
        </td>
        </tr>
        
        <!-- bname block -->
        <tr>
        <axis:ocultar f="axisadm093" c="BNAME" dejarHueco="false"><td class="titulocaja" id="tit_BNAME" width="100px;"><b><axis:alt f="axisadm093" c="BNAME" lit="9907712"/></b></td>
        </axis:ocultar>
        
        <axis:visible f="axisadm093" c="BNAME" > <td class="campocaja" id="td_BNAME">
        <select name="BNAME" id="BNAME" size="1" class="campowidthselect campo campotexto">
        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm093" c="BNAME" lit="1000348"/> - </option>
        <c:forEach var="element" items="${__formdata.listValores.bname}">
        <option value="${element.CBANCO}" <c:if test="${element.CBANCO == __formdata.CTIPIDE}"> selected </c:if> />
        ${element.TBANCO} </c:forEach></select></td>
        </axis:visible>
        <!-- other bank block -->
        
        
        <axis:ocultar f="axisadm093" c="OBANK" dejarHueco="false">
        <td class="titulocaja" id="tit_OBANK" width="100px;" >
        <b>
        <axis:alt f="axisadm093" c="OBANK" lit="9907713"/>
        </b>
        </td>
        </axis:ocultar>
        
        
        
        <axis:visible f="axisadm093" c="OBANK"> 
         <td class="campocaja" id="td_OBANK">
         <input type="text" class="campo campotexto" value="" name="OBANK" id="OBANK" size="15"/></td>
        </axis:visible>
        </tr>
        
        
        <!-- chtype block -->
        <tr>
        <axis:ocultar f="axisadm093" c="CHTYPE" dejarHueco="false">
        <td class="titulocaja" id="tit_CHTYPE" width="100px;"><b> <axis:alt f="axisadm093" c="CHTYPE" lit="9907714"/></b> </td>
        </axis:ocultar>
        
        <axis:visible f="axisadm093" c="CHTYPE"> 
        <td class="campocaja" id="td_CHTYPE"> 
        <select name="CHTYPE" id="CHTYPE" size="1" class="campowidthselect campo campotexto" 
        onchange="f_dependencia();" > 
        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm093" c="CHTYPE" lit="1000348"/> - </option>
        <c:forEach var="element" items="${__formdata.listValores.chtypelist}"> 
        <option value="${element.CATRIBU}"
        <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if> />${element.TATRIBU}
        </c:forEach>
        </select>
        
        </td>
        </axis:visible>
        
        </tr>
        <!-- cheque draft type block -->
        <tr>
        
        <axis:ocultar f="axisadm093" c="CHDRTYPE" dejarHueco="false">
        <td class="titulocaja" id="tit_CHDRTYPE" width="100px;"><b><axis:alt f="axisadm093" c="CHDRTYPE" lit="9907715"/></b></td>
        </axis:ocultar>
        
        <axis:visible f="axisadm093" c="CHDRTYPE">
            <td class="campocaja" id="td_CHDRTYPE">
                <select name="CHDRTYPE" id="CHDRTYPE" size="1" class="campowidthselect campo campotexto" onchange="valida();">
                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm093" c="CHDRTYPE" lit="1000348"/> - </option>
                    <c:forEach var="element" items="${__formdata.listValores.chdrtype}">
                    <option value="${element.CATRIBU}" 
                    <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if> /> ${element.TATRIBU} 
                    </c:forEach>
                </select> 
            </td>
        </axis:visible></tr>
        
        <!-- cheque num block -->
        <tr>
        <axis:ocultar f="axisadm093" c="CHNUM" dejarHueco="false"><td class="titulocaja" id="tit_CHNUM" width="100px;"> <b> <axis:alt f="axisadm093" c="CHNUM" lit="9907717"/></b></td>
        </axis:ocultar>
        
        
        <axis:visible f="axisadm093" c="CHNUM">
        <td class="campocaja" id="td_CHNUM">
        <input type="text" class="campo campotexto" value="" name="CHNUM" id="CHNUM" size="15"/></td>
        </axis:visible>
        
        
        </tr>
        <!-- account num block -->                           
        <tr>
        <axis:ocultar f="axisadm093" c="ACCONUM" dejarHueco="false"><td class="titulocaja" id="tit_ACCONUM" width="100px;" ><b><axis:alt f="axisadm093" c="ACCONUM" lit="9907721"/></b> </td>
        </axis:ocultar>
        <axis:visible f="axisadm093" c="ACCONUM"><td class="campocaja" id="td_ACCONUM"><input type="text" class="campo campotexto"  value="" name="ACCONUM" id="ACCONUM" size="15"/></td>
        </axis:visible>
        
        <axis:ocultar f="axisadm093" c="ACCOHOLD" dejarHueco="false">
            <td class="titulocaja" id="tit_ACCOHOLD">
                <b>
                    <axis:alt f="axisadm093" c="ACCOHOLD" lit="9908485"/>
                </b>
            </td>
        </axis:ocultar>
        
        
        <axis:ocultar f="axisadm093" c="ACCOHOLD">
             <td class="campocaja" id="td_ACCOHOLD">
                   <input type="text" class="campo campotexto" value="" name="ACCOHOLD" id="ACCOHOLD" style="width:100%;"/></td>
             </td>
        </axis:ocultar>
    
        </tr> 
        
        
        <!-- pay text block -->
        <tr>
        <axis:ocultar f="axisadm093" c="PAYTEXT" dejarHueco="false">
        <td class="titulocaja" id="tit_PAYTEXT" width="100px;"><b> <axis:alt f="axisadm093" c="PAYTEXT" lit="9907724"/></b> 
        </td>
        </axis:ocultar> 
        
        
        
        <axis:visible f="axisadm093" c="PAYTEXT"> 
        <td class="campocaja" id="td_PAYTEXT"  colspan="2"> 
        
         <textarea <axis:atr f="axisadm093" c="PAYTEXT" a="modificable=true"/> 
          title="<axis:alt f="axisadm093" c="PAYTEXT" lit="9907724"/>" cols="" rows="3" class="campo campotexto"  id="PAYTEXT" name="PAYTEXT" size="15" maxlength="125"
          style="width:98%;overflow-x:hidden;overflow-y:auto"></textarea>
        </td>
        
        
        </axis:visible>
        </tr>
     </table>
     <!-- SECOND MAIN TABLE END -->    
     <!-- title red PAYMENT_BREAKDOWN -->
     <div class="separador"></div>
     <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm093" c="PAYMENT_BREAKDOWN" lit="9907710"/></div>
     <!-- end title red PAYMENT_BREAKDOWN -->
     <!-- boton nuevo -->
     <div style="float:right;" id="BT_SIN_NUEVO_AG">
         <axis:visible f="axisadm093" c="BT_SIN_NUEVO_AG">
            <img id="td_BT_SIN_NUEVO_AG" border="0" onclick="f_abrir_axisadm093a();" src="images/agenda.gif" style="cursor:pointer"/>
         </axis:visible>
     </div>
     <!-- fin boton nuevo -->
     <div style="clear:both;">
        <hr class="titulo"/>
     </div>
     <div class="separador"></div>
     <!-- START TABLE AMOUNTS TITLES - COLUMNS -->
     <table class="area" align="center">
     <tr>
     <td align="left" class="campocaja">
     <!--CAMPOS PAYMENT_BREAKDOWN -->
     <c:set var="title0"><axis:alt f="axisadm090" c="FIELD_NAME" lit="9907730"/></c:set><!-- policy -->
     <c:set var="title1"><axis:alt f="axisadm090" c="INI_POSITION" lit="9907731"/> </c:set><!-- holder -->
     <c:set var="title2"><axis:alt f="axisadm090" c="LENGTH POSIT" lit="9907732"/> </c:set><!-- premium -->
     <c:set var="title3"><axis:alt f="axisadm090" c="TYPE_F_DEF" lit="9907733"/></c:set><!-- destity-->
     <c:set var="title4"><axis:alt f="axisadm090" c="DEL_F_DEF" lit="9907706"/> </c:set><!-- delete -->
      <!-- START TABLE AMOUNTS AJAX -->
     <div class="displayspace">
     
     <display:table name="${__formdata.MODINVFONDO}" id="MODINVFONDO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
     requestURI="axis_axisadm093.do?paginar=true&operation=ajax_search_amount"> <%@ include file="../include/displaytag.jsp"%>
     
     <display:column title="${title0}" sortable="true" sortProperty="MODINVFONDO.NPOLIZA" headerClass="sortable" style="width:16,6%" media="html" autolink="false">
     <div class="dspText">${MODINVFONDO.NPOLIZA} 
     </div>
     </display:column>
     
     <display:column title="${title1}" sortable="true"  sortProperty="MODINVFONDO.TNOMBRE" headerClass="sortable" style="width:16,6%" media="html" autolink="false"> 
        <div class="dspText">${MODINVFONDO.TNOMBRE} 
        </div>
     </display:column>
     
     <display:column title="${title2}" sortable="true" sortProperty="MODINVFONDO.ITOTPRI" headerClass="sortable" style="width:16,6%" media="html" autolink="false">
        <div class="dspText">${MODINVFONDO.ITOTPRI}
        </div>
     </display:column>
     
     <display:column title="${title3}" sortable="true" sortProperty="MODINVFONDO.CDEBHAB" headerClass="sortable" media="html" autolink="false">
         <div class="dspText">${MODINVFONDO.CDEBHAB}
         </div>
     </display:column>
     
     <display:column title="${title4}" sortable="true"  sortProperty="" headerClass="sortable" media="html" autolink="false"> 
       <div class="dspText">
       </div>
     </display:column>
 
     
     </display:table>
     <!-- END TABLE AMOUNTS AJAX -->
     </div>
     </td> 
     </tr>
     </table>
     <!-- END TABLE AMOUNTS TITLES - COLUMNS -->                  
     </td>
     </tr>
</table>
<!-- FIRST MAIN TABLE END -->    
     <div class="separador"></div>
     <!-- LABELS TO SHOW MESSAGES -->
     <center>
     <label id="labelo" value=""  style="color:red; font-size: 10px;font-weight: bold;"  ></label>
     </center>
     <center>
     <label id="labelFail" value=""  style="color:blue; font-size: 10px;font-weight: bold;"  ></label>
     </center>    
     <br></br>
     <!-- TABLE BUTTONS START -->
     <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
     <tr>
     <td>
     <c:import url="../include/botonera_nt.jsp">
     <c:param name="f">axisadm093</c:param>
     <c:param name="__botones">salir</c:param>
     </c:import>
     </td>
     <td>
     <label id="labelSum" value=""  style="color:red; font-size: 10px;font-weight: bold;"  ></label>
     </td>
     <td>
     <c:import url="../include/botonera_nt.jsp">
     <c:param name="f">axisadm093</c:param>
    <c:param name="__botones">
    <axis:visible c="BT_ACEPTAR" f="axisadm093">9907708</axis:visible>
    </c:param>
    </c:import>
    </td>
    </tr>
    </table>
    <!-- TABLE BUTTONS END -->
    </form>
    <!-- FORM END -->
    <!-- importing jsp messages -->
    <c:import url="../include/mensajes.jsp" />
    <!-- calendar scripts -->
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "DATEREC",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_DATEREC", 
                singleClick    :    true,
                firstDay       :    1
            });
    </script>
</body>
<!-- BODY END -->
</html>
<!-- HTML END -->
