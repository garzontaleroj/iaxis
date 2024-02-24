<%
/**
*  Fichero: axisman001.jsp
* 
*  
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
        
          f_cargar_propiedades_pantalla();
          

        }
          function f_cambiar(){
                f_cargar_propiedades_pantalla();
            }
        
        
         function f_abrir_modal(cual, noXButton, optionalQueryString) {
              
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    

                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
        
                
        function f_but_cancelar() {
            
            parent.f_cerrar_axisman001();
            
        }        
        
       
         
          
              function f_aceptar_modal(pantalla){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("modal_axisman001.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
             function f_cerrar_modal(pantalla){
                objUtiles.cerrarModal(pantalla);
            }     
            
        
            
       
                 
           function f_but_9001333() {
                objDom.setValorPorId ("TNOMBRE", "");
                objDom.setValorPorId ("NNUMIDE", "");
                objDom.setValorPorId ("HTIPOPERSONA", "");
                $('input[name=TIPOPERSONA]').attr('checked',false);
                 objDom.setValorPorId ("FVENCIM", "");                
                 objDom.setValorPorId ("CMETMOV", "<%= Integer.MIN_VALUE %>");
                 objDom.setValorPorId ("CTIPCC", "<%= Integer.MIN_VALUE %>");
                  objDom.setValorPorId ("CNUMTAR", "");
                  objDom.setValorPorId ("CINSEMI", "<%= Integer.MIN_VALUE %>");
                  objDom.setValorPorId ("CBANCO", "<%= Integer.MIN_VALUE %>");
                   objDom.setValorPorId ("CSUCURSAL", "");
                    objDom.setValorPorId ("CNCTACTE", "");
                   objDom.setValorPorId ("CMANDATO", "");
                   objDom.setValorPorId ("CACCION", "<%= Integer.MIN_VALUE %>"); 
				   objDom.setValorPorId ("CESTADO", "<%= Integer.MIN_VALUE %>"); 
                    f_cargar_propiedades_pantalla();
            }
            
            
              function f_cleanInvalidChars(idobject){
                var value="";
                value=f_stripInvalidChars(objDom.getValorPorId(idobject));
                objDom.setValorPorId(idobject,value);
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
           
        //-----------------------------------------------------------------------------------------
        function f_but_buscar() {      
            if((objUtiles.estaVacio($("#TNOMBRE").val()) && objUtiles.estaVacio($("#NNUMIDE").val())) && !objUtiles.estaVacio($("#HTIPOPERSONA").val()) )
             alert("<axis:alt f="axisman001" c="ERRORSINMARCAR" lit="9906638"/>");
            else   if((!objUtiles.estaVacio($("#TNOMBRE").val()) || !objUtiles.estaVacio($("#NNUMIDE").val())) && objUtiles.estaVacio($("#HTIPOPERSONA").val()) )
               alert("<axis:alt f="axisman001" c="ERRORSINMARCAR" lit="9906638"/>");             
            else if (!objUtiles.estaVacio($("#FVENCIM").val()) && !valida_fecha($("#FVENCIM").val())){
             alert("<axis:alt f="axisman001" c="ERRORFORMATOFECHA" lit="9902404"/>");
            }
            else{
            
            if (objValidador.validaEntrada()){
             objUtiles.ejecutarFormulario("modal_axisman001.do", "busqueda_mandatos", document.miForm, "_self","<axis:alt f="axisman001" c="BUSCANDOMANDATO" lit="9906669"/>");
                }
            }
            
        }
     
      function valida_fecha(fecha){
 //Funcion validarFecha 
 //Escrita por Buzu feb 18 2010. (FELIZ CUMPLE BUZU!!!
 //valida fecha en formato aaaa-mm-dd
 var fechaArr = fecha.split('/');
 var mes = fechaArr[0];
 var ano = fechaArr[1];
 
 var plantilla = new Date(ano, mes - 1, 1);//mes empieza de cero Enero = 0

 if(!plantilla || plantilla.getFullYear() == ano && plantilla.getMonth() == mes -1){
 return true;
 }else{
 return false;
 }
}
        
        
        
        
         function f_but_aceptar(){
          
                if (!objUtiles.estaVacio($("#HCODMANDATO").val())){
                
                parent.f_aceptar_axisman001($("#HCODMANDATO").val(),$("#HNUMEROFOLIO").val(),$("#HCODIGOBANCO").val()
                                            ,$("#HCUENTABANCARIA").val(),$("#HCOBRADORBANC").val(),$("#HCODTIPOTARJETA").val()
                                            ,$("#HFVENCIM").val() ,$("#HSUCURSAL").val());  
                }
                 
                
            }
            
                   
             function f_seleccionar_mandato_link(CODMANDATO,NUMEROFOLIO,CODIGOBANCO,CUENTABANCARIA,COBRADORBANC,CODTIPOTARJETA,FVENCIM,SUCURSAL){   
     
            objDom.setValorPorId ("HCODMANDATO", CODMANDATO);
            objDom.setValorPorId ("HNUMEROFOLIO", NUMEROFOLIO);
            objDom.setValorPorId ("HCODIGOBANCO", CODIGOBANCO);
            objDom.setValorPorId ("HCUENTABANCARIA", CUENTABANCARIA);
            objDom.setValorPorId ("HCOBRADORBANC", COBRADORBANC);
            objDom.setValorPorId ("HCODTIPOTARJETA", CODTIPOTARJETA);
            objDom.setValorPorId ("HFVENCIM", FVENCIM);
            objDom.setValorPorId ("HSUCURSAL", SUCURSAL);
             f_but_aceptar();
        }
        
        function f_seleccionar_mandato(CODMANDATO,NUMEROFOLIO,CODIGOBANCO,CUENTABANCARIA,COBRADORBANC,CODTIPOTARJETA,FVENCIM){   
            objDom.setValorPorId ("HCODMANDATO", CODMANDATO);
            objDom.setValorPorId ("HNUMEROFOLIO", NUMEROFOLIO);
            objDom.setValorPorId ("HNUMEROFOLIO", NUMEROFOLIO);
            objDom.setValorPorId ("HCODIGOBANCO", CODIGOBANCO);
            objDom.setValorPorId ("HCUENTABANCARIA", CUENTABANCARIA);
            objDom.setValorPorId ("HCOBRADORBANC", COBRADORBANC);
            objDom.setValorPorId ("HCODTIPOTARJETA", CODTIPOTARJETA);
            objDom.setValorPorId ("HFVENCIM", FVENCIM);
             objDom.setValorPorId ("HSUCURSAL", SUCURSAL);
        }        
              
        
          
          function guardarcheck(element){        
           document.miForm.HTIPOPERSONA.value = element.value;         
          }
          
                   $(document).ready(function(){
    $("input:radio:checked").data("chk",true);
    $("input:radio").click(function(){
        $("input[name='"+$(this).attr("name")+"']:radio").not(this).removeData("chk");
        $(this).data("chk",!$(this).data("chk"));        
          if($(this).data("chk")==false)
          document.miForm.HTIPOPERSONA.value=""
        $(this).prop("checked",$(this).data("chk"));      
    });
});
            
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
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
         <form name="miForm" action="axis_axisman002.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>           
           <input type="hidden" id="HTIPOPERSONA" name="HTIPOPERSONA" value="${__formdata.HTIPOPERSONA}" />
            <input type="hidden" id="HCODMANDATO" name="HCODMANDATO" value=""/>
             <input type="hidden" id="HNUMEROFOLIO" name="HNUMEROFOLIO" value=""/>
              <input type="hidden" id="HCODIGOBANCO" name="HCODIGOBANCO" value=""/>
               <input type="hidden" id="HCUENTABANCARIA" name="HCUENTABANCARIA" value=""/>
                <input type="hidden" id="HCOBRADORBANC" name="HCOBRADORBANC" value=""/>
                 <input type="hidden" id="HCODTIPOTARJETA" name="HCODTIPOTARJETA" value=""/>
                  <input type="hidden" id="HFVENCIM" name="HFVENCIM" value=""/>
                     <input type="hidden" id="HSUCURSAL" name="HSUCURSAL" value=""/>
                       <input type="hidden" id="HCONSULTA" name="HCONSULTA" value="${__formdata.HCONSULTA}"/>
                  
           <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisman001" c="MODAL_axisman001" lit="109142"/> <axis:alt f="axisman010" c="MODAL_axisman001" lit="9906588"/></c:param>
                <c:param name="producto"><axis:alt f="axisman001" c="PRODUCTO" lit="9906588"/> - <axis:alt f="axisman0010" c="PRODUCTO" lit="109142"/></c:param>
                <c:param name="form">axisman001</c:param>
            </c:import>

        
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper008|<axis:alt f="axisman001" c="MODAL_AXISPER008" lit="1000235" /></c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper010|<axis:alt f="axisman001" c="MODAL_AXISPER010" lit="110275" /></c:param>
            </c:import>
            
            <axis:visible c="DSP_BUSQUEDAMANDATOS" f="axisman001"> 
              <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                <td>
                <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axisman001" c="LIT32" lit="9906589"/></b>
                        </div>     
                <table >
                <tr>
                    <td align="left" >
                         <table class="area" align="center">
                            <tr>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:30%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:15%;height:0px"></th>
                 </tr>                
                
                <tr>
                    <td class="titulocaja">
                        <div class="separador">&nbsp;</div>
                        <axis:ocultar f="axisman001" c="TIT_NNUMIDE" dejarHueco="false"> 
                        <b><axis:alt f="axisman001" c="TIT_NNUMIDE" lit="9903661"/></b>
                        </axis:ocultar>
                    </td>
                    <td class="titulocaja" colspan=3>
                    <axis:ocultar f="axisman001" c="TIT_TNOMBRE" dejarHueco="false"> 
                        <b><axis:alt f="axisman001" c="TIT_TNOMBRE" lit="9905826"/></b>
                          </axis:ocultar>
                    </td>
                    <td class="titulocaja" rowspan=2>
                    
                    <table  class="seccion">
                    <tr>
                    <td class="titulocaja"> 
                    <axis:ocultar f="axisman001" c="TIPOPERSONA" dejarHueco="false"> 
                                    <b><axis:alt f="axisman001"  c="TIPOPERSONA" lit="9906590" /></b>
                                    <input type="radio" id="TIPOPERSONA" name="TIPOPERSONA" value="1" <c:if test="${__formdata['HTIPOPERSONA'] == '1'}">checked</c:if> onclick="guardarcheck(this);" />
                     </axis:ocultar>
                    </td>
                    
                    </tr>
                    <tr>
                    <td class="titulocaja">
                     <axis:ocultar f="axisman001" c="TIPOPERSONA" dejarHueco="false"> 
                                      <b><axis:alt f="axisman001" c="TIPOPERSONA" lit="9906591" /></b>
                                    <input  type="radio" id="TIPOPERSONA" name="TIPOPERSONA" value="2" <c:if test="${__formdata['HTIPOPERSONA'] == '2'}">checked</c:if>  onclick="guardarcheck(this);"  />
                      </axis:ocultar>
                     </td>
                       </tr>          
                       </table>         
                                </td>
                </tr>                
                  
                 <tr>
                    <td>
                    <axis:ocultar f="axisman001" c="NNUMIDE" dejarHueco="false"> 
                        <input type="text" class="campo campotexto" name="NNUMIDE" id="NNUMIDE" size="15" style="width:80%" value="${__formdata.NNUMIDE}"  />
                    </axis:ocultar>
                    </td>
                     
                           
                              
                    <td colspan=3>
                     <axis:ocultar f="axisman001" c="TNOMBRE" dejarHueco="false"> 
                        <input type="text" class="campo campotexto" name="TNOMBRE" id="TNOMBRE" size="15" value="${__formdata.TNOMBRE}"/>
                       </axis:ocultar>
                    </td>
            
                    
                </tr>
                
                
                <tr>
                                <axis:ocultar f="axisman001" c="CMETMOV" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CMETMOV">
                                       <b id="label_CMETMOV" ><axis:alt f="axisman001" c="CMETMOV" lit="9902938"/></b>
                                    </td>
                                </axis:ocultar>
                                                    
                                
                                 <axis:ocultar f="axisman001" c="CBANCO" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CBANCO">
                                       <b id="label_CBANCO"><axis:alt f="axisman001" c="CBANCO" lit="9000964"/></b>
                                    </td>
                                </axis:ocultar>
                             
                                 <axis:ocultar f="axisman001" c="CNCTACTE" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CNCTACTE" colspan="2"> 
                                       <b id="label_CNCTACTE"><axis:alt f="axisman001" c="CNCTACTE" lit="9906592"/></b>
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman001" c="CTIPCC" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CTIPCC"> 
                                       <b id="label_CTIPCC"><axis:alt f="axisman001" c="CTIPCC" lit="9902671"/></b>
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisman001" c="CNUMTAR" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CNUMTAR"> 
                                       <b id="label_CNUMTAR"><axis:alt f="axisman001" c="CNUMTAR" lit="9906593"/></b>
                                    </td>
                                    </axis:ocultar>
                                  
                                <axis:ocultar f="axisman001" c="CINSEMI" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CINSEMI" colspan="2"> 
                                       <b id="label_CINSEMI"><axis:alt f="axisman001" c="CINSEMI" lit="9906594"/></b>
                                    </td>
                                </axis:ocultar> 
                                
                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axisman001" c="CMETMOV" dejarHueco="false"> 
                                    <td class="campocaja"  id = "td_CMETMOV">
                                        <select name="CMETMOV" id="CMETMOV" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                                                title="<axis:alt f="axisman001" c="CMETMOV" lit="9902938"/>" onchange="f_cambiar();"
                                            <axis:atr f="axisman001" c="CMETMOV" a="isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axisman001" c="SELECCIONAR" lit="108341"/>                                
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
                                
                                
                              <axis:ocultar f="axisman001" c="CBANCO" >
                                    <td class="campocaja" id = "td_CBANCO">
                                        <select name="CBANCO" id="CBANCO" size="1" class="campowidthselect campo campotexto" style="width:84%;;" 
                                            title="<axis:alt f="axisman001" c="CBANCO" lit="9000964"/>"
                                            <axis:atr f="axisman001" c="CBANCO" a="isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axisman001" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="bancos" items="${__formdata.BANCOS}">
                                                <option value="${bancos.CBANCO}"
                                                <c:if test="${__formdata.CBANCO == bancos.CBANCO}">selected</c:if>>
                                                ${bancos.TBANCO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                                                
                                 <axis:ocultar f="axisman001" c="CNCTACTE" >
                                    <td class="campocaja" id = "td_CNCTACTE" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CNCTACTE}" name="CNCTACTE" id="CNCTACTE" 
                                              <axis:atr f="axisman001" c="CNCTACTE" /> 
                                              onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)"
                                             title="<axis:alt f="axisman001" c="CNCTACTE" lit="9906592"/>"  size="15" />
                                    </td>
                                </axis:ocultar>  
                                
                                <axis:ocultar f="axisman001" c="CTIPCC" >
                                     
                                       <td class="campocaja" id = "td_CTIPCC">
                                        <select name="CTIPCC" id="CTIPCC" size="1" class="campowidthselect campo campotexto" style="width:84%;;" 
                                            title="<axis:alt f="axiscaj001" c="CTIPCC" lit="9902671"/>"
                                            <axis:atr f="axiscaj001" c="CTIPCC" a="modificable=false&isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axisman001" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="tiposTar" items="${__formdata.LSTCTIPTAR}">
                                                <option value="${tiposTar.CATRIBU}"
                                                <c:if test="${__formdata.CTIPCC == tiposTar.CATRIBU}">selected</c:if>>
                                                ${tiposTar.TATRIBU}
                                                </option>
                                            </c:forEach>                                            
                                 
                                            
                                        </select>
                                    </td>                                                                 
                                </axis:ocultar>  
                                
                                   <axis:ocultar f="axisman001" c="CNUMTAR" >
                                    <td class="campocaja" id = "td_CNUMTAR">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CNUMTAR}" name="CNUMTAR" id="CNUMTAR" 
                                              <axis:atr f="axisman001" c="CNUMTAR" /> 
                                              onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)"
                                             title="<axis:alt f="axisman001" c="CNUMTAR" lit="9906593"/>"  size="15" />
                                    </td>
                                </axis:ocultar>  
                                  
                                
                                 <axis:ocultar f="axisman001" c="CINSEMI"  >
                                  
                                    <td class="campocaja" id = "td_CINSEMI" colspan="2">
                                        <select name="CINSEMI" id="CINSEMI" size="1" class="campowidthselect campo campotexto" style="width:84%;;" 
                                            title="<axis:alt f="axisman001" c="CINSEMI" lit="9000844"/>"
                                            <axis:atr f="axisman001" c="CINSEMI" a="isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axisman001" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="bancos" items="${__formdata.BANCOS}">
                                                <option value="${bancos.CBANCO}"
                                                <c:if test="${__formdata.CINSEMI == bancos.CBANCO}">selected</c:if>>
                                                ${bancos.TBANCO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    
                                </axis:ocultar>  
                                           
                             
                            </tr>
                            
                           <tr>  
                            
                            
                                <axis:ocultar f="axisman001" c="FVENCIM" dejarHueco="false"> 
                                     <td class="titulocaja" id="tit_FVENCIM">
                                    <b><axis:alt f="axisper014" c="FVENCIM" lit="100885"/></b> <!-- Fecha vencimiento -->
                                </td>
                                      </axis:ocultar>
                              </tr>
                             <tr> 
                                 <axis:ocultar f="axisman001" c="FVENCIM" >
                                  <td class="campocaja" id = "td_FVENCIM">
                                    <input type="text"  class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="MM/yyyy" value="${__formdata.FVENCIM}"/>" name="FVENCIM" id="FVENCIM"  style="width:65%;"
                                    <axis:atr f="axisper014" c="FVENCIM"/>  title="<axis:alt f="axisman001" c="FVENCIM_TIT" lit="100885"/>" /> 
                                    <img id="popup_FVENCIM" alt="<axis:alt f="axisman001" c="SEL_FVENCIM" lit="100885"/>" title="<axis:alt f="axisper014" c="ALT_FVENCIM" lit="100885" />" src="images/calendar.gif"/></a>
                                </td>
                                </axis:ocultar>
                            
                             </tr>
                            
                            <tr>
                                <axis:ocultar f="axisman001" c="CMANDATO" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CMANDATO">
                                       <b id="label_CMANDATO" ><axis:alt f="axisman001" c="CMANDATO" lit="9906670"/></b>
                                    </td>
                                </axis:ocultar>
                                                    
                                
                                 <axis:ocultar f="axisman001" c="CACCION" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CACCION">
                                       <b id="label_CACCION"><axis:alt f="axisman001" c="CACCION" lit="9000844"/></b>
                                    </td>
                                </axis:ocultar>
                                  <axis:ocultar f="axisman001" c="CESTADO" dejarHueco="false"> 
                                    <td class="titulocaja"  id="tit_CESTADO">
                                       <b id="label_CESTADO"><axis:alt f="axisman001" c="CESTADO" lit="9905523"/></b>
                                    </td>
                                </axis:ocultar>
                                  <axis:ocultar f="axisman001" c="CSUCURSAL" dejarHueco="false" > 
                                    <td class="titulocaja"  id="tit_CSUCURSAL"> 
                                       <b id="label_CSUCURSAL"><axis:alt f="axisman001" c="CSUCURSAL" lit="9002202"/></b>
                                    </td>
                                </axis:ocultar>
                             </tr>
                            
                            
                            <tr>
                                
                                <axis:ocultar f="axisman001" c="CMANDATO" >
                                    <td class="campocaja" id = "td_CMANDATO">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CMANDATO}" name="CMANDATO" id="CMANDATO" formato="entero"
                                              <axis:atr f="axisman001" c="CMANDATO" /> 
                                              onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)"
                                             title="<axis:alt f="axisman001" c="CMANDATO" lit="9906670"/>"  size="15" />
                                    </td>
                                </axis:ocultar>
                                                                
                               
                                <axis:ocultar f="axisman001" c="CACCION" >
                                   
                                   <td class="campocaja"  id = "td_CACCION">
                                        <select name="CACCION" id="CACCION" size="1
                                        
                                        " class="campowidthselect campo campotexto_ob" style="width:84%;" 
                                                title="<axis:alt f="axisman001" c="CACCION" lit="9000844"/>" onchange="f_cambiar();"
                                            <axis:atr f="axisman001" c="CACCION" a="isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axisman001" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="accion" items="${__formdata.ACCIONES}">
                                                <option value="${accion.CATRIBU}"
                                                <c:if test="${__formdata.CACCION == accion.CATRIBU}">selected</c:if>>
                                                ${accion.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>  
                                </axis:ocultar>   
                                
                                 <axis:ocultar f="axisman001" c="CESTADO" >
                                   
                                   <td class="campocaja"  id = "td_CESTADO">
                                        <select name="CESTADO" id="CESTADO" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                                                title="<axis:alt f="axisman001" c="CESTADO" lit="9905523"/>" onchange="f_cambiar();"
                                            <axis:atr f="axisman001" c="CESTADO" a="isInputText=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>">
                                                <axis:alt f="axisman001" c="SELECCIONAR" lit="108341"/>                                
                                            </option>
                                            <c:forEach var="estado" items="${__formdata.ESTADOS}">
                                                <option value="${estado.CATRIBU}"
                                                <c:if test="${__formdata.CESTADO == estado.CATRIBU}">selected</c:if>>
                                                ${estado.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>  
                                </axis:ocultar> 
                                
                                <axis:ocultar f="axisman001" c="CSUCURSAL" >
                                    <td class="campocaja" id = "td_CSUCURSAL" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CSUCURSAL}" name="CSUCURSAL" id="CSUCURSAL" 
                                              <axis:atr f="axisman001" c="CSUCURSAL" />  
                                             title="<axis:alt f="axisman001" c="CSUCURSAL" lit="9002202"/>"  size="15" maxlength="50"/>
                                    </td>
                                </axis:ocultar>                                                              
                               
                            </tr>
                            
                                          
                
                
                <c:import url="../include/botonera_nt.jsp">              
                <c:param name="__botones"><axis:ocultar f="axisman001" c = "BT_9001333" dejarHueco="false">9001333</axis:ocultar>,<axis:ocultar f="axisman001" c = "BT_BUSCAR" dejarHueco="false">buscar</axis:ocultar></c:param>
               </c:import>
               <tr>
                    <td colspan="4">
                       <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axisman001" c="LIT32" lit="9906588"/></b>
                        </div>                        
                        <table class="seccion">         
                          <tr><td>
                                       <c:set var="title0"><axis:alt f="axisman001" c="MANDATO" lit="9906670"/></c:set>
                                       <c:set var="title1"><axis:alt f="axisman001" c="RDEUDOR" lit="9906598"/></c:set>
                                       <c:set var="title2"><axis:alt f="axisman001" c="RMANDANTE" lit="9906599"/></c:set>
                                       <c:set var="title3"><axis:alt f="axisman001" c="FORPAGO" lit="9902938"/></c:set>
                                       <c:set var="title4"><axis:alt f="axisman001" c="BANCO" lit="9000964"/></c:set>
                                       <c:set var="title5"> <axis:alt f="axisman001" c="SUCURSAL" lit="9002202"/></c:set> 
                                        <c:set var="title6"><axis:alt f="axisman001" c="TIPTAR" lit="9902671"/></c:set>
                                         <c:set var="title7"><axis:alt f="axisman001" c="NUMTAR" lit="9906593"/></c:set>
                                          <c:set var="title8"><axis:alt f="axisman001" c="NCTACTE" lit="9906736"/></c:set>
                                           <c:set var="title9"><axis:alt f="axisman001" c="ACCION" lit="9000844"/></c:set>
                                           <c:set var="title10"><axis:alt f="axisman001" c="ESTADO" lit="9905523"/></c:set>  
                               
                               </td>  
                               
                               
                               <td>
                              <div class="seccion">
                                <display:table name="${sessionScope.listmandatos}"
                                               id="miListaId" export="false"
                                               class="dsptgtable" pagesize="15"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="modal_axisman001.do?paginar=true">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <display:column sortable="true"
                                                  sortProperty=""
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false" style="width:4%">
                                    <div class="dspText">
                                    <input type="radio" id="MANDATO_sel" name="MANDATO_sel" value="${miListaId['CODMANDATO']}"
                                    onclick='javascript:f_seleccionar_mandato("${miListaId['CODMANDATO']}","${miListaId['NUMEROFOLIO']}","${fn:trim(fn:escapeXml(miListaId['BANCO']))}","${miListaId['CUENTABANCARIA']}","${fn:trim(fn:escapeXml(miListaId['COBRADORBANC']))}","${miListaId['TIPOTARJETA']}","${miListaId['FVENCIM']}")'
                                    class="CODMANDATO_sel"/>
                                    </div>
                                  </display:column>
                               
                                   <display:column title="${title0}"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                    <a href='javascript:f_seleccionar_mandato_link("${miListaId['CODMANDATO']}","${miListaId['NUMEROFOLIO']}","${fn:trim(fn:escapeXml(miListaId['BANCO']))}","${miListaId['CUENTABANCARIA']}","${fn:trim(fn:escapeXml(miListaId['COBRADORBANC']))}","${miListaId['TIPOTARJETA']}","${miListaId['FVENCIM']}","${miListaId['SUCURSAL']}")'>${miListaId['NUMEROFOLIO']}</a></div>
                                    </div>
                                  </display:column>
                               
                                  <display:column title="${title1}"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     <a href='javascript:f_seleccionar_mandato_link("${miListaId['CODMANDATO']}","${miListaId['NUMEROFOLIO']}","${fn:trim(fn:escapeXml(miListaId['BANCO']))}","${miListaId['CUENTABANCARIA']}","${fn:trim(fn:escapeXml(miListaId['COBRADORBANC']))}","${miListaId['TIPOTARJETA']}","${miListaId['FVENCIM']}","${miListaId['SUCURSAL']}")'>${miListaId['RUTDEUDOR']}</a></div>    
                                    
                                  </display:column>
                                  <display:column title="${title2}"       
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     <a href='javascript:f_seleccionar_mandato_link("${miListaId['CODMANDATO']}","${miListaId['NUMEROFOLIO']}","${fn:trim(fn:escapeXml(miListaId['BANCO']))}","${miListaId['CUENTABANCARIA']}","${fn:trim(fn:escapeXml(miListaId['COBRADORBANC']))}","${miListaId['TIPOTARJETA']}","${miListaId['FVENCIM']}","${miListaId['SUCURSAL']}")'>${miListaId['RUTMANDANTE']}</a></div>   
                                    </div>
                                  </display:column>
                                  <display:column title="${title3}"  
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                    <a href='javascript:f_seleccionar_mandato_link("${miListaId['CODMANDATO']}","${miListaId['NUMEROFOLIO']}","${fn:trim(fn:escapeXml(miListaId['BANCO']))}","${miListaId['CUENTABANCARIA']}","${fn:trim(fn:escapeXml(miListaId['COBRADORBANC']))}","${miListaId['TIPOTARJETA']}","${miListaId['FVENCIM']}","${miListaId['SUCURSAL']}")'> ${miListaId['FORMAPAGO']}</a></div>   
                                   
                                  </display:column>
                                  <display:column title="${title4}"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                   <a href='javascript:f_seleccionar_mandato_link("${miListaId['CODMANDATO']}","${miListaId['NUMEROFOLIO']}","${fn:trim(fn:escapeXml(miListaId['BANCO']))}","${miListaId['CUENTABANCARIA']}","${fn:trim(fn:escapeXml(miListaId['COBRADORBANC']))}","${miListaId['TIPOTARJETA']}","${miListaId['FVENCIM']}","${miListaId['SUCURSAL']}")'>  ${miListaId['BANCO']}</a></div>   
                                   </display:column>
                                   
                                    <display:column title="${title5}"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                   <a href='javascript:f_seleccionar_mandato_link("${miListaId['CODMANDATO']}","${miListaId['NUMEROFOLIO']}","${fn:trim(fn:escapeXml(miListaId['BANCO']))}","${miListaId['CUENTABANCARIA']}","${fn:trim(fn:escapeXml(miListaId['COBRADORBANC']))}","${miListaId['TIPOTARJETA']}","${miListaId['FVENCIM']}","${miListaId['SUCURSAL']}")'>  ${miListaId['SUCURSAL']}</a></div>   
                                   </display:column>
                                   
                                  <display:column title="${title8}"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                   <a href='javascript:f_seleccionar_mandato_link("${miListaId['CODMANDATO']}","${miListaId['NUMEROFOLIO']}","${fn:trim(fn:escapeXml(miListaId['BANCO']))}","${miListaId['CUENTABANCARIA']}","${fn:trim(fn:escapeXml(miListaId['COBRADORBANC']))}","${miListaId['TIPOTARJETA']}","${miListaId['FVENCIM']}","${miListaId['SUCURSAL']}")'>  ${miListaId['CUENTABANCARIA']}</a></div>   
                                   </display:column>
                                   
                                      <display:column title="${title6}"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                   <a href='javascript:f_seleccionar_mandato_link("${miListaId['CODMANDATO']}","${miListaId['NUMEROFOLIO']}","${fn:trim(fn:escapeXml(miListaId['BANCO']))}","${miListaId['CUENTABANCARIA']}","${fn:trim(fn:escapeXml(miListaId['COBRADORBANC']))}","${miListaId['TIPOTARJETA']}","${miListaId['FVENCIM']}","${miListaId['SUCURSAL']}")'>  ${miListaId['TIPOTARJETA']} </a></div>   
                                   </display:column>
                                   
                                   <display:column title="${title9}"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                   <a href='javascript:f_seleccionar_mandato_link("${miListaId['CODMANDATO']}","${miListaId['NUMEROFOLIO']}","${fn:trim(fn:escapeXml(miListaId['BANCO']))}","${miListaId['CUENTABANCARIA']}","${fn:trim(fn:escapeXml(miListaId['COBRADORBANC']))}","${miListaId['TIPOTARJETA']}","${miListaId['FVENCIM']}","${miListaId['SUCURSAL']}")'>  ${miListaId['ACCION']} </a></div>   
                                   </display:column>
                                  <display:column title="${title10}"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                   <a href='javascript:f_seleccionar_mandato_link("${miListaId['CODMANDATO']}","${miListaId['NUMEROFOLIO']}","${fn:trim(fn:escapeXml(miListaId['BANCO']))}","${miListaId['CUENTABANCARIA']}","${fn:trim(fn:escapeXml(miListaId['COBRADORBANC']))}","${miListaId['TIPOTARJETA']}","${miListaId['FVENCIM']}","${miListaId['SUCURSAL']}")'>  ${miListaId['ESTADO']} </a></div>   
                                   </display:column> 
                                </display:table>
                                <br>
                                </td></tr>
                        </table>
                    </td>
                </tr>
            </table>
        </axis:visible>    
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisman001</c:param><c:param name="__botones">cancelar,<axis:visible c="BT_ACEPTAR" f="axisman001">,aceptar</axis:visible></c:param></c:import>
        <div class="separador">&nbsp;</div>   
        <div class="separador">&nbsp;</div>
        <div class="separador">&nbsp;</div>
    </form>    
          <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FVENCIM",     
                ifFormat       :    "%m/%Y",      
                button         :    "popup_FVENCIM", 
                singleClick    :    true,
                firstDay       :    1
            });    
        </script><!--%d/-->  
       
    <c:import url="../include/mensajes.jsp" />
</div>
    </body>
 
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisman001');
      </script >                   
    </c:if>    
    
</html>

