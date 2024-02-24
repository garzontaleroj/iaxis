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
        <c:import url="../include/carga_framework_js.jsp" />
        
        <%--Inicio Sólo si vamos a tener un campo fecha --%>
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
        <%-- fin Sólo si vamos a tener un campo fecha --%>
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                var sseguro = "${__formdata.SSEGURO}";
               
                if (objUtiles.estaVacio(sseguro)){
                    f_abrir_axisctr019();
                }
                
               
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
 	    }
            // Modal Buscador
            function f_abrir_axisctr019 () {
                objDom.setValorPorId("OK", '');
                objUtiles.abrirModal("axisctr019", "src", "modal_axisctr019.do?operation=form&tipo="+objDom.getValorPorId("CMODO"));
            }
            
            function f_cerrar_axisctr019() {
                objUtiles.cerrarModal("axisctr019");
            }   
            function f_aceptar_axisctr019 (SSEGURO) {
               f_cerrar_axisctr019();
               objDom.setValorPorId("SSEGURO", SSEGURO);
               objUtiles.ejecutarFormulario("axis_axisadm087.do", "form", document.miForm, "_self",  objJsMessages.jslit_cargando);
            }
        
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm087", "cancelar", document.miForm, "_self");
            }
            function f_but_aceptar() {
            var sseguro = "${__formdata.SSEGURO}";
                if (objValidador.validaEntrada()){
                if (objUtiles.estaVacio(sseguro))
                    f_abrir_axisctr019();
                else
                    objUtiles.ejecutarFormulario("axis_axisadm087.do", "aceptar", document.miForm, "_self",  objJsMessages.jslit_cargando); 
                }
            }
            
         function f_Get_CCC(){
      
         objDom.borrarOpcionesDeCombo(document.miForm.CBANCAR);
        
             if ( !objUtiles.estaVacio(document.getElementById("icon_CBANCAR"))){
                    if ( ! objDom.esVisible("icon_CBANCAR"))
                    objDom.setVisibilidadPorId("icon_CBANCAR", "visible");
            }
        objDom.setValorPorId("cargatHost", "0");
      
           objAjax.invokeAsyncCGI("axis_axisadm087.do", callbackAjaxCargarCuentasTomador, "operation=ajax_cargar_cuentas_tomadorAXIS", this, objJsMessages.jslit_cargando);

    }
    
          function f_Get_Tarjeta (CBANCAR){
                        
            CBAN_AUX = objUtiles.utilSplit(CBANCAR, "@@")[0];
            CTIPBAN = objUtiles.utilSplit(CBANCAR, "@@")[1];
            
            if (!objUtiles.estaVacio(CBAN_AUX) && !objUtiles.estaVacio(CTIPBAN)) 
                objAjax.invokeAsyncCGI("axis_axisadm087.do?CTIPBAN="+CTIPBAN, callbackAjaxGetTarjeta, "operation=ajax_cargar_tarjeta", this, objJsMessages.jslit_cargando);
             }
      
            function  callbackjsonActualizarValores(p){
           // alert(JSON.stringify(p));
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                 objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado");
              if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                 var ICAPFALL_NP = p.JSON2.resultado.RETURN.ICAPFALL_NP;
                 var IPRIMA_NP = p.JSON2.resultado.RETURN.IPRIMA_NP;
                 var FVENCIM_NP = p.JSON2.resultado.RETURN.FVENCIM_NP;
               
                    document.miForm.IPRIMA_NP.value=objNumero.formateaNumeroCero(IPRIMA_NP, true); 
                    document.miForm.ICAPFALL_NP.value=objNumero.formateaNumeroCero(ICAPFALL_NP,true);
                   document.miForm.FVENCIM_NP.value=objUtiles.formateaTimeStamp(FVENCIM_NP);
                                        
               
           }
            }

    function f_OnChange(thiss) {
    
         f_cargar_propiedades_pantalla();


         <% if (request.getSession().getAttribute("cargaHost") != null) { %>


                if ( objDom.esVisible("icon_CBANCAR"))  {

                objDom.setVisibilidadPorId("icon_CBANCAR", "hidden");
                }
          
          <% } %>  
          
            if (objDom.getValorPorId("cargatHost") == "1"){

                            if ( objDom.esVisible("icon_CBANCAR"))  {
                            objDom.setVisibilidadPorId("icon_CBANCAR", "hidden");
                            }

                }
          
   /*    f_cargar_propiedades_pantalla();
       
     
            if (! objDom.esVisible("CBANCAR"))  {
                 objDom.setVisibilidadPorId("NCUOTAR", "hidden");
            }
            if (! objDom.esVisible("NCUOTAR"))  {
                 document.miForm.NCUOTAR.value="";
            }
  
       if (thiss.name == "CFORPAG"){
            objUtiles.ejecutarFormulario("axis_axisadm087.do", "recargar_forpag",document.miForm, "_self", objJsMessages.jslit_cargando);
       }*/
    }
    
        /****************************************************************************************/
    /************************************ MODAL AXPER007 ************************************/
    /***************************************************************************************
    
    function f_abrir_axisper007(SPERSON) {
        objDom.setVisibilidadPorId("but_cerrar_modal_axisper007", "hidden");
        objUtiles.abrirModal("axisper007", "src", "modal_axisper007.do?operation=form&SPERSON=" + SPERSON); 
    }
    
    function f_cerrar_axisper007 () {
        encrypt_CBANCAR = objDom.getValorPorId("encrypt_CBANCAR");
    
        objUtiles.cerrarModal("axisper007");
        objAjax.invokeAsyncCGI("axis_axisadm087.do", callbackAjaxCargarCuentasTomador, "operation=ajax_cargar_cuentas_tomador&encrypt_CBANCAR="+encrypt_CBANCAR, this, objJsMessages.jslit_cargando);                
    }    
    
    function f_aceptar_axisper007 () {
        f_cerrar_axisper007();
    } 
    */
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>

      <!-- AXISSIN019 CERCADOR  -->
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisctr019|<axis:alt c="BUSCADOR_TITULO" f="axisadm087" lit="1000188"/></c:param>
    </c:import>    


    <form name="miForm" action="" method="POST">
       <input type="hidden" id="operation" name="operation" value=""/>
       <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
       <input type="hidden" name="CMODO" id="CMODO" value="${__formdata.CMODO}"/>
       <input type="hidden" name="OK" id="OK" value="${__formdata.OK}"/>
       <input type="hidden" name="SPRODUC" id="SPRODUC" value="${datos_poliza.SPRODUC}"/>
       

           
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm087" c="TIT_axisadm087" lit="1000572" /></c:param>
                <c:param name="formulario"><axis:alt f="axisadm087" c="TIT_AXISADM087" lit="1000572" /></c:param>
                <c:param name="form">axisadm087</c:param>
            </c:import>
            
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo" >
                            <div style="float:left;">
                                <img src="images/flecha.gif"/><axis:alt c="form" f="TITULO" lit="104925"/>
                                <axis:ocultar f="axisadm087" c="BT_BUSCARPOL" dejarHueco="false">                   
                                <img border="0" alt="<axis:alt c="BT_BUSCARPOL" f="axisadm087" lit="9001722"/>" title="<axis:alt c="BT_BUSCARPOL" f="axisadm087" lit="9001722"/>" src="images/find.gif" onclick="f_abrir_axisctr019();" style="cursor:pointer"/>
                                </axis:ocultar>                       
                           </div>
                        </div>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                   <tr>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                   </tr>    
                                   <tr>
                                        <!-- Numero de poliza -->
                                        <axis:ocultar f="axisadm087" c="NPOLIZA">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm087" c="NPOLIZA" lit="100624" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm087" c="NCERTIF">
                                        <!-- Numero de CERTIF -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm087" c="NCERTIF" lit="101236" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm087" c="CSITUAC">
                                        <!-- Situacion -->
                                         <td class="titulocaja">
                                            <b><axis:alt f="axisadm087" c="CSITUAC" lit="100874" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm087" c="SPRODUC">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisadm087" c="SPRODUC" lit="100829" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisadm087" c="NPOLIZA">
                                        <!-- Numero de poliza -->
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15" style="width:90%"
                                            value="${datos_poliza.NPOLIZA}" readonly="true" />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm087" c="NCERTIF">
                                        <td class="campocaja">
                                            <!-- Numero de certificado -->
                                            <input type="text" class="campo campotexto" id="NCERTIF" name="NCERTIF" size="3" style="width:90%"
                                            value="${datos_poliza.NCERTIF}" readonly="true" />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm087" c="TSITUAC">
                                        <!-- Situacion -->
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="TSITUAC" name="TSITUAC" size="15"
                                            value="${datos_poliza.TSITUAC}" readonly="true" />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm087" c="SPRODUC">
                                         <!-- producto -->
                                        <td class="campocaja" colspan="2">
                                            <input type="text" style="width:95%" class="campowidthinput campo campotexto" id="TPRODUC" name="TPRODUC" size="15"
                                            value="${datos_poliza.TPRODUC}" readonly="true" />
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisadm087" c="FFECTO">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisadm087" c="FFECTO" lit="100883" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm087" c="FVENCIM" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm087" c="FVENCIM" lit="100885" /></b>
                                        </td>     
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisadm087" c="FFECTO">
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15"
                                            value="<fmt:formatDate value="${datos_poliza.FEFECTO}" pattern="dd/MM/yyyy" />" readonly="true" />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm087" c="FVENCIM" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="FVENCIM" name="FVENCIM" size="10"
                                            value="<fmt:formatDate value="${datos_poliza.FVENCIM}" pattern="dd/MM/yyyy" />" readonly="true" />
                                        </td>     
                                        </axis:ocultar>
                                    </tr>
                                    <axis:ocultar f="axisadm087" c="CAGENTE" dejarHueco="false">
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm087" c="CAGENTE" lit="100584" /></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" colspan="3" >
                                         <input type="text" class="campowidthinput campo campotexto" id="CAGENTE" name="CAGENTE" size="11" style="width:20%"
                                            value="${datos_poliza.CAGENTE}" readonly="true" />
                                         <input type="text" class="campowidthinput campo campotexto" id="TAGENTE" name="TAGENTE" size="15" style="width:75.5%"
                                            value="${datos_poliza.axisadm087_agente.NOMBRE}" readonly="true" />
                                         </td>
                                    </tr>
                                    </axis:ocultar>
                                </table>
                            </td>
                        </tr>
                    </table> 
                </td>
            </tr>
          
     
 <axis:visible f="axisadm087" c="DSP_MVTPOLIZA" >     
 <!--<c:if test="${! empty mvtpoliza}">  -->

 
                <tr>
                    <td class="campocaja" >
                    <img id="DSP_MVTPOLIZA_parent" src="images/menys.gif" onclick="objEstilos.toggleDisplay('DSP_MVTPOLIZA', this)" style="cursor:pointer"/> 
                        <b><axis:alt f="axisadm087" c="DSP_MVTPOLIZA" lit="1000298"></axis:alt></b>
                        <hr class="titulo">
                    </td>
                </tr>
                <tr id="DSP_MVTPOLIZA_children" style="display:yes">
                <!-- style="display:none">-->
                    <td class="campocaja" >
                    
                        <c:set var="title0"><axis:alt f="axisadm087" c="FMOVIMI" lit="101006"></axis:alt></c:set>
                        <c:set var="title1"><axis:alt f="axisadm087" c="TTIPMOV" lit="102421"></axis:alt></c:set>
                        <c:set var="title2"><axis:alt f="axisadm087" c="TMOTMOV" lit="102577" /></c:set>
                        <c:set var="title3"><axis:alt f="axisadm087" c="FEFECTO" lit="100883" /></c:set>
                        <c:set var="title33"><axis:alt f="axisadm087" c="FEMISIO" lit="1000562" /></c:set>
                       
                        <c:set var="title6"><axis:alt f="axisadm087" c="CUSUMOV" lit="100894" /></c:set>
                       
                        <div class="displayspace">
                        <display:table name="${mvtpoliza}" id="mvtpoliza" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_axisadm087.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                    <div class="dspIcons"><input  <c:if test="${mvtpoliza.NMOVIMI == __formdata.NMOVIMI || (empty __formdata.NMOVIMI && mvtpoliza.NMOVIMI == 1 )}">checked</c:if> onClick="javascript:f_getMotivo('${datos_poliza.SSEGURO}', '${mvtpoliza.NMOVIMI}')" 
                                    value="${mvtpoliza.NMOVIMI}" type="radio" id="radioNMOVIMI" name="radioNMOVIMI"/></div>
                                </display:column>
                                <display:column title="${title0}" sortable="true" sortProperty="FMOVIMI" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspDate"><fmt:formatDate value="${mvtpoliza.FMOVIMI}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                <display:column title="${title1}" sortable="true" sortProperty="TTIPMOV" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${mvtpoliza.TTIPMOV}</div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="TMOTMOV" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${mvtpoliza.TMOTMOV}</div>
                                </display:column>
                        
                                <axis:visible f="axisadm087" c="CUSUMOV_MOV">
                                <display:column title="${title6}" sortable="true" 
                                    style="width:8%;" sortProperty="TMOTMOV" headerClass="sortable"  
                                    media="html" autolink="false" >
                                    <div class="dspText">${mvtpoliza.CUSUMOV}</div>
                                </display:column>
                                </axis:visible>
                                <display:column title="${title3}" sortable="true" sortProperty="FEFECTO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspDate"><fmt:formatDate value="${mvtpoliza.FEFECTO}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                <axis:visible f="axisadm087" c="FEMISIO">
                                    <display:column title="${title33}" sortable="true" sortProperty="FEMISIO" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspDate"><fmt:formatDate value="${mvtpoliza.FEMISIO}" pattern="dd/MM/yyyy"/></div>
                                    </display:column>
                                </axis:visible>
                              
                           
                             
                            </display:table>
                            
                        </div>
                        </td>
    </tr>
  <!--  </c:if> (!isEmpty(pPNMOVIMI)-->
    </axis:visible>
     <axis:visible f="axisadm087" c="DSP_APUNTE" >  
      <c:if test="${! empty mvtpoliza}">
      <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm087" c="APUNTE" lit="9001332"/></div>
                </td>
            </tr>
                <tr>
                <td>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" >
                                   <tr>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:35%;height:0px"></th>
                                       <th style="width:35%;height:0px"></th> 

                                   </tr>     
                             
                                   <tr>
                                        <axis:visible f="axisadm87" c="TIPORECIBO">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm87" c="TIPORECIBO" lit="102302" /></b>
                                        </td>
                                      </axis:visible>
                                      
                                        <axis:visible f="axisadm87" c="IMPORTE">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm87" c="IMPORTE" lit="100563" /></b>
                                        </td>
                                        </axis:visible>
                                        
                                     <axis:visible f="axisadm87" c="CTIPCOB" >
                                        <td class="titulocaja">
                                            <b id="label_CTIPCOB"><axis:alt f="axisadm87" c="LIT_151348" lit="151348" /></b>
                                        </td>
                                    </axis:visible>

                                   <!--  <axis:visible f="axisadm87" c="CBANCAR" >
                                        <td class="titulocaja">
                                            <b id="label_CBANCAR"><axis:alt f="axisadm87" c="LIT_1000092" lit="1000092" /></b>
                                        </td>
                                     </axis:visible>  -->
                                     
                                    </tr>
                                 <tr>
                                    <axis:visible f="axisadm87" c="TIPORECIBO">
                                                <td class="campocaja" ><!-- listaTiporecibo --> 
                                                    <select name="TIPORECIBO" id="TIPORECIBO" size="1" class="campowidthselect campo campotexto" style="width:60%;">
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm87" c="ALT_TIPORECIBO" lit="102302"/> - </option>
                                                        <c:forEach  items="${listaTiporecibo}" var="listaTiporecibo">
                                                       <option value = "${listaTiporecibo.CATRIBU}"
                                                             <c:if test="${__formdata.TIPORECIBO == listaTiporecibo.CATRIBU}">selected</c:if>
                                                             >
                                                            ${listaTiporecibo.TATRIBU}
                                                        </option>
                                                      </c:forEach>
                                                   </select>
                                                </td>
                                     </axis:visible>
                                      
                                 <axis:visible f="axisadm87" c="IMPORTE"> 
                                        <td class="campocaja">
                                            <input type="text" class="campowidthbig campo campotexto" id="IMPORTE" name="IMPORTE" size="15"   formato="entero"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPORTE}' />" <axis:atr f="axisadm87" c="IMPORTE" a="modificable=true"/> />
                                        </td>
                                </axis:visible>
                                                           
                                    <axis:visible f="axisadm87" c="CTIPCOB" >
                                        <td class="campocaja">
                                            <select name = "CTIPCOB" id ="CTIPCOB" size="1" onchange="f_OnChange(this)" 
                                                class="campowidthselect campo campotexto" title="<axis:alt f="axisadm87" c="LIT_151348" lit="151348"/>" <axis:atr f="axisadm87" c="CTIPCOB" a="isInputText=false"/>>&nbsp;
                                                <option value="null"> - <axis:alt f="axisadm87" c="LIT_108341" lit="108341"/> - </option> 
                                                <c:set var="isUnicoyObligatorio" value="${fn:length(sessionScope.axisctr_opcionesDatosGestion.tipoCobro) == 1}" />
                                                <c:forEach items="${tipoCobro}" var="tipoCobro">
                                                    <option value = "${tipoCobro.CATRIBU}" <c:if test="${tipoCobro.CATRIBU  == datos_poliza.CTIPCOB || isUnicoyObligatorio}">selected</c:if>>${tipoCobro.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                 
                                  <!--  <axis:visible f="axisadm87" c="CBANCAR" >
                                             <td class="campocaja">
                                                <axis:encryptflag f="axisadm87" c="CBANCAR" />
                                                <select name = "CBANCAR" style="width:112%" id ="CBANCAR" size="1" onchange="f_Get_Tarjeta(this.value);" 
                                                    class="campowidthselect campo campotexto_ob" <axis:atr f="axisadm87" c="CBANCAR" a="isInputText=false"/>>&nbsp;
                                                    <c:forEach items="${cuentasTomador}" var="cuentaTomador">
                                                        <option value = "<axis:encrypt f="axisadm87" c="CBANCAR" value="${cuentaTomador.CBANCAR}" />@@${cuentaTomador.CTIPBAN}" <c:if test="${cuentaTomador.CBANCAR  == __formdata.CBANCAR}">selected</c:if>><axis:masc f="axisadm87" c="CBANCAR" value="${cuentaTomador.TCBANCAR}" /></option>
                                                    </c:forEach>
                                                </select>
                                                
                                        <axis:visible f="axisadm087" c="BT_CBANCAR">
                                                 <a id="icon_CBANCAR" href="javascript:f_abrir_axisper007(${__formdata.SPERSON})"><img border="0" alt="<axis:alt f="axisadm087" c="LIT_1000124" lit="1000124"/>" title="<axis:alt f="axisadm87" c="LIT_1000124" lit="1000124"/>" src="images/lapiz.gif"/></a>
                                         </axis:visible>
                                            <axis:visible f="axisadm087" c="BT_BUSCAR" >
                                                 <input type="button" class="boton" id="BT_BUSCAR" name="BT_BUSCAR"  value="<axis:alt f="axisadm87" c="BT_BUSCAR" lit="9000508"></axis:alt>" onclick="f_Get_CCC(${__formdata.SPERSON},'${fn:trim(__formdata.SNIP)}')" />
                                            </axis:visible>
                                            </td>
                                    </axis:visible>-->
                                 
                                </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                </td>
            </tr>
            </c:if>
            </axis:visible>
        </table>
    </form>

<c:import url="../include/botonera_nt.jsp">
   <c:param name="f">axisadm087</c:param>
   <c:param name="__botones"><axis:ocultar f="axisadm087" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><c:if test="${ empty __formdata.OK || __formdata.OK==1 }"><axis:ocultar f="axisadm087" c="BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar></c:if></c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>

<script type="text/javascript">

<axis:visible f="axisadm087" c="FVENCIM_NP" >
    Calendar.setup({
        inputField     :    "FVENCIM_NP",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FVENCIM_NP",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>

</script>

</html>


