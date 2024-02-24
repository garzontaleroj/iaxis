<%/*
*  Fichero: axisman002.jsp
*
*  
*/
%>
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
        <!--*********************************** -->    
        <script type="text/javascript">
        
        $(document).on('input keyup', 'textarea[maxlength]', function(e) {
    // maxlength attribute does not in IE prior to IE10
    // http://stackoverflow.com/q/4717168/740639
    var $this = $(this);
    var maxlength = $this.attr('maxlength');
    if (!!maxlength) {
        var text = $this.val();

        if (text.length > maxlength) {
            // truncate excess text (in the case of a paste)
            $this.val(text.substring(0,maxlength));
            e.preventDefault();
        }

    }

});
                    
            function f_onload() {
                f_cargar_propiedades_pantalla();
              <% if (request.getAttribute("__formdata") != null )
                {  %>
                var CODMANDATO = "${__formdata.CMANDATO}";                   
                if (objUtiles.estaVacio(CODMANDATO)) {
                    f_abrir_axisman001();  
                }else{
                    $("#CMANDATO").val(CODMANDATO);
                    var NUMEROFOLIO = "${__formdata.NUMEROFOLIO}";
                    objAjax.invokeAsyncCGI("axis_axisman002.do?", callbackAjaxCargarComboAcciones, "operation=ajax_cargar_acciones&CODMANDATO="+CODMANDATO+"&NUMEROFOLIO="+NUMEROFOLIO,
                                   this, objJsMessages.jslit_cargando);              
                }
                    
                var guardat = "${__formdata.guardat}";
                if ((!objUtiles.estaVacio(guardat))&&(guardat=="0")){
                    f_limpiarForm();
                    alert('<axis:alt f="axisman002" c="FECHA" lit="180121"/>');
                    f_abrir_axisman001();  
                }
             <% }  %> 
            }
            
            function f_aceptar_axisman001 (CODMANDATO,NUMEROFOLIO,CODIGOBANCO,CUENTABANCARIA,COBRADORBANC,CODTIPOTARJETA,FVENCIM, SUCURSAL) {
                objUtiles.cerrarModal("axisman001");
              
                if (objUtiles.estaVacio(CODMANDATO)){
                    return false;
                }
                
                document.miForm.CMANDATO.value=CODMANDATO;
                document.miForm.NUMFOLIO.value= NUMEROFOLIO; 
                document.miForm.CMETMOV.value= COBRADORBANC;
                f_cargar_propiedades_pantalla();
                document.miForm.CTIPCC.value= CODTIPOTARJETA;
                document.miForm.CNUMTAR.value=COBRADORBANC==1?CUENTABANCARIA:null;
                document.miForm.CINSEMI.value=COBRADORBANC==1?CODIGOBANCO:null;
                document.miForm.FVENCIM.value= FVENCIM;
                document.miForm.CBANCO.value=COBRADORBANC==2?CODIGOBANCO:null;
                document.miForm.CNCTACTE.value=COBRADORBANC==2?CUENTABANCARIA:null;
                document.miForm.CSUCURSAL.value =SUCURSAL;
                
           objAjax.invokeAsyncCGI("axis_axisman002.do?", callbackAjaxCargarComboAcciones, "operation=ajax_cargar_acciones&CODMANDATO="+CODMANDATO+"&NUMEROFOLIO="+NUMEROFOLIO,
                                   this, objJsMessages.jslit_cargando);  
              
            }
            
                       function callbackAjaxCargarComboAcciones(ajaxResponseText){
                 var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("element");
                    
                    var CCRITERIOCombo = document.miForm.CACCION;     
                   objDom.borrarOpcionesDeCombo(CCRITERIOCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '<axis:alt f="axiscomi010" c="MIN_VALUE" lit="108341"/>', CCRITERIOCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CCRITERIO= objDom.getValorNodoDelComponente(doc.getElementsByTagName("CATRIBU"), i, 0);
                            var TCRITERIO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TATRIBU"), i, 0);                                     
                            objDom.addOpcionACombo(CCRITERIO, TCRITERIO, CCRITERIOCombo, i+1);
                        }
                   

                }
          f_cargar_propiedades_pantalla();
                 }
        
            
            function f_aceptar_modal(pantalla){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axisman002.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axisman002.do?"+param, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
    
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
              
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    

                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_cerrar_modal(pantalla){
                objUtiles.cerrarModal(pantalla);
            }      
            
            function f_but_salir(){
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisman002", "cancelar", document.miForm, "_self");            
            }

        
            function f_limpiarForm(){
                    objDom.setValorPorId("CMANDATO","");
                     objDom.setValorPorId("NUMFOLIO","");
                      objDom.setValorPorId("CMETMOV","");
                       objDom.setValorPorId("CTIPCC","");
                        objDom.setValorPorId("CNUMTAR","");
                         objDom.setValorPorId("CBANCO","");
                          objDom.setValorPorId("CMETMOV","");
                           objDom.setValorPorId("FVENCIM","");
                            objDom.setValorPorId("CINSEMI","");
                             objDom.setValorPorId("CNCTACTE","");
                             objDom.setValorPorId("CCOMENTARIO","");
                              objDom.setValorPorId("CPREVISION","");
                               objDom.setValorPorId("CMANULACION","<%= Integer.MIN_VALUE %>");
                               f_cargar_propiedades_pantalla();
                             
                           
                    
            }
            
                      
             function f_abrir_axisman001(){
               f_abrir_modal("axisman001",null,null);
               
            }  
            
            function f_cerrar_axisman001(){
                objUtiles.cerrarModal("axisman001");
            }   
          
                      
            
            function f_but_aceptar(){
       
           if(document.miForm.CMANDATO.value==""){
             f_abrir_axisman001(); 
             return false;
             }
            
                 if (!objValidador.validaEntrada()) {
                    return false;
                 } 
                var FHOY = new Date();                
                 var from =  document.miForm.CPREVISION.value; 
                var numbers = from.split(/\//g); 
                var date = new Date(numbers[2], numbers[1]-1, numbers[0]);
                     
                if(!objUtiles.estaVacio(date)){
                    if(FHOY.setHours(0,0,0,0) > date){                      
                            alert('<axis:alt f="axisman002" c="FECHA" lit="9906817"/>');
                   return false;
                   }
                 }                 
                 objUtiles.ejecutarFormulario("axis_axisman002.do","m_aceptar",document.miForm, "_self", objJsMessages.jslit_cargando);  
             
            }
                                  
                                             
            function f_cambiar(){
                f_cargar_propiedades_pantalla();
            }
           function f_stripInvalidChars( str ){
                str =str.toUpperCase() + '';
                var rgx = /^[\060-\071]|[\101-\132]|[\141-\172]|[\055]$/i;
                var out = '';
                for( var i = 0; i < str.length; i++ ){
                    if( rgx.test( str.charAt(i) ) ){
                        out += str.charAt(i);
                    }
                }
                return out;
            }
            
            function f_cleanInvalidChars(idobject){
                var value="";
                value=f_stripInvalidChars(objDom.getValorPorId(idobject));
                objDom.setValorPorId(idobject,value);
            }
           
           
        </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

    <form name="miForm" action="axis_axisman002.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
              
             <input type="hidden" id="CMANDATO" name="CMANDATO" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axisman002" lit="9906606"/></c:param>
                <c:param name="producto"><axis:alt c="form" f="axisman002" lit="9906571"/> - <axis:alt c="form" f="axisman002" lit="101109"/></c:param>
                <c:param name="form">axisman002</c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisman001|<axis:alt f="axisman001" c="MODAL_axisman001" lit="109142"/> <axis:alt f="axisman010" c="MODAL_axisman001" lit="9906588"/></c:param>
            </c:import>
            
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                <td>
                 <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <axis:alt f="axisman002" c="DATOS_AGE" lit="9906571"/> - 
                    <img border="0" src="images/find.gif" onclick="f_abrir_axisman001()" style="cursor:pointer"/>
                </div>
                <table class="seccion" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left" >
                            <table class="area" align="center">
                            <tr>
                                <th style="width:20%;"></th>
                                <th style="width:20%;"></th>
                                <th style="width:15%;"></th> 
                                <th style="width:20%;"></th>
                                 <th style="width:15%;"></th>
                                <th ></th>   
                            </tr>  
                             <tr>
                                <axis:ocultar f="axisman002" c="NUMFOLIO" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_NUMFOLIO">
                                       <b id="label_NUMFOLIO" ><axis:alt f="axisman002" c="NUMFOLIO" lit="9906670"/></b>
                                    </td>
                                </axis:ocultar>
                             
                             </tr>
                              <tr>
                                
                                <axis:ocultar f="axisman002" c="NUMFOLIO" >
                                    <td class="campocaja" id = "td_NUMFOLIO">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NUMFOLIO}" name="NUMFOLIO" id="NUMFOLIO" 
                                              <axis:atr f="axisman002" c="NUMFOLIO" /> 
                                              onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)" readonly
                                             title="<axis:alt f="axisman002" c="NUMFOLIO" lit="9906670"/>"  size="15" />
                                    </td>
                                </axis:ocultar>
                               
                            </tr>
                           <tr>
                                <axis:ocultar f="axisman002" c="CMETMOV" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CMETMOV">
                                       <b id="label_CMETMOV" ><axis:alt f="axisman002" c="CMETMOV" lit="9902938"/></b>
                                    </td>
                                </axis:ocultar>
                                                    
                                
                                 <axis:ocultar f="axisman002" c="CBANCO" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CBANCO">
                                       <b id="label_CBANCO"><axis:alt f="axisman002" c="CBANCO" lit="9000964"/></b>
                                    </td>
                                </axis:ocultar>                              
                                 <axis:ocultar f="axisman002" c="CNCTACTE" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CNCTACTE" colspan="2"> 
                                       <b id="label_CNCTACTE"><axis:alt f="axisman002" c="CNCTACTE" lit="9906592"/></b>
                                    </td>
                                </axis:ocultar>
                                
                              
                                
                                   <axis:ocultar f="axisman002" c="CTIPCC" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CTIPCC"> 
                                       <b id="label_CTIPCC"><axis:alt f="axisman002" c="CTIPCC" lit="9902671"/></b>
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman002" c="CNUMTAR" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CNUMTAR"> 
                                       <b id="label_CNUMTAR"><axis:alt f="axisman002" c="CNUMTAR" lit="9906593"/></b>
                                    </td>
                                    </axis:ocultar>    
                                <axis:ocultar f="axisman002" c="CINSEMI" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CINSEMI" > 
                                       <b id="label_CINSEMI"><axis:alt f="axisman002" c="CINSEMI" lit="9906594"/></b>
                                    </td>
                                </axis:ocultar> 
                                 <axis:ocultar f="axisman002" c="FVENCIM" dejarHueco="false"> 
                                     <td class="titulocaja" id="tit_FVENCIM">
                                    <b><axis:alt f="axisman002" c="FVENCIM" lit="100885"/></b> <!-- Fecha vencimiento -->
                                </td>
                                      </axis:ocultar>
                           </tr>
                            <tr>
                                <axis:ocultar f="axisman002" c="CMETMOV" dejarHueco="false"> 
                                    <td class="campocaja"  id = "td_CMETMOV">
                                        <select name="CMETMOV" id="CMETMOV" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                                                title="<axis:alt f="axisman002" c="CMETMOV" lit="9902938"/>" onchange="f_cambiar();" value="${__formdata.CMETMOV}"
                                            <axis:atr f="axisman002" c="CMETMOV" a="modificable=false&isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axisman002" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="medio_mov" items="${__formdata.FORMAPAGO}">
                                                <option value="${medio_mov.CCOBBAN}"  
                                                <c:if test="${__formdata.CMETMOV == medio_mov.CCOBBAN}">selected</c:if>>
                                                ${medio_mov.DESCRIPCION}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman002" c="CBANCO" >
                                    <td class="campocaja" id = "td_CBANCO">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CBANCO}" name="CBANCO" id="CBANCO" 
                                              <axis:atr f="axisman002" c="CBANCO" /> readonly
                                              onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)"
                                             title="<axis:alt f="axisman002" c="CBANCO" lit="9000964"/>"  size="15" />
                                    </td>
                                </axis:ocultar>
                                
                                 <axis:ocultar f="axisman002" c="CNCTACTE" >
                                    <td class="campocaja" id = "td_CNCTACTE" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CNCTACTE}" name="CNCTACTE" id="CNCTACTE" 
                                              <axis:atr f="axisman002" c="CNCTACTE" /> readonly
                                              onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)"
                                             title="<axis:alt f="axisman002" c="CNCTACTE" lit="9906592"/>"  size="15" />
                                    </td>
                                </axis:ocultar>  
                                
                                
                                   <axis:ocultar f="axisman002" c="CTIPCC" >
                                    <td class="campocaja" id = "td_CTIPCC">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CTIPCC}" name="CTIPCC" id="CTIPCC" 
                                              <axis:atr f="axisman002" c="CTIPCC" /> 
                                              onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)" readonly
                                             title="<axis:alt f="axisman002" c="CTIPCC" lit="9903154"/>"  size="15" />
                                    </td>
                                </axis:ocultar>
                                
                                       <axis:ocultar f="axisman002" c="CNUMTAR" >
                                    <td class="campocaja" id = "td_CNUMTAR">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CNUMTAR}" name="CNUMTAR" id="CNUMTAR" 
                                              <axis:atr f="axisman002" c="CNUMTAR" />  readonly
                                              onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)"
                                             title="<axis:alt f="axisman002" c="CNUMTAR" lit="9906593"/>"  size="15" />
                                    </td>
                                </axis:ocultar>  
                              
                               
                                 <axis:ocultar f="axisman002" c="CINSEMI" >
                                    <td class="campocaja" id = "td_CINSEMI">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CINSEMI}" name="CINSEMI" id="CINSEMI" 
                                              <axis:atr f="axisman002" c="CINSEMI" />  readonly
                                              onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)"
                                             title="<axis:alt f="axisman002" c="CINSEMI" lit="9906593"/>"  size="15" />
                                    </td>
                                </axis:ocultar>  
                               
                                 <axis:ocultar f="axisman002" c="FVENCIM" >
                                    <td class="campocaja" id = "td_FVENCIM">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.FVENCIM}" name="FVENCIM" id="FVENCIM" 
                                              <axis:atr f="axisman002" c="FVENCIM" /> readonly
                                             title="<axis:alt f="axisman002" c="FVENCIM" lit="100885"/>"  size="15" />
                                    </td>
                                </axis:ocultar>                               
                                                                               
                          <tr>  
                            
                            
                              
                              </tr>
                             <tr> 
                             
                                
                                
                                
                            
                             </tr>                                                                                
                                
                                 <axis:ocultar f="axisman002" c="CACCION" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CACCION">
                                       <b id="label_CACCION"><axis:alt f="axisman002" c="CACCION" lit="9000844"/></b>
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman002" c="CMANULACION" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CMANULACION">
                                       <b id="label_CMANULACION"><axis:alt f="axisman002" c="CMANULACION" lit="103218"/></b>
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman002" c="CPREVISION" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CPREVISION">
                                       <b id="label_CPREVISION"><axis:alt f="axisman002" c="CPREVISION" lit="9906607"/></b>
                                    </td>
                                </axis:ocultar>
                                
                                 <axis:ocultar f="axisman002" c="CSUCURSAL" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CSUCURSAL"> 
                                       <b id="label_CSUCURSAL"><axis:alt f="axisman002" c="CSUCURSAL" lit="9002202"/></b>
                                    </td>
                                </axis:ocultar>
                               
                             </tr>
                            
                            
                            <tr>                                                              
                               
                                <axis:ocultar f="axisman002" c="CACCION" >
                                   
                                   <td class="campocaja"  id = "td_CACCION">
                                        <select name="CACCION" id="CACCION" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                                                title="<axis:alt f="axisman002" c="CACCION" lit="9000844"/>" onchange="f_cambiar();" obligatorio=true
                                            <axis:atr f="axisman002" c="CACCION" a="isInputText=false"/>>
                                             <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axisman002" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="accion" items="${__formdata.ACCIONES}">
                                                <option value="${medio_mov.CATRIBU}"
                                                <c:if test="${__formdata.CACCION == accion.CATRIBU}">selected</c:if>>
                                                ${accion.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>  
                                </axis:ocultar>
                                  <axis:ocultar f="axisman002" c="CMANULACION" dejarHueco="false">
                                  <td class="campocaja"  id = "td_CMANULACION">
                                        <select name="CMANULACION" id="CMANULACION" size="1" class="campowidthselect campo campotexto_ob" style="width:100%;" 
                                                title="<axis:alt f="axisman002" c="CMANULACION" lit="103218"/>" onchange="f_cambiar();"
                                            <axis:atr f="axisman002" c="CMANULACION" a="isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axisman002" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="accion" items="${__formdata.MRECHAZOS}">
                                                <option value="${accion.CATRIBU}"
                                                <c:if test="${__formdata.CMANULACION == accion.CATRIBU}">selected</c:if>>
                                                ${accion.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>  
                                </axis:ocultar>
                               
                               
                                <axis:ocultar f="axisman002" c="CPREVISION" dejarHueco="false">
                        <td class="campocaja" id = "td_CPREVISION">
                          <input type="text" style="width:60%" class="campowidthinput campo campotexto" id="CPREVISION" name="CPREVISION" title='<axis:alt f="axisman002" c="CPREVISION" lit="9906607"/>'
                                 size="15" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.CPREVISION}'/>" <axis:atr f="axisman002" c="CPREVISION" a="modificable=true&formato=fecha"/>/>
                          <a id="icon_CPREVISION" style="vertical-align:middle;" href="#">
                            <img id="popup_calendario_CPREVISION" border="0" src="images/calendar.gif"/>
                          </a>
                        </td>
                        </axis:ocultar>
                             <axis:ocultar f="axisman002" c="CSUCURSAL" >
                                    <td class="campocaja" id = "td_CSUCURSAL">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CSUCURSAL}" name="CSUCURSAL" id="CSUCURSAL" 
                                              <axis:atr f="axisman002" c="CSUCURSAL" /> readonly
                                              onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)"
                                             title="<axis:alt f="axisman002" c="CSUCURSAL" lit="9002202"/>"  size="15" />
                                    </td>
                                </axis:ocultar>                                 
                               
                            </tr>
                             <tr>
                               <axis:ocultar f="axisman002" c="CCOMENTARIO" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CCOMENTARIO">
                                       <b id="label_CCOMENTARIO"><axis:alt f="axisman002" c="CCOMENTARIO" lit="9902597"/></b>
                                    </td>
                                </axis:ocultar>
                            
                             </tr>
                            
                               <tr>
                                     <axis:visible f="axisman002" c="CCOMENTARIO">
                                        <td class="campocaja" colspan="5">
                                             <textarea title="<axis:alt f="axisman002" c="CCOMENTARIO" lit="9902597"/>" maxlength="2000"  cols="" rows="8" class="campo campotexto"  id="CCOMENTARIO" name="CCOMENTARIO" size="15" 
                                             style="width:98%;">${__formdata.CCOMENTARIO}</textarea>
                                        </td>
                                    </axis:visible>
                                 
                                 </tr>
                            
                                                      
                        </table>
            </td>
        </tr>
        </table>
    </form>    
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axisman002</c:param>
       <c:param name="__botones"><axis:ocultar f="axisman002" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axisman002" c="BT_ACEPTAR">,aceptar</axis:ocultar></c:param>
    </c:import>
    
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "CPREVISION",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_CPREVISION", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
        
        
    <c:import url="../include/mensajes.jsp" />    
</body>
</html>


