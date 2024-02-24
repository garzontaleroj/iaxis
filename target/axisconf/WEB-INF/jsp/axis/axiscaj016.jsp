<%/*
*  Fichero: axiscaj016.jsp
*
*  Fecha: 29/06/2009
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
        var tipo_agente;
            function f_onload() {
                f_cargar_propiedades_pantalla();
                }
            
             function f_but_buscar() {
                
                    objUtiles.ejecutarFormulario("axis_axiscaj016.do","buscar_sobrantes",document.miForm, "_self", objJsMessages.jslit_cargando);      
              
            }
            
              function f_but_cancelar() {
             objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscaj016", "cancelar", document.miForm, "_self");            
            }
            
         function  validaNumerico(id,valor,saldo){
       
          if(!objNumero.validaNumero(valor))  { 
           objDom.setValorPorId (id, "0");
            alert("<axis:alt f="axiscaj016" c="IMPORTE" lit="9906320"/>");          
            return false;
            }
         if(valor>saldo)  { 
          objDom.setValorPorId (id, "0");
            alert("<axis:alt f="axiscaj016" c="IMPORTE" lit="9906331"/>");  
            return false;
            }
            if(saldo<0) { 
             objDom.setValorPorId (id, "0");
            alert("<axis:alt f="axiscaj016" c="IMPORTE" lit="9906332"/>");  
            return false;
            }
            }
           
             function f_but_9001333() {
                      objDom.setValorPorId ("CAGENTETEXTI", "");
                     objDom.setValorPorId ("CAGENTEI", "");
                    objDom.setValorPorId ("TNOMBREI", "");
                    objDom.setValorPorId ("NNUMIDEI", "");
                      objDom.setValorPorId ("CAGENTETEXTP", "");
                     objDom.setValorPorId ("CAGENTEP", "");
                    objDom.setValorPorId ("TNOMBREP", "");
                    objDom.setValorPorId ("NNUMIDEP", "");
             
                   var Combo = document.miForm.TFICHERO;     
                    objDom.borrarOpcionesDeCombo(Combo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '<axis:alt f="axiscaj016" c="MIN_VALUE" lit="108341"/>', Combo, 0);
              
              //  objDom.borrarOpcionesDeCombo(combo);
                
            }
           
            
            function f_aceptar_modal(pantalla){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axiscaj016.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axiscaj016.do?"+param, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
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
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscaj016", "cancelar", document.miForm, "_self");            
            }
          
            
            function f_abrir_axisctr014_intermediario(){
            tipo_agente="INTERMEDIARIOS";
            var partner=document.getElementById("CAGENTEP").value;
            f_abrir_modal('axisctr014',null,"&CONDICION=INTERMEDIARIOS&PARTNER="+partner);
            }  
            
              function f_abrir_axisctr014_partner(){
              tipo_agente="PARTNERS"
            f_abrir_modal('axisctr014',null,"&CONDICION=PARTNERS");
            }  
            
            function f_cerrar_axisctr014(){
                objUtiles.cerrarModal("axisctr014");
            }   
            function f_aceptar_axisctr014(CODI){
                if (!objUtiles.estaVacio(CODI)) {
                
                if(tipo_agente=="PARTNERS"){
                    $("#CAGENTEP").val(CODI);
                     objDom.setValorPorId ("CAGENTETEXTI", "");
                     objDom.setValorPorId ("CAGENTEI", "");
                    objDom.setValorPorId ("TNOMBREI", "");
                    objDom.setValorPorId ("NNUMIDEI", "");
                    }
                else if(tipo_agente=="INTERMEDIARIOS")  
                    $("#CAGENTEI").val(CODI);
                    objUtiles.cerrarModal("axisctr014");
                    objUtiles.ejecutarFormulario("axis_axiscaj016.do?&CAGENTE="+CODI+"&TIPO="+tipo_agente, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            } 
            
            function f_but_nueva_persona() {
                f_abrir_axisper005();
            }
            
            function  f_abrir_axisper005() {
                objUtiles.cerrarModal("axisper001");
                objUtiles.abrirModal("axisper005", "src", "modal_axisper005.do?operation=form&faceptar=f_aceptar_axisper005"+"&ORIGEN=AXISPRF001" );
            }
            
            function f_abrir_axisper010NOU(isNew){
                f_cerrar_axisctr014();
                objDom.setVisibilidadPorId('but_cerrar_modal_axisper010', 'hidden');
                objUtiles.abrirModal("axisper010","src","modal_axisper010.do?operation=form&isNew="+isNew);
            }  
            
              
            function f_but_aceptar(){
              
               $(".f_ficheros:checkbox:checked").each(function(){
                $("#CADENA").val($("#CADENA").val()+"-"+$(this).val()+"_"+$("#NUMLIN-"+$(this).attr("id")).val() +"_"+$("#IMPORTE-"+$(this).attr("id")).val());
                  });     
            
             //alert($("#CADENA").val());
             objUtiles.ejecutarFormulario("axis_axiscaj016.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando); 
              
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

    <form name="miForm" action="axis_axiscaj016.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="CADENA" name="CADENA" value=""/>           
            <input type="hidden" id="CAGENTEI" name="CAGENTEI" value="${__formdata.CAGENTEI}"/>
            <input type="hidden" id="CAGENTEP" name="CAGENTEP" value="${__formdata.CAGENTEP}"/>
            <input type="hidden" id="TIPO" name="TIPO" value="${__formdata.TIPO}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axiscaj016" lit="9906268"/></c:param>
                <c:param name="producto"><axis:alt c="form" f="axiscaj016" lit="9906268"/></c:param>
                <c:param name="form">axiscaj016</c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr014|<axis:alt f="axiscaj016" c="MODAL_AXISctr014" lit="101024" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper010|<axis:alt f="axiscaj016" c="MODAL_AXISPER010" lit="110275" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axiscaj010|<axis:alt f="axiscaj016" c="MODAL_AXISCAJ010" lit="9905082" /></c:param>
            </c:import>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                <td>
                 <div class="titulo">
                    <img src="images/flecha.gif"/>
                    <axis:alt f="axiscaj016" c="DATOS_AGE" lit="9906270"/> 
                   
                </div>
                <table class="seccion" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left" >
                            <table class="area" align="center">
                            <tr>
                                <th style="width:25%;"></th>
                                <th style="width:25%;"></th>
                                <th style="width:25%;"></th>  
                                <th style="width:25%;"></th> 
                                <th ></th>   
                            </tr>  
                            
                            <tr>
                                <axis:ocultar f="axiscaj016" c="CAGENTEP" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj016" c="CAGENTEP" lit="9906273"/></b>
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014_partner()" style="cursor:pointer"/>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axiscaj016" c="TNOMBREP" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj016" c="TNOMBREP" lit="9905070"/></b>
                                    </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axiscaj016" c="NNUMIDEP" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj016" c="NNUMIDEP" lit="9903661"/></b>
                                    </td>
                                </axis:ocultar>
                           </tr>
                            <tr>
                                  <axis:ocultar f="axiscaj016" c="CAGENTEP" >
                                    <td class="campocaja">
                                        <input type="text" class="campodisabled campo campotexto" value="${__formdata.AGENTEP.CODI}" name="CAGENTETEXTP" id="CAGENTETEXTP" 
                                               readonly="true" style="width:90%" size="15"  />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj016" c="TNOMBREP" >
                                    <td class="campocaja">
                                        <input type="text" class="campodisabled campo campotexto" value="${__formdata.AGENTEP.NOMBRE}" name="TNOMBREP" id="TNOMBREP" 
                                               readonly="true" style="width:100%" size="15" />
                                    </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axiscaj016" c="NNUMIDEP" >
                                    <td class="campocaja">
                                        <input type="text" class="campodisabled campo campotexto" value="${__formdata.AGENTEP.NNUMIDE}" name="NNUMIDEP" id="NNUMIDEP" 
                                               readonly="true" style="width:100%" size="15" />
                                    </td>
                                </axis:ocultar>
                                
                                 
                            </tr>
                            
                             <tr>
                                <axis:ocultar f="axiscaj016" c="CAGENTEI" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj016" c="CAGENTEI" lit="9906274"/></b>
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014_intermediario()" style="cursor:pointer"/>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axiscaj016" c="TNOMBREI" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj016" c="TNOMBREI" lit="9902363"/></b>
                                    </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axiscaj016" c="NNUMIDEI" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj016" c="NNUMIDEI" lit="9903661"/></b>
                                    </td>
                                </axis:ocultar>
                                 
                            </tr>
                            <tr>
                                  <axis:ocultar f="axiscaj016" c="CAGENTEI" >
                                    <td class="campocaja">
                                        <input type="text" class="campodisabled campo campotexto" value="${__formdata.AGENTEI.CODI}" name="CAGENTETEXTI" id="CAGENTETEXTI" 
                                               readonly="true" style="width:90%" size="15"  />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axiscaj016" c="TNOMBREI" >
                                    <td class="campocaja">
                                        <input type="text" class="campodisabled campo campotexto" value="${__formdata.AGENTEI.NOMBRE}" name="TNOMBREI" id="TNOMBREI" 
                                               readonly="true" style="width:100%" size="15" />
                                    </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axiscaj016" c="NNUMIDEI" >
                                    <td class="campocaja">
                                        <input type="text" class="campodisabled campo campotexto" value="${__formdata.AGENTEI.NNUMIDE}" name="NNUMIDEI" id="NNUMIDEI" 
                                               readonly="true" style="width:100%" size="15" />
                                    </td>
                                </axis:ocultar>
                                
                            </tr>
                             <tr>
                            
                                   <axis:ocultar f="axiscaj016" c="TFICHERO" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axiscaj016" c="TFICHERO" lit="1000574"/></b>
                                    </td>
                                </axis:ocultar>
                              </tr>
                            
                              <tr>
                            
                             <axis:ocultar f="axiscaj016" c="TFICHERO" dejarHueco="false"> 
                                    <td class="campocaja"  id = "TFICHERO">
                                        <select name="TFICHERO" id="TFICHERO" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                                                title="<axis:alt f="axiscaj016" c="TFICHERO" lit="9902938"/>" 
                                            <axis:atr f="axiscaj016" c="TFICHERO" a="obligatorio=false&isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axiscaj016" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="fichero" items="${__formdata.ListaFicheros}">
                                                <option value="${fichero.TFICHERO}"
                                                <c:if test="${__formdata.TFICHERO == fichero.TFICHERO}">selected</c:if>>
                                                ${fichero.TFICHERO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            </tr>
                        </table>
                         <c:import url="../include/botonera_nt.jsp">              
                       <c:param name="__botones"><axis:ocultar f="axiscaj016" c = "BT_9001333" dejarHueco="false">9001333</axis:ocultar>,<axis:ocultar f="axiscaj016" c = "BT_BUSCAR" dejarHueco="false">buscar</axis:ocultar></c:param>
                        </c:import>
            </td>
        </tr>
        </table>
         <table class="seccion">         
                          <tr><td>
                                       <c:set var="title0"><axis:alt f="axiscaj016" c="AGENTE" lit="100584"/></c:set>
                                       <c:set var="title1"><axis:alt f="axiscaj016" c="TFICHERO" lit="1000574"/></c:set>
                                       <c:set var="title2"><axis:alt f="axiscaj016" c="SALDO" lit="9001942"/></c:set>
                                       <c:set var="title3"><axis:alt f="axiscaj016" c="IMPORTE" lit="9906333"/></c:set>
                               </td>
                               <td>
                              <div class="seccion">
                                <display:table name="${__formdata.LSTFICHEROS}" id="listFICHEROS"  export="false"
                                               class="dsptgtable" pagesize="15"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axiscaj016.do?paginar=true">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  
                                   <axis:ocultar f="axiscaj016" c="CFICHERO" dejarHueco="false">
                            <display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:20px" >
                                <div class="dspIcons">
                                        <input type="checkbox" id="${listFICHEROS.SPAGMAS}-${listFICHEROS.NUMLIN}" name="f_ficheros"  value="${listFICHEROS.SPAGMAS}"
                                       class="f_ficheros" /> 
                                </div>
                            </display:column>
                        </axis:ocultar>
                       
                                  <axis:visible f="axiscaj016" c="AGENTE">
                                   <display:column title="${title0}"
                                                  sortable="false"
                                                  sortProperty="AGENTE"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                   <div class="dspText">
                                   ${listFICHEROS.AGENTE}</div>              
                                  </display:column>
                                  </axis:visible>
                                  <display:column title="${title1}"
                                                  sortable="false"
                                                  sortProperty="TFICHERO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                     <div class="dspText">
                                    ${listFICHEROS.TFICHERO}</div>   
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="false"
                                                  sortProperty="SALDO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                    ${listFICHEROS.SALDO} </div>  
                                  </display:column>                                
                                 
                                     <axis:ocultar f="axiscaj016" c="IMPORTE">
                                  <display:column title="${title3}" sortProperty="IMPORTE" sortable="false"  headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspNumber">
                                      <input type="text" class="campodisabled campo campotexto"  id="IMPORTE-${listFICHEROS.SPAGMAS}-${listFICHEROS.NUMLIN}" name="IMPORTE-${listFICHEROS.SPAGMAS}-${listFICHEROS.NUMLIN}" 
                                        format="decimal" value="0" onchange="validaNumerico(this.id,this.value,${listFICHEROS.SALDO})">  
                                </div>
                                                               
                                     <input type="hidden" id="NUMLIN-${listFICHEROS.SPAGMAS}-${listFICHEROS.NUMLIN}" name="NUMLIN-${listFICHEROS.SPAGMAS}-${listFICHEROS.NUMLIN}"  
                                        class="NUMLIN-${listFICHEROS.SPAGMAS}-${listFICHEROS.NUMLIN}" value="${listFICHEROS.NUMLIN}"/> 
                                
                            </display:column>
                        </axis:ocultar>
                                   
                                </display:table>
                                <br>                               
                                </td></tr>
                        </table>
             <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axiscaj016</c:param>
       <c:param name="__botones"><axis:ocultar f="axiscaj016" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:visible f="axiscaj016" c="BT_ACEPTAR"><c:if test="true">,aceptar</c:if></axis:visible></c:param>
    </c:import>
        
          
    </form>   
   
      <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FCADTAR",     
                ifFormat       :    "%m%y",      
                button         :    "popup_calendario_FCADTAR", 
                singleClick    :    true,
                firstDay       :    1
            });    
        </script><!--%d/-->
    <c:import url="../include/mensajes.jsp" />    
</body>
</html>


