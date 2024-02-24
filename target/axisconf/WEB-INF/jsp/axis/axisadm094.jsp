<%/* Revision:# FvSulsTEwWSY4OHZ2dFvfg== # */%>
<%/*
*  Fichero: axisadm094.jsp
*  @author <a href = "mailto:jpacheco@csi-ti.com">Juan Carlos PAcheco</a> 
*     

*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
     <!--********** CALENDARIO ************************* -->
          <!-- Hoja de estilo del Calendario -->
          <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
          <!-- Script principal del calendario -->
          <script type="text/javascript" src="scripts/calendar.js"></script>
          <!-- Idioma del calendario, en función del Locale -->
          <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
          <!-- Setup del calendario -->
          <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        
            try{
                document.miForm.NOMBRE.focus();
            } 
            catch (e) 
            {	
            try{
                document.miForm.NOMBRECOMP.focus();
            }catch(e)
            {
                alert(e); 
            }
            }
            
            if (document.all)
                document.getElementById("tabla1").style.marginLeft="1.3%";
            
            var CAGENTE = objDom.getValorPorId ("CAGENTE");
            var SNIP = objDom.getValorPorId ("SNIP");
            
            var SPERSON='${__formdata.SPERSON}';
            var SSEGURO='${__formdata.SSEGURO}';
            var NOMBRE='${__formdata.NOMBRE}';
            var TRANS_SPL='${__formdata.TRANS_SPL}';
            f_cargar_propiedades_pantalla();
        }
              
        function f_authorize(AUTHORIZE,SEQCAJA,SPERSON,SSEGURO_A){
            document.getElementById("AUTHORIZE").value=AUTHORIZE;
            document.getElementById("SEQCAJA").value=SEQCAJA;
            document.getElementById("SPERSON_A").value=SPERSON;
            document.getElementById("SSEGURO_A").value=SSEGURO_A;
            
            f_but_cerrar_axisadm094a();
            objUtiles.ejecutarFormulario("axis_axisadm094.do","aprueba_caja",document.miForm, "_self", objJsMessages.jslit_cargando);  
        
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm094", "cancelar", document.miForm, "_self");
        }
               
        function f_but_9908375(){
            objUtiles.abrirModal("axisadm094b","src","modal_axisadm094b.do?operation=form");        
        }  
      
        function f_but_cerrar_axisadm094b(){
            objUtiles.cerrarModal("axisadm094b");
        }               
      
        function f_abrir_axisadm094a(SSEGURO,SPERSON,SEQCAJA,NOMBRE,AMOUNT,CRAZON,STATUS,NPOLIZA,METODO,TIPPAG){  
           if (METODO == 'Cheque' && TIPPAG == '20') {
                 alert("<axis:alt f='axisadm094' c='ADVERTENCIA' lit='9908562'/>");
              }
              else {

                   if (STATUS != 2 ) {
                      alert("<axis:alt f='axisadm094' c='ADVERTENCIA' lit='9908039'/>");
                  }
                  else {
                      objUtiles.abrirModal("axisadm094a", "src", "modal_axisadm094a.do?operation=form&SSEGURO=" + SSEGURO + "&SPERSON=" + SPERSON + "&SEQCAJA=" + SEQCAJA + "&NPOLIZA=" + NPOLIZA + "&AMOUNT=" + AMOUNT + "&NPOLIZA_V=" + NPOLIZA + "&CRAZON=" + CRAZON + "&NOMBRE=" + NOMBRE);
                  }
              }
        
        }
        
        function f_but_buscar(){
            var SSEGURO= document.getElementById("SSEGURO").value;
            var NOMBRE=document.getElementById("NOMBRE").value;
            var status= document.getElementById("STATUS").value;
            NPOLIZA = objDom.getValorPorId("NPOLIZA");
            
            if( !objUtiles.estaVacio(status) || 
                !objUtiles.estaVacio(NOMBRE)  ||
                !objUtiles.estaVacio(SSEGURO)){
                objUtiles.ejecutarFormulario("axis_axisadm094.do?NPOLIZA="+ NPOLIZA+"&NOMBRE="+ NOMBRE ,"buscar_reembolsos",document.miForm, "_self", objJsMessages.jslit_buscando_personas);              
            }else{            
                alert("<axis:alt f='axisadm094' c='ADVERTENCIA' lit='9900849'/>");
            }   
        }
       
/****************************************************************************************/
/***************************** REALOADING TABLE WITH AJAX DATA*************************/
/****************************************************************************************/          
  //fetching the ajax data
  function CallbackReloadTable(ajaxResponseText){
 
  
           //getting the ajax response
        var doc=objAjax.domParse(ajaxResponseText);
       
           //vars and cycle FOR to verify if stempo is 1,null or different
                      var CatchOne = new Array(1); 
                      var NoYesOne;
                     
                     
     
     
       
           //var Plus to Sum all premiums
           var Plus = 0;
           //getting the table params
           var table = document.getElementById("miListaId");
           var tbody = table.getElementsByTagName("tbody")[0];
           var tr = tbody.getElementsByTagName("tr");
           // delete existing rows
           objLista.borrarFilasDeLista ("miListaId", "6", "<axis:alt f='axisadm093' c='MODINVFONDO_LIT_EMPTY' lit='1000254' />");
           //if  find data, delete "not data found"
           if (objDom.existeTag(doc, "SSEGURO"))
                objLista.borrarFilaVacia(tbody, tr);
            
                
           //painting data in the table
           for (var i = 0; i < objDom.numeroDeTags(doc, "SSEGURO") ; i++) {
           
           
              // row style
              var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
              // Creating row, putting style
              var newtr = objLista.crearNuevaFila(rowstyle);
              // row array
              var newtd = new Array(13); 
              // Creating columns and putting in the array
                     newtd[0] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMOVIMI"), i, 0));
                     newtd[1] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CUSUARI"), i, 0));
                     newtd[2] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), i, 0));
                     newtd[3] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FFECMOV"), i, 0));
                     newtd[4] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPOLIZA"), i, 0));
                     newtd[5] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CESTADO"), i, 0));                     
                     
              objLista.addNuevaFila(newtd, newtr, tbody);
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
                    seleccionarLista(objUtiles.utilSplit(hayChecked, "/")[0],objUtiles.utilSplit(hayChecked, "/")[1],objUtiles.utilSplit(hayChecked, "/")[2]);
                }
            }
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal("axisadm094");
        }   
        
        function f_but_cerrar_axisadm094a(){
            objUtiles.cerrarModal("axisadm094a");
        }
        function f_but_cerrar_axiscob001b(){
            objUtiles.cerrarModal("axiscob001b");
        }
  
     
        /****************************************************************************************/
        /************************************* MODAL ********************************************/
        /****************************************************************************************/
    
        function f_but_nueva_persona() {
           parent.f_nova_persona();
        }

        function f_cerrar_axisctr019(){
		objUtiles.cerrarModal("axisctr019");
	}

	function f_aceptar_axisctr019(SSEGURO,NPOLIZA,NCERTIF){
        
		objDom.setValorPorId("SSEGURO", SSEGURO);
                objDom.setValorPorId("NPOLIZA", NPOLIZA);               

		f_cerrar_axisctr019();
		
	}
         function f_cerrar_modalespersona(){
        f_cerrar_modal('axisper021');
      }
    function f_buscar_persona(){
         f_abrir_modal("axisper021", false, "&MODO_SWPUBLI=PERSONAS_PUBPRIV"); 
    } 
        function f_buscar_poliza(){
             objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form");
        }
        
     function f_abrir_modal(cual, noXButton, optionalQueryString) {
        
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
         function f_aceptar_persona (SPERSON_OUT,CAGENTE_OUT, SNIP, ORIGEN){    
        objDom.setValorPorId ("SPERSON", SPERSON_OUT);
        objDom.setValorPorId ("SNIP", SNIP); 
        f_cerrar_modal('axisper021')        
     
        if (objUtiles.estaVacio(SPERSON_OUT)){
            return;
        }
        objAjax.invokeAsyncCGI("axis_axisadm094.do", callbackajaxPersona, "operation=ajax_persona&SPERSON="+SPERSON_OUT+"&CAGENTE="+CAGENTE_OUT, this)
         }
         
         function f_aceptar_axisper021(){
        f_cerrar_modal('axisper021');
      }
      function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }
        function f_cerrar_modalespersona(){
        f_cerrar_modal('axisper021');
      }
      
       function f_aceptar_persona (SPERSON_OUT,CAGENTE_OUT, SNIP, ORIGEN){  
        objDom.setValorPorId ("SPERSON", SPERSON_OUT);
        f_cerrar_modal('axisper021')        
     
        if (objUtiles.estaVacio(SPERSON_OUT)){
            return;
        }
        objAjax.invokeAsyncCGI("axis_axisadm094.do", callbackajaxPersona, "operation=ajax_persona&SPERSON="+SPERSON_OUT+"&CAGENTE="+CAGENTE_OUT, this)
         }
      
       /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
         function callbackajaxPersona(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(objAppMensajes.existenErroresEnAplicacion(doc)){
                return;
            }
            var SPERSON ="";
            var TTIPIDE = "";
            var NNUMIDE = "";
            var NOMBRE ="";
            var SNIP = "";
            var TDIGITOIDE="";
            try{
                SPERSON = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0);
           }catch(e){
            }
            try{
                TTIPIDE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTIPIDE"), 0, 0);
            }catch(e){
            }
            try{
                NNUMIDE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0);
            }catch(e){
            alert(e);
            }
            try{
            TDIGITOIDE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TDIGITOIDE"), 0, 0);
                if (!objUtiles.estaVacio(TDIGITOIDE)){
                    TDIGITOIDE = "-" + TDIGITOIDE;
                }
            }catch(e){
            }
            try{
                NOMBRE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0);
            }catch(e){}
            try{
                NOMBRE +=" " + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0);
            }catch(e){}
            try{
                NOMBRE +=" " + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0);
            }catch(e){}
            try{
                SNIP = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SNIP"), 0, 0);
            }catch(e){}           
            objDom.setValorPorId ("TTIPIDE", TTIPIDE);
            
              if (!objUtiles.estaVacio(NNUMIDE)){
               if( NNUMIDE.indexOf("-")==-1)
                objDom.setValorPorId ("NNUMIDE", objNumero.formateaNumeroPattern(  "#.###,#", NNUMIDE) + TDIGITOIDE);
               else
                objDom.setValorPorId ("NNUMIDE", objNumero.formateaNumeroPattern(  "#.###,#", NNUMIDE));
                } 
            
            objDom.setValorPorId ("NOMBRE", NOMBRE);
            objDom.setValorPorId ("SNIP", SNIP);
            
            
        }
        
        function f_but_9001333() {
            objDom.setValorPorId ("NPOLIZA", "");
            objDom.setValorPorId ("NOMBRE", "");
            objDom.setValorPorId ("SSEGURO", "");
            objDom.setValorPorId ("SPERSON", "");        
        }
        
        function f_seleccionar(NSEQCAJA, NNUMLIN){
            objUtiles.abrirModal("axiscaj020", "src", "modal_axiscaj020.do?operation=form&NSEQCAJAO=" + NSEQCAJA + "&NNUMLINO=" + NNUMLIN);
        }
        
    </script>
    
  </head>
    <body onload="f_onload();" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo">
                <axis:alt f="axiscob001" c="TITULO" lit="9908003"/>
            </c:param>
            <c:param name="formulario">
                <axis:alt f="axiscob001" c="FORM" lit="9908003"/>
            </c:param>
            <c:param name="form">axisadm094</c:param>
        </c:import>
         
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
            <axis:alt f="axisctr019" c="TITULO" lit="9001558"/>
            </c:param>
            <c:param name="nid" value="axisctr019"/>
        </c:import> 
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
            axisper021|
            <axis:alt f="axisadm094" c="TIT_007" lit="1000235"/>
            </c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
            axisadm094a|
            <axis:alt f="axisadm094" c="TIT_007" lit="9907993"/>
            </c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
            axisadm094b|
            <axis:alt f="axisadm094" c="TIT_007" lit="9907993"/>
            </c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisadm094" c="MOVCAJA" lit="9907918"/></c:param>
            <c:param name="nid" value="axiscaj020"/>
        </c:import> 
        
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
        
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SNIP" id="SNIP" value="${__formdata.SNIP}" />
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" />            
            <input type="hidden" name="MODO_SWPUBLI" id="MODO_SWPUBLI" value="${__formdata.MODO_SWPUBLI}" />
            <input type="hidden" name="MODO_BUSQUEDA" id="MODO_BUSQUEDA" value="${__formdata.MODO_BUSQUEDA}" />
            <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}" />
            <input type="hidden" name="CONDICION" id="CONDICION" value="${__formdata.CONDICION}" />
            <input type="hidden" name="SEQCAJA" id="SEQCAJA"  value="${__formdata.SEQCAJA}" />
            <input type="hidden" name="SPERSON_A" id="SPERSON_A"  value="${__formdata.SPERSON_A}" />
            <input type="hidden" name="SSEGURO_A" id="SSEGURO_A"  value="${__formdata.SSEGURO_A}" />
            <input type="hidden" name="AUTHORIZE" id="AUTHORIZE"  value="${__formdata.AUTHORIZE}" />
            
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
            <td>
                <div class="separador">&nbsp;</div>
                <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <b><axis:alt f="axisadm094" c="LIT32" lit="9908003"/></b>
                </div>
                
                <table class="seccion" >
                <tr>                        
                <td align="left">
                    <table class="area" align="center">
                        <tr> 
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                        </tr>
                        
                        <tr>
                            <axis:ocultar f="axisadm094" c="SSEGURO" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm094" c="SSEGURO" lit="101273" /></b>
                            </td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisadm094" c="HOLDER" dejarHueco="false">
                            <td class="titulocaja" >
                                <b><axis:alt f="axisadm094" c="HOLDER" lit="9907907" /></b>
                            </td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisadm094" c="STATUS" dejarHueco="false">
                            <td class="titulocaja" >
                                <b><axis:alt f="axiscob001a" c="STATUS" lit="9905523" /></b>
                            </td>
                            </axis:ocultar>
                            
                         </tr>
                         
                         <tr>
                            <axis:visible f="axisadm094" c="SSEGURO">
                            <td class="campocaja" >
                                <input type="hidden" style="width:300px" class="campo campotexto" value="${__formdata.SSEGURO}"  name="SSEGURO" id="SSEGURO" size="15" />   
                                <input type="text" style="width:300px" class="campo campotexto" value="${__formdata.NPOLIZA}" disabled="true" name="NPOLIZA" id="NPOLIZA" size="15" />   
                                <img border="0" src="images/find.gif" onclick="f_buscar_poliza()" style="cursor:pointer" alt='<axis:alt f="axisadm094" c="BUSQ" lit="9000508"/>'
                                title='<axis:alt f="axisadm094" c="BUSQ" lit="9000508"/>'/>
                            </td>
                            </axis:visible>
                            
                            <axis:visible f="axisadm094" c="HOLDER">
                            <td class="campocaja" >
                                <input type="hidden" class="campo campotexto" value="${__formdata['SPERSON']}" name="SPERSON" id="SPERSON" size="15" />
                                <input type="text" style="width:300px" class="campo campotexto" value="${__formdata['NOMBRE']}" disabled="true" name="NOMBRE" id="NOMBRE" size="15" />
                                <img border="0" src="images/find.gif" onclick="f_buscar_persona()" style="cursor:pointer" alt='<axis:alt f="axiscob001" c="BUSQ" lit="axisadm094"/>'
                                title='<axis:alt f="axisadm094" c="BUSQ" lit="9000508"/>'/>
                            </td>
                            </axis:visible>
                            
                            <axis:visible f="axisadm094" c="STATUS">
                            <td class="campocaja" >
                                <select name="STATUS" id="STATUS" style="width:300px"  size="1" class="campowidthselect campo campotexto">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscob001a" c="SNV_COMBO" lit="9905523"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.status}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.STATUS}"> selected </c:if>>
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:visible>
                            
                        </tr>
                        
                    </table>
                </td>                        
                </tr>
                </table>
                <div class="separador">&nbsp;</div>
                
                <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm094</c:param><c:param name="f">axisadm094</c:param>
                    <c:param name="f">axisadm094</c:param>
                    <c:param name="__botones"><axis:ocultar f="axisadm094" c="BT_9001333" dejarHueco="false">9001333,</axis:ocultar>buscar</c:param>
                </c:import>
                
                <div class="separador">&nbsp;</div>
                
                <div class="seccion displayspacePersonas">
                <!-- DisplayTag ListaPersonas -->
                <c:set var="title9"><axis:alt f="axisadm094" c="AMOUNT_T" lit="9908181"/></c:set>
                <c:set var="title8"><axis:alt f="axisadm094" c="AMOUNT_T" lit="9907994"/></c:set>
                <c:set var="title7"><axis:alt f="axisadm094" c="REQUESTBY" lit="9907995"/></c:set>
                <c:set var="title6"><axis:alt f="axisadm094" c="RECIPIENT" lit="9907907"/></c:set>
                <c:set var="title5"><axis:alt f="axisadm094" c="DATEOFREQUEST" lit="9907996"/></c:set>
                <c:set var="title4"><axis:alt f="axisadm094" c="POLICY_T" lit="102829"/></c:set>
                <c:set var="title3"><axis:alt f="axisadm094" c="STATUS_T" lit="100554"/></c:set>
                <c:set var="title2"><axis:alt f="axisadm094" c="METHOD" lit="9905098"/></c:set>
                <c:set var="title1"><axis:alt f="axisadm094" c="COLLECTMETHOD" lit="9907720"/></c:set>
                <c:set var="title0"><axis:alt f="axisadm094" c="AUTHORIZE" lit="9907998"/></c:set>
                
                <display:table name="${listaPolizas}" 
                    id="miListaId"
                    export="false" 
                    class="dsptgtable" 
                    pagesize="12"
                    requestURI="axis_axisadm094.do?paginar=true" 
                    sort="list" 
                    cellpadding="0" 
                    cellspacing="0">
                    
                <%@ include file="../include/displaytag.jsp"%>                
                
                <display:column 
                    title="${title8}" 
                    sortable="true" 
                    style="width:10%;" 
                    sortProperty="IMOVIMI"
                    headerClass="headwidth5 
                    sortable"  media="html" 
                    autolink="false" >
                    
                    <div class="dspNumber">                
                        <fmt:formatNumber pattern="${applicationScope.__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.IMOVIMI}"/> 
                    </div>
                </display:column>
                
                <display:column 
                    title="${title7}" 
                    sortable="true" 
                    style="width:7%;" 
                    sortProperty="CUSUARI"
                    headerClass="headwidth5 
                    sortable"  media="html" 
                    autolink="false" >
                    
                    <div class="dspNumber">
                        ${miListaId.CUSUARI}
                    </div>
                </display:column>
                
                <display:column title="${title6}" 
                    sortable="true" 
                    style="width:25%;" 
                    sortProperty="TNOMBRE"
                    headerClass="sortable" 
                    media="html" autolink="false" >
                    
                    <div class="dspText">
                        ${miListaId.TNOMBRE}
                    </div>
                </display:column>                
                
                <display:column 
                    title="${title5}" 
                    sortable="true" 
                    style="width:5%;" 
                    sortProperty="FFECMOV"
                    headerClass="headwidth5 
                    sortable"  media="html" 
                    autolink="false" >
                    
                    <div class="dspDate">
                        <fmt:formatDate pattern='dd/MM/yyyy' value='${miListaId.FFECMOV}'/>
                    </div>
                </display:column>
                
                <display:column title="${title4}" 
                    sortable="true" style="width:5%;" 
                    sortProperty="NPOLIZA" 
                    headerClass="headwidth5 sortable"  
                    media="html"
                    autolink="false" >
                    
                    <div class="dspNumber">                    
                        ${miListaId.NPOLIZA}
                    </div>
                </display:column>
                
                <display:column title="${title9}" 
                    sortable="true" style="width:5%;" 
                    sortProperty="NPOLIZAD" 
                    headerClass="headwidth5 sortable"  
                    media="html"
                    autolink="false" >
                    
                    <div class="dspNumber">                
                        ${miListaId.NPOLIZAD}
                    </div>
                </display:column>
                
                <display:column 
                    title="${title3}" 
                    sortable="true" 
                    style="width:5%;" 
                    sortProperty="ESTADO"
                    headerClass="headwidth5 
                    sortable"  media="html" 
                    autolink="false" >
                    
                    <div class="dspText">
                        ${miListaId.ESTADO}
                    </div>
                </display:column>
                
                <display:column title="${title2}" 
                    sortable="true" style="width:15%;" 
                    sortProperty="METODO" headerClass="sortable"  
                    media="html" autolink="false" >
                
                    <div class="dspText">
                        ${miListaId.METODO}              
                    </div>
                </display:column>                                                  
                
                <display:column 
                    title="${title1}" 
                    sortable="true" 
                    style="width:15%;" 
                    sortProperty="CRAZON"
                    headerClass="headwidth5 
                    sortable"  media="html" 
                    autolink="false" >
                    
                    <div class="dspText">
                        ${miListaId.CRAZON} 
                    </div>
                </display:column>
                
                <display:column 
                    title="${title0}" 
                    sortable="false" 
                    style="width:5%;" 
                    sortProperty=""
                    headerClass="headwidth5 
                    sortable"  media="html" 
                    autolink="false" >
                    
                    <div class="dspText">
                        <img border="0" src="images/firmar.gif" onclick="javascript:f_abrir_axisadm094a('${miListaId.SSEGURO}','${miListaId.SPERSON}','${miListaId.SEQCAJA}','${miListaId.TNOMBRE}','${miListaId.IMOVIMI}','${miListaId.CRAZON}','${miListaId.CESTADO}','${miListaId.NPOLIZA}','${miListaId.METODO}','${miListaId.TIPPAG}')" style="cursor:pointer" alt="Delete" title="Authorize"/>
                    </div>
                </display:column>
                
                <display:column title="" sortable="true" 
                                sortProperty="" headerClass="sortable fixed" 
                                media="html"  autolink="false" style="width:3%;" >
                    <div class="dspIcons" >
                    <img border="0" alt="<axis:alt c="BT_CONSULTAR" f="axisadm094" lit="1000113"/>" 
                        title="<axis:alt c="BT_CONSULTAR" f="axisadm094" lit="1000113"/>" src="images/informacion.gif" width="12px" height="12px"
                        style="cursor:pointer;" onClick="javascript:f_seleccionar('${miListaId.SEQCAJA}', '${miListaId.NNUMLIN}')" />
                    </div>
               </display:column>
                
                </display:table>
                
                </div>
                
            </td>
            </tr>            
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm094</c:param><c:param name="f">axisadm094</c:param>
                <c:param name="f">axisadm094</c:param>
                <c:param name="__botones">salir,9908375</c:param>
            </c:import>
        </form>
        
        <c:import url="../include/mensajes.jsp" />
        
    </body>
    
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
    <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisadm094');
    </script>                   
    </c:if>
</html>