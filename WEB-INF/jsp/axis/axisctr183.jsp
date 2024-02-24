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
                objUtiles.abrirModal("axisctr019", "src", "modal_axisctr019.do?operation=form&tipo="+objDom.getValorPorId("CMODO"));
            }
            
            function f_cerrar_axisctr019() {
                objUtiles.cerrarModal("axisctr019");
            }   
            function f_aceptar_axisctr019 (SSEGURO) {
               f_cerrar_axisctr019();
               objDom.setValorPorId("SSEGURO", SSEGURO);
               objUtiles.ejecutarFormulario("axis_axisctr183.do", "form", document.miForm, "_self",  objJsMessages.jslit_cargando);
            }
        
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr1831", "cancelar", document.miForm, "_self");
            }
            function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                    objUtiles.ejecutarFormulario("axis_axisctr183.do", "aceptar", document.miForm, "_self",  objJsMessages.jslit_cargando);
                }
            }
 
         // ini bug 26085
         
             function f_actualizar_valores(CIPRIMAFINAN_PEN){
                //IPRIMAFINAN_PEN.value = CIPRIMAFINAN_PEN;f_actualizar_valores  &SSEGURO="+SSEGURO "&SSEGURO="+SSEGURO+
                var strURL="axis_axisctr183.do?operation=actualizar_valores_json&IPRIMAFINAN_PEN="+CIPRIMAFINAN_PEN+"&SSEGURO="+document.miForm.SSEGURO.value;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbackjsonActualizarValores, ajaxTexto)
            
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
                                        
                  // alert("FVENCIM_NP"+FVENCIM_NP);
                 
                    //if (!objUtiles.estaVacio(ICAPFALL_NP)){
                    //  var confirma=confirm(mensajes);
               //
              // }  else{alert ("hay errores");}
           }
            }

         // fin bug 26085

        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>

      <!-- AXISSIN019 CERCADOR  -->
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisctr019|<axis:alt c="BUSCADOR_TITULO" f="axisctr183" lit="1000188"/></c:param>
    </c:import>    


    <form name="miForm" action="" method="POST">
       <input type="hidden" id="operation" name="operation" value=""/>
       <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
       <input type="hidden" name="CMODO" id="CMODO" value="${__formdata.CMODO}"/>
       <input type="hidden" name="SPRODUC" id="SPRODUC" value="${datos_poliza.SPRODUC}"/>
       

           
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr183" c="TIT_AXISCTR183" lit="9902704" /></c:param>
                <c:param name="formulario"><axis:alt f="axisctr183" c="TIT_AXISCTR183" lit="9902704" /></c:param>
                <c:param name="form">axisctr183</c:param>
            </c:import>
            
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo" >
                            <div style="float:left;">
                                <img src="images/flecha.gif"/><axis:alt c="form" f="TITULO" lit="104925"/>
                                <axis:ocultar f="axisctr183" c="BT_BUSCARPOL" dejarHueco="false">                   
                                <img border="0" alt="<axis:alt c="BT_BUSCARPOL" f="axisctr183" lit="9001722"/>" title="<axis:alt c="BT_BUSCARPOL" f="axisctr183" lit="9001722"/>" src="images/find.gif" onclick="f_abrir_axisctr019();" style="cursor:pointer"/>
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
                                        <axis:ocultar f="axisctr183" c="NPOLIZA">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr183" c="NPOLIZA" lit="100624" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="NCERTIF">
                                        <!-- Numero de CERTIF -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr183" c="NCERTIF" lit="101236" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="CSITUAC">
                                        <!-- Situacion -->
                                         <td class="titulocaja">
                                            <b><axis:alt f="axisctr183" c="CSITUAC" lit="100874" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="SPRODUC">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr183" c="SPRODUC" lit="100829" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr183" c="NPOLIZA">
                                        <!-- Numero de poliza -->
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15" style="width:90%"
                                            value="${datos_poliza.NPOLIZA}" readonly="true" />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="NCERTIF">
                                        <td class="campocaja">
                                            <!-- Numero de certificado -->
                                            <input type="text" class="campo campotexto" id="NCERTIF" name="NCERTIF" size="3" style="width:90%"
                                            value="${datos_poliza.NCERTIF}" readonly="true" />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="TSITUAC">
                                        <!-- Situacion -->
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="TSITUAC" name="TSITUAC" size="15"
                                            value="${datos_poliza.TSITUAC}" readonly="true" />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="SPRODUC">
                                         <!-- producto -->
                                        <td class="campocaja" colspan="2">
                                            <input type="text" style="width:95%" class="campowidthinput campo campotexto" id="TPRODUC" name="TPRODUC" size="15"
                                            value="${datos_poliza.TPRODUC}" readonly="true" />
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr183" c="FFECTO">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr183" c="FFECTO" lit="100883" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="FVENCIM" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr183" c="FVENCIM" lit="100885" /></b>
                                        </td>     
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr183" c="FFECTO">
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15"
                                            value="<fmt:formatDate value="${datos_poliza.FEFECTO}" pattern="dd/MM/yyyy" />" readonly="true" />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="FVENCIM" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="FVENCIM" name="FVENCIM" size="10"
                                            value="<fmt:formatDate value="${datos_poliza.FVENCIM}" pattern="dd/MM/yyyy" />" readonly="true" />
                                        </td>     
                                        </axis:ocultar>
                                    </tr>
                                    <axis:ocultar f="axisctr183" c="CAGENTE" dejarHueco="false">
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr183" c="CAGENTE" lit="100584" /></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" colspan="3" >
                                         <input type="text" class="campowidthinput campo campotexto" id="CAGENTE" name="CAGENTE" size="11" style="width:20%"
                                            value="${datos_poliza.CAGENTE}" readonly="true" />
                                         <input type="text" class="campowidthinput campo campotexto" id="TAGENTE" name="TAGENTE" size="15" style="width:75.5%"
                                            value="${datos_poliza.axisctr183_agente.NOMBRE}" readonly="true" />
                                         </td>
                                    </tr>
                                    </axis:ocultar>
                                </table>
                            </td>
                        </tr>
                    </table> 
                </td>
            </tr>
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr183" c="TOMADORES" lit="1000181"/></div>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                   <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                   </tr>    
                                   <tr>
                                    <td colspan="4" class="campocaja">
                                    <c:set var="title0"><axis:alt f="axisctr183" c="TOMADORES" lit="1000181" /></c:set>
                                        <div class="separador">&nbsp;</div>
                                        <div class="displayspace">
                                        <display:table name="${axisctr_tomadores}" id="lista" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                        requestURI="axis_plantilla.do?operation=general&paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                            
                                            <display:column title="${title0}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspText">${lista.OB_IAX_TOMADORES.TAPELLI1}&nbsp;${lista.OB_IAX_TOMADORES.TAPELLI2}&nbsp;,&nbsp;${lista.OB_IAX_TOMADORES.TNOMBRE}</div>
                                            </display:column>
                                            
                                            </display:table>
                                            </div>
                                    </td>
                                  </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr183" c="ASEGURADOS" lit="108228"/></div>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                   <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                   </tr>    
                                   <tr>
                                        <td colspan="4" class="titulocaja">
                                            <c:set var="title0"><axis:alt f="axisctr183" c="ASSEGURADOS" lit="100645" /></c:set>
                                            <div class="separador">&nbsp;</div>
                                            <div class="displayspace">
                                            <display:table name="${axisctr_asegurados}" id="lista" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                            requestURI="axis_plantilla.do?operation=general&paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                                
                                                <display:column title="${title0}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${lista.OB_IAX_ASEGURADOS.TAPELLI1}&nbsp;${lista.OB_IAX_ASEGURADOS.TAPELLI2}&nbsp;,&nbsp;${lista.OB_IAX_ASEGURADOS.TNOMBRE}</div>
                                                </display:column>
                                             
                                                </display:table>
                                                </div>
                                        </td>
                                  </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>    
            </tr>
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr183" c="PROVISIONES" lit="102656"/></div>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                   <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                   </tr>    
                                   <tr>
                                        <axis:ocultar f="axisctr183" c="IMPRESCATE">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr183" c="IMPRESCATE" lit="9902632" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="IMPPROVISION">                                             
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr183" c="IMPPROVISION" lit="1000518"/></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="IMPRECPEN">                                             
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr183" c="IMPRECPEN" lit="9900878"/></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="ISALDOPREST">                                             
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr183" c="ISALDOPREST" lit="9902740"/></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="IPRIMAFINAN_PEN"> 
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr183" c="IPRIMAFINAN_PEN" lit="9902741"/></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr183" c="IMPRESCATE"> 
                                        <td class="campocaja">
                                            <input type="text" class="campowidthbig campo campotexto" id="IMPRESCATE" name="IMPRESCATE" size="15"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPRESCATE}' />" <axis:atr f="axisctr183" c="IMPRESCATE" a="modificable=false"/> />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="IMPPROVISION"> 
                                        <td class="campocaja">
                                            <input type="text" class="campowidthbig campo campotexto" id="IMPPROVISION" name="IMPPROVISION" size="15"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPPROVISION}' />" <axis:atr f="axisctr183" c="IMPPROVISION" a="modificable=false"/> />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="IMPRECPEN">
                                        <td class="campocaja">
                                            <input type="text" class="campowidthbig campo campotexto" id="IMPRECPEN" name="IMPRECPEN" size="15"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IMPRECPEN}' />" <axis:atr f="axisctr183" c="IMPRECPEN" a="modificable=false"/> />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="ISALDOPREST">                                             
                                        <td class="campocaja">
                                            <input type="text" class="campowidthbig campo campotexto" id="ISALDOPREST" name="ISALDOPREST" size="15"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.ISALDOPREST}' />" <axis:atr f="axisctr183" c="ISALDOPREST" a="modificable=false"/> />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="IPRIMAFINAN_PEN">                                           
                                        <td class="campocaja">
                                            <input type="text" class="campowidthbig campo campotexto" id="IPRIMAFINAN_PEN" name="IPRIMAFINAN_PEN" size="15" onchange="f_actualizar_valores(this.value)"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IPRIMAFINAN_PEN}' />" <axis:atr f="axisctr183" c="IPRIMAFINAN_PEN" a="modificable=false"/> />
                                        </td>
                                        </axis:ocultar>
                                    </tr>    
                                    
                                   
                                    <tr>   
                                        <axis:ocultar f="axisctr183" c="VALRESCSPU">                                           
                                        <td class="campocaja">
                                            <b><axis:alt f="axisctr183" c="VALRESCSPU" lit="9906727" /></b>
                                            <input type="text" class="campowidthbig campo campotexto" id="VALRESCSPU" name="VALRESCSPU" size="15"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.VALRESCSPU}' />" <axis:atr f="axisctr183" c="VALRESCSPU" a="modificable=false"/> />
                                        </td>
                                        </axis:ocultar>                                             
                                        <axis:ocultar f="axisctr183" c="VALPB">                                           
                                        <td class="campocaja">
                                            <b><axis:alt f="axisctr183" c="VALPB" lit="9904846" /></b>
                                            <input type="text" class="campowidthbig campo campotexto" id="VALPB" name="VALPB" size="15"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.VALPB}' />" <axis:atr f="axisctr183" c="VALPB" a="modificable=false"/> />
                                        </td>
                                        </axis:ocultar>     
                                        <axis:ocultar f="axisctr183" c="VALRESC">                                           
                                        <td class="campocaja">
                                            <b><axis:alt f="axisctr183" c="VALRESC" lit="9904845" /></b>
                                            <input type="text" class="campowidthbig campo campotexto" id="VALRESC" name="VALRESC" size="15"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.VALRESC}' />" <axis:atr f="axisctr183" c="VALRESC" a="modificable=false"/> />
                                        </td>
                                        </axis:ocultar>                                                                 
                                    </tr>
                                    
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr183" c="DATOSNPOLIZA" lit="9902744"/></div>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                   <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                   </tr>    
                                   <tr>
                                        <axis:ocultar f="axisctr183" c="FVENCIM_NP">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr183" c="FVENCIM_NP" lit="9902745" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="ICAPFALL_NP">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr183" c="ICAPFALL_NP" lit="1000519" /></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="IPRIMA_NP">                                             
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr183" c="IPRIMA_NP" lit="9002162"/></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr183" c="FVENCIM_NP"> 
                                        <td class="campocaja">
                                           <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FVENCIM_NP" name="FVENCIM_NP" size="15"
                                            value ="<fmt:formatDate value="${__formdata.FVENCIM_NP}" pattern="dd/MM/yyyy"/>" onblur="" 
                                            title="<axis:alt f="axisctr183" c="FVENCIM_NP" lit="9902745"/>" <axis:atr f="axisctr183" c="FVENCIM_NP" a="modificable=false&obligatorio=false&formato=fecha"/>/>
                                            <a id="icon_FVENCIM_NP" style="vertical-align:middle;" href="#">
                                                <img border="0" alt="<axis:alt f="axisctr183" c="ICO_FVENCIM_NP" lit="108341" />" title="<axis:alt f="axisctr183" c="FVENCIM_NP" lit="9902745"/>" src="images/calendar.gif"/></a>
                                        </td>
                                        </axis:ocultar>
                                         <axis:ocultar f="axisctr183" c="ICAPFALL_NP"> 
                                        <td class="campocaja">
                                            <input type="text" class="campowidthbig campo campotexto" id="ICAPFALL_NP" name="ICAPFALL_NP" size="15"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.ICAPFALL_NP}' />" <axis:atr f="axisctr183" c="ICAPFALL_NP" a="modificable=false"/> />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr183" c="IPRIMA_NP"> 
                                        <td class="campocaja">
                                            <input type="text" class="campowidthbig campo campotexto" id="IPRIMA_NP" name="IPRIMA_NP" size="15"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IPRIMA_NP}' />" <axis:atr f="axisctr183" c="IPRIMA_NP" a="modificable=false"/> />
                                        </td>
                                        </axis:ocultar>
                                       
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>

<c:import url="../include/botonera_nt.jsp">
   <c:param name="f">axisctr183</c:param>
   <c:param name="__botones"><axis:ocultar f="axisctr183" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><c:if test="${!empty __formdata.SSEGURO}"><axis:ocultar f="axisctr183" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar></c:if></c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>

<script type="text/javascript">

<axis:visible f="axisctr183" c="FVENCIM_NP" >
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


