<%/*Revision:# T/6u0mWpf22vfgDNUUA96A== #*/%>
<%/*
*  Fichero: axisctr220.jsp
*
*  Fecha: 15/05/2015
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisctr220" c="TITPANT" lit="9907947"/></title> <%-- Suspensiones --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
   
    <style type="text/css">
        .displayspace {
            width:99.8%;
            height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
            max-height:350px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #DDDDDD;
        }
    </style>

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
          f_cargar_propiedades_pantalla();     
            if (${empty __formdata.datosPoliza})
                f_abrir_axisctr019();
                
        }
        
        function f_abrir_axisctr019() {
            var cmodo = '${__formdata.PROXCMOTMOV}';
            
             if(cmodo == '391' || cmodo == '392')
                objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form&tipo=SUSPENSION");
            //else
              //  objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form&tipo=PIGNORACION");
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr220", "cancelar", document.miForm, "_self");
        }
//Bug 27766
        function f_but_102316() {
            document.miForm.CMODO_CTR020.value='axisctr220';
            document.miForm.CMODO.value='PIGNORACION';
           // objUtiles.ejecutarFormulario ("axis_axisctr020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            objUtiles.ejecutarFormulario ("axis_axisctr020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);

        }  
//Fin Bug 27766       
        function f_but_9001575() {
            f_goToaxisctr221("BOT_BLOQUEAR");
        }               
       
        function f_but_9001576() {
            f_goToaxisctr221("BOT_DESBLOQUEAR");
        }
        
        function f_but_9001577() {
            f_goToaxisctr221("BOT_PIGNORAR");
        }
               
        function f_but_9001578() {
            f_goToaxisctr221("BOT_DESPIGNORAR");
        } 
        
        function f_but_9904545() {
            f_goToaxisctr221("BOT_SUSPENDER");
        }
        function f_but_9904546() {
            f_goToaxisctr221("BOT_REINICIAR");
        } 
        
        
        
        function f_goToaxisctr221(TMOTMOV) {
            /* Bug 24450/131928/27766
             En el reinicio por defecto debería traer la fecha de renovación (fcaranu) de la póliza (ahora trae NULL).
             10/12/2012
             MLUIS
            */
            
            
            if(!document.miForm.NMOVIMI){
               var nmovimi="";
            }else{
                
                var nmovimi='';
                var listPigno = 0;
                if(document.getElementById('T_IAX_MVTPOLIZAPIGNORADA')){
                  listPigno = document.getElementById('T_IAX_MVTPOLIZAPIGNORADA').rows.length ;
                }
                if (TMOTMOV=='BOT_DESPIGNORAR' && listPigno==2){
                    nmovimi = document.miForm.NMOVIMIPIG.value;
                }else{
                    nmovimi = document.miForm.NMOVIMI.value;   
                }
                
            }
                   
           
           /*  if(!empty document.miForm.NMOVIMI){
                 nmovimi = document.miForm.NMOVIMI.value;
            }*/
            f_abrir_modal("axisctr221", true, "&SSEGURO=" + objDom.getValorPorId("SSEGURO") + "&TMOTMOV=" + TMOTMOV + "&FCARANU=" + objDom.getValorPorId("FCARANU") + "&PRIMERA=1&MODO=&NMOVIMI="+nmovimi);
            //f_abrir_modal("axisctr221", true, "&SSEGURO=" + objDom.getValorPorId("SSEGURO") + "&TMOTMOV=" + TMOTMOV + "&FCARANU=" + objDom.getValorPorId("FCARANU") + "&PRIMERA=1&MODO=MODIF_BENEF&NMOVIMI="+objDom.getValorPorId("NMOVIMI"));
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/

        function f_abrir_modal(cual, noXButton, optionalQueryString) {
        
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }

        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_cerrar_axisctr019() {
            objUtiles.cerrarModal("axisctr019");
        }
        
        function f_aceptar_axisctr019(SSEGURO) {
            objUtiles.cerrarModal("axisctr019");
            objDom.setValorPorId("SSEGURO", SSEGURO);
            objUtiles.ejecutarFormulario("axis_axisctr220.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_cerrar_axisctr221() {
            objUtiles.cerrarModal("axisctr221");
            objUtiles.ejecutarFormulario("axis_axisctr220.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        /* @deprecated
        function f_aceptar_axisctr221() {
            objUtiles.cerrarModal("axisctr221");
            objUtiles.ejecutarFormulario("axis_axisctr220.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        */
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr220" c="TITPANT" lit="9904516"/></c:param>     <%-- Bloqueo/Pignoración de Pólizas --%>
                <c:param name="formulario"><axis:alt f="axisctr220" c="TITPANT" lit="9904516"/></c:param> <%-- Bloqueo/Pignoración de Pólizas --%>
                <c:param name="form">axisctr220</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
                axisctr019|<axis:alt f="axisctr220" c="BUSQPOL" lit="1000188"/><%-- Buscador de pólizas --%>#axisctr221|<axis:alt f="axisctr220" c="TITPANT" lit="9904516"/><%-- Bloqueo/Pignoración de Pólizas --%>
            </c:param>
        </c:import>
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" id="PROXCMOTMOV" name="PROXCMOTMOV" value="${__formdata.PROXCMOTMOV}"/>
        <!-- Bug 27766 -->
        <input type="hidden" id="CMODO_CTR020" name="CMODO_CTR020" value=""/>
        <input type="hidden" id="CMODO" name="CMODO" value=""/>

        <c:forEach var="element" items="${__formdata.T_IAX_MVTPOLIZA}" begin="0" end="0">
            <input type="hidden" id="NMOVIMI" name="NMOVIMI" value="${element.NMOVIMI}"/>
        </c:forEach>
        
        
        <!--Fin Bug 27766  -->
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisctr220" c="DATOSPOL" lit="104925"/><%-- Datos póliza --%> <img border="0" src="images/find.gif" onclick="f_abrir_axisctr019('axisctr019')" style="cursor:pointer" alt="<axis:alt f="axisctr220" c="BUSQ" lit="9000508"/>" title="<axis:alt f="axisctr220" c="BUSQ" lit="9000508"/>"/></div>

                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:16%;height:0px"></th>
                                        <th style="width:16%;height:0px"></th>
                                        <th style="width:16%;height:0px"></th>
                                        <th style="width:16%;height:0px"></th>
                                        <th style="width:16%;height:0px"></th>
                                        <th style="width:16%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr220" c="NPOLIZA" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_NPOLIZA"><axis:alt f="axisctr220" c="NPOLIZA" lit="9001514"/></b> <%-- Nº póliza --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr220" c="NCERTIF" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_NCERTIF"><axis:alt f="axisctr220" c="NCERTIF" lit="101168"/></b> <%-- Cert. --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr220" c="TSITUAC" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_TSITUAC"><axis:alt f="axisctr220" c="TSITUAC" lit="100874"/></b> <%-- Situación --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr220" c="TPRODUC" dejarHueco="false">
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_TPRODUC"><axis:alt f="axisctr220" c="TPRODUC" lit="100829"/></b> <%-- Producto --%>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>                 
                                        <axis:ocultar f="axisctr220" c="NPOLIZA" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15" 
                                                <axis:atr f="axisctr220" c="NPOLIZA" a="modificable=false"/>
                                                value="${__formdata.datosPoliza.NPOLIZA}" style="width:60%"
                                                title="<axis:alt f="axisctr220" c="NPOLIZA" lit="9001514"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr220" c="NCERTIF" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="NCERTIF" name="NCERTIF" size="15" 
                                                <axis:atr f="axisctr220" c="NCERTIF" a="modificable=false"/>
                                                value="${__formdata.datosPoliza.NCERTIF}" style="width:60%"
                                                title="<axis:alt f="axisctr220" c="NCERTIF" lit="101168"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr220" c="TSITUAC" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="TSITUAC" name="TSITUAC" size="15" 
                                                <axis:atr f="axisctr220" c="TSITUAC" a="modificable=false"/>
                                                value="${__formdata.datosPoliza.TSITUAC}" style="width:60%"
                                                title="<axis:alt f="axisctr220" c="TSITUAC" lit="100874"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr220" c="TPRODUC" dejarHueco="false">
                                            <td class="campocaja" colspan="2">
                                                <input type="text" class="campowidthinput campo campotexto" id="TPRODUC" name="TPRODUC" size="15" 
                                                <axis:atr f="axisctr220" c="TPRODUC" a="modificable=false"/>
                                                value="${__formdata.datosPoliza.TPRODUC}" style="width:90%"
                                                title="<axis:alt f="axisctr220" c="TPRODUC" lit="100829"/>"/>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr220" c="FEFECTO" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FEFECTO"><axis:alt f="axisctr220" c="FEFECTO" lit="100883"/></b> <%-- Fecha efecto --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr220" c="TDURACI" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_TDURACI"><axis:alt f="axisctr220" c="TDURACI" lit="1000120"/></b> <%-- Duración --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr220" c="FVENCIM" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FVENCIM"><axis:alt f="axisctr220" c="FVENCIM" lit="100885"/></b> <%-- Fecha vencimiento --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr220" c="CAGENTE" dejarHueco="false">
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_TPRODUC"><axis:alt f="axisctr220" c="CAGENTE" lit="100584"/></b> <%-- Agente --%>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr220" c="FEFECTO" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15" 
                                                <axis:atr f="axisctr220" c="FEFECTO" a="modificable=false"/>
                                                value="<fmt:formatDate value="${__formdata.datosPoliza.FEFECTO}" pattern="dd/MM/yyyy"/>"
                                                style="width:60%" title="<axis:alt f="axisctr220" c="FEFECTO" lit="100883"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr220" c="TDURACI" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="TDURACI" name="TDURACI" size="15" 
                                                <axis:atr f="axisctr220" c="TDURACI" a="modificable=false"/>
                                                value="${__formdata.datosPoliza.TDURACI}" style="width:60%"
                                                title="<axis:alt f="axisctr220" c="TDURACI" lit="1000120"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr220" c="FVENCIM" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FVENCIM" name="FVENCIM" size="15" 
                                                <axis:atr f="axisctr220" c="FVENCIM" a="modificable=false"/>
                                                value="<fmt:formatDate value="${__formdata.datosPoliza.FVENCIM}" pattern="dd/MM/yyyy"/>"
                                                style="width:60%" title="<axis:alt f="axisctr220" c="FVENCIM" lit="100885"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr220" c="CAGENTE" dejarHueco="false">
                                            <td class="campocaja" colspan="2">
                                                <input type="text" class="campowidthinput campo campotexto" id="CAGENTE" name="CAGENTE" size="15" 
                                                <axis:atr f="axisctr220" c="CAGENTE" a="modificable=false"/>
                                                value="${__formdata.datosPoliza.CAGENTE}" style="width:20%"
                                                title="<axis:alt f="axisctr220" c="CAGENTE" lit="100584"/>"/> 
                                                <input type="text" class="campowidthinput campo campotexto" id="TAGENTE" name="TAGENTE" size="15" 
                                                <axis:atr f="axisctr220" c="TAGENTE" a="modificable=false"/>
                                                value="${__formdata.datosPoliza.TAGENTE}" style="width:70%"
                                                title="<axis:alt f="axisctr220" c="CAGENTE" lit="100584"/>"/>
                                            </td>
                                        </axis:ocultar>                                        
                                    </tr>
                                    <tr>
                                        <!-- Añadir campos:
                                           - Fecha próximo recibo.
                                           - Fecha renovación.
                                           - Forma de pago.
                                           - Sección de recibos de la póliza. Bug: 24450/131928 - 10/12/2012 - MLUIS -->                            
                                          <axis:ocultar f="axisctr220" c="TFORPAG"
                                                        dejarHueco="false">
                                            <!-- FECHA TIPO FORMA DE PAGO -->
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisctr220" c="TFORPAG" lit="100712"/></b>
                                            </td>
                                          </axis:ocultar>
                                          <axis:ocultar f="axisctr220" c="FCARANU"
                                                        dejarHueco="false">
                                            <!-- FECHA REnovacio -->
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisctr220" c="FCARANU" lit="102626"/></b>
                                            </td>
                                          </axis:ocultar>
                                          <axis:ocultar f="axisctr220" c="FCARPRO"
                                                        dejarHueco="false">
                                            <!--F Proper Rebut -->
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisctr220" c="FCARPRO"
                                                           lit="1000462"/></b>
                                            </td>
                                          </axis:ocultar>
                                          <axis:ocultar f="axisctr220" c="" dejarHueco="true">
                                            <td class="titulocaja" colspan="2">&nbsp;</td>
                                          </axis:ocultar>
                                        </tr>
                                        <tr>
                                          <axis:ocultar f="axisctr220" c="TFORPAG"
                                                        dejarHueco="false">
                                            <!-- tipo pago -->
                                            <td class="campocaja">
                                              <input type="text"
                                                     class="campowidthinput campo campotexto"
                                                     id="TFORPAG" name="TFORPAG" size="15"
                                                     <axis:atr f="axisctr220" c="TFORPAG" a="modificable=false"/>
                                                     value="${__formdata.datosPoliza.TFORPAG}"
                                                     style="width:60%"
                                                     title='<axis:alt f="axisctr220" c="TFORPAG" lit="100712"/>'/>
                                            </td>
                                          </axis:ocultar>
                                          <axis:ocultar f="axisctr220" c="FCARANU"
                                                        dejarHueco="false">
                                            <!-- FECHA Renovacio -->
                                            <td class="campocaja">
                                              <input type="text"
                                                     class="campowidthinput campo campotexto"
                                                     id="FCARANU" name="FCARANU" size="15"
                                                     <axis:atr f="axisctr220" c="FCARANU" a="modificable=false"/>
                                                     value='<fmt:formatDate value="${__formdata.datosPoliza.FCARANU}" pattern="dd/MM/yyyy"/>'
                                                     style="width:60%"
                                                     title='<axis:alt f="axisctr220" c="FCARANU" lit="102626"/>'/>
                                            </td>
                                          </axis:ocultar>
                                          <axis:ocultar f="axisctr220" c="FCARPRO"
                                                        dejarHueco="false">
                                            <!--F Proper Rebut -->
                                            <td class="campocaja">
                                              <input type="text"
                                                     class="campowidthinput campo campotexto"
                                                     id="FCARPRO" name="FCARPRO" size="15"
                                                     <axis:atr f="axisctr220" c="FCARPRO" a="modificable=false"/>
                                                     value='<fmt:formatDate value="${__formdata.datosPoliza.FCARPRO}" pattern="dd/MM/yyyy"/>'
                                                     style="width:60%"
                                                     title='<axis:alt f="axisctr220" c="FCARPRO" lit="1000462"/>'/>
                                            </td>
                                          </axis:ocultar>
                                          <axis:ocultar f="axisctr220" c="" dejarHueco="true">
                                            <td class="campocaja">&nbsp;</td>
                                          </axis:ocultar>
                                        </tr>
                                    
                                    
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                <!-- Mostar la seccion de detalle de los recibos para la poliza seleccionada Bug: 24450/131928 - 10/12/2012 - MLUIS -->  
                <div class="separador">&nbsp;</div>
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr220" c="DSP_RECIBOS" lit="1000343"/><!-- DisplayTag recibos --></div>

                <table class="seccion" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left">
                        <div class="separador">&nbsp;</div>
                        <table class="area" align="center">
                            <tr>
                                <td>
                                    <c:set var="title1"><axis:alt c="NRECIBO" f="axisctr016" lit="100895" /></c:set>
                                    <c:set var="title7"><axis:alt c="CRECCIA" f="axisctr016" lit="9001763" /></c:set>
                                    <c:set var="title2"><axis:alt c="FEFECTO" f="axisctr016" lit="100883" /></c:set>
                                    <c:set var="title3"><axis:alt c="FVENCIM" f="axisctr016" lit="100885" /></c:set>
                                    <c:set var="title4"><axis:alt c="ICONCEP" f="axisctr016" lit="100563" /></c:set>
                                    <c:set var="title5"><axis:alt c="TTIPREC" f="axisctr016" lit="102302"/></c:set>
                                    <c:set var="title6"><axis:alt c="TESTREC" f="axisctr016" lit="100874" /></c:set>
                                    
                                                                   
                                    <div class="displayspace">
                                        <display:table name="${__formdata.T_IAX_RECIBOS}" id="recibos" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr220.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title1}" sortProperty="OB_IAX_DETRECIBO.NRECIBO" sortable="true" headerClass="headwidth110 sortable" media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber value="${recibos.OB_IAX_DETRECIBO.NRECIBO}" pattern="000000000" /></div>
                                            </display:column>
                                            <axis:visible c="OB_IAX_DETRECIBO.CRECCIA" f="axisctr220">
                                                <display:column title="${title7}" sortProperty="OB_IAX_DETRECIBO.CRECCIA" sortable="true" headerClass="headwidth110 sortable" media="html" autolink="false" >
                                                    <div class="dspText">${recibos.OB_IAX_DETRECIBO.CRECCIA}</div>
                                                </display:column>
                                            </axis:visible>
                                            <display:column title="${title2}" sortProperty="OB_IAX_DETRECIBO.FEFECTO" sortable="true" headerClass="headwidth15 sortable" media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate value="${recibos.OB_IAX_DETRECIBO.FEFECTO}" pattern="dd/MM/yy" /></div>
                                            </display:column>
                                            <display:column title="${title3}" sortProperty="OB_IAX_DETRECIBO.FVENCIM" sortable="true" headerClass="headwidth15 sortable" media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate value="${recibos.OB_IAX_DETRECIBO.FVENCIM}" pattern="dd/MM/yy" /></div>
                                            </display:column>
                                            <display:column title="${title4}" sortProperty="OB_IAX_DETRECIBO.IMPORTE" sortable="true" headerClass="headwidth15 sortable" media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber value="${recibos.OB_IAX_DETRECIBO.IMPORTE}" pattern="${__formatNumberPatterns[__defaultCMONINT]}" /></div>
                                            </display:column>
                                            <display:column title="${title5}" sortProperty="OB_IAX_DETRECIBO.TTIPREC " sortable="true" headerClass="headwidth20 sortable" media="html" autolink="false" >
                                                 <div class="dspText">${recibos.OB_IAX_DETRECIBO.TTIPREC}</div>
                                            </display:column>
                                            <display:column title="${title6}" sortProperty="OB_IAX_DETRECIBO.TESTREC" sortable="true" headerClass="headwidth20 sortable" media="html" autolink="false" >
                                                <div <c:if test="${recibos.OB_IAX_DETRECIBO.CESTREC==0}">class="dspTextAviso"</c:if> <c:if test="${recibos.OB_IAX_DETRECIBO.CESTREC!=0}">class="dspText"</c:if>>${recibos.OB_IAX_DETRECIBO.TESTREC}</div>
                                            </display:column>
                                        </display:table>
                                        </div>
                                   </td>
                                </tr>
                            </table>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                </table>     
  
                    
                    
                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisctr220" c="TOMADOR" lit="1000181"/><%-- Tomadores --%></div>
                    
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <td>
                                            <c:set var="title0"><axis:alt f="axisctr220" c="NOMBRE" lit="105940"/></c:set>   <%-- Nombre --%>
                                            <c:set var="title1"><axis:alt f="axisctr220" c="FECNACIMI" lit="1000064"/></c:set>  <%-- Fecha nacimiento --%>                                 
                                            <c:set var="title2"><axis:alt f="axisctr220" c="DOMICI" lit="101078" /></c:set>  <%-- Domicilio --%>              
                                            
                                            <div id="dt_polizas" class="seccion displayspace">
                                                <display:table name="${__formdata.T_IAX_TOMADORES}" id="T_IAX_TOMADORES" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                                    requestURI="axis_axisctr220.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_TOMADORES.TNOMBRE" headerClass="fixed sortable"  media="html" autolink="false" style="width:30%">
                                                        <div class="dspText">
                                                            ${T_IAX_TOMADORES.OB_IAX_TOMADORES.TNOMBRE} ${T_IAX_TOMADORES.OB_IAX_TOMADORES.TAPELLI1} ${T_IAX_TOMADORES.OB_IAX_TOMADORES.TAPELLI2}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_TOMADORES.FNACIMI" headerClass="fixed sortable"  media="html" autolink="false" style="width:15%">
                                                        <div class="dspText">
                                                            <fmt:formatDate value="${T_IAX_TOMADORES.OB_IAX_TOMADORES.FNACIMI}" pattern="dd/MM/yyyy"/>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="T_IAX_TOMADORES.OB_IAX_TOMADORES.TDOMICI" headerClass="fixed sortable"  media="html" autolink="false" style="width:55%">
                                                        <div class="dspText">
                                                            ${T_IAX_TOMADORES.OB_IAX_TOMADORES.DIRECCIONES[0].OB_IAX_DIRECCIONES.TDOMICI}
                                                        </div>
                                                    </display:column>
                                                </display:table>                                                        
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                    </table>

                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisctr220" c="ASEG" lit="108228"/> <%-- Asegurados --%></div>
                    
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <td>
                                            <c:set var="title0"><axis:alt f="axisctr220" c="NOMBRE" lit="105940"/></c:set>   <%-- Nombre --%>
                                            <c:set var="title1"><axis:alt f="axisctr220" c="PRITOTAL" lit="140531"/></c:set>   <%-- Prima total --%>                                 
                                            <c:set var="title2"><axis:alt f="axisctr220" c="ICAPITAL" lit="151452"/></c:set>   <%-- Prima total --%>
                                            
                                            <div id="dt_polizas" class="seccion displayspace">
                                                <display:table name="${__formdata.T_IAX_GESTRIESGOS}" id="T_IAX_GESTRIESGOS" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                                    requestURI="axis_axisctr220.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_GESTRIESGOS.TNOMBRE" headerClass="fixed sortable"  media="html" autolink="false" style="width:80%">
                                                        <div class="dspText">
                                                            ${__formdata.TASEGURADOS}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_GESTRIESGOS.PRIMATOTAL" headerClass="fixed sortable"  media="html" autolink="false" style="width:20%">
                                                        <div class="dspText">
                                                            <fmt:formatNumber value="${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.PRIMATOTAL}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_GESTRIESGOS.TNOMBRE" headerClass="fixed sortable"  media="html" autolink="false" style="width:80%">
                                                        <div class="dspText">
                                                            <fmt:formatNumber value="${__formdata.ICAPITAL}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>
                                                        </div>
                                                    </display:column>   
                                                </display:table>                                                        
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                    </table>

                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisctr220" c="MOVPOL" lit="1000298"/> <%-- Movimientos póliza --%></div>
                    
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <td>
                                            <c:set var="title0"><axis:alt f="axisctr220" c="FECMOVIMI" lit="101006"/></c:set>   <%-- Fecha movimiento --%>
                                            <c:set var="title1"><axis:alt f="axisctr220" c="TIPMOVI" lit="1000591"/></c:set>  <%-- Tipo movimiento --%>                                 
                                            <c:set var="title2"><axis:alt f="axisctr220" c="MOTIV" lit="102577" /></c:set>  <%-- Motivo --%>              
                                            <c:set var="title3"><axis:alt f="axisctr220" c="USU" lit="100894" /></c:set>  <%-- Usuario --%>              
                                            <c:set var="title4"><axis:alt f="axisctr220" c="FEFECTO" lit="100883" /></c:set>  <%-- Fecha efecto --%>              
                                            
                                            <div id="dt_polizas" class="seccion displayspace">
                                                <display:table name="${__formdata.T_IAX_MVTPOLIZA}" id="T_IAX_MVTPOLIZA" export="false" class="dsptgtable" pagesize="-1" 
                                                    sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr220.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>                                                                                                            
                                                    <display:column title="${title0}" sortable="true" sortProperty="FMOVIMI" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <fmt:formatDate value="${T_IAX_MVTPOLIZA.FMOVIMI}" pattern="dd/MM/yyyy"/>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="TTIPMOV" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${T_IAX_MVTPOLIZA.TTIPMOV}    
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="TMOTMOV" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${T_IAX_MVTPOLIZA.TMOTMOV}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="CUSUMOV" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${T_IAX_MVTPOLIZA.CUSUMOV}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="FEFECTO" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <fmt:formatDate value="${T_IAX_MVTPOLIZA.FEFECTO}" pattern="dd/MM/yyyy"/>
                                                        </div>
                                                    </display:column>
                                                </display:table>                                                        
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                    </table>
                    
                    <!-- Bug 27766 -->
                    <axis:visible f="axisctr220" c="MOVPOLPIG">
                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisctr220" c="MOVPOLPIG" lit="152211"/> <%-- Bloqueos y Pignoraciones --%>
                        <c:if test="${__formdata.PIGNORACIONMULTIPLE}">
                        <div style="float:right;" id="BT_NUEVO_DEST_PIG">
                            <axis:visible f="axisctr220" c="BT_NUEVO_DEST_PIG">
                                <a href="javascript:f_abrir_modal('axisctr221',null,'&SSEGURO='+document.miForm.SSEGURO.value+'&MODO=ALTA_BENEF&SPERSON=&TMOTMOV=BOT_PIGNORAR&NMOVIMI='+(parseInt(document.miForm.NMOVIMI.value)+1));">
                                <!--a href="javascript:f_abrir_modal('axisctr221', null, '&SSEGURO=' + document.miForm.SSEGURO.value + '&TMOTMOV=' + TMOTMOV + '&PRIMERA=1&MODO=MODIF_BENEF&SPERSON=');"-->
                                    <img border="0" alt='<axis:alt f="axisctr220" c="NUEVO_DESTINATARIOPIG" lit="9906370"/>'
                                         title='<axis:alt f="axisctr220" c="NUEVO_DESTINATARIOPIG" lit="9906370"/>' src="images/new.gif" /> 
                                </a>
                            </axis:visible>
                        </div>
                        </c:if>
                    </div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <td>
                                            <c:set var="title0"><axis:alt f="axisctr220" c="FECMOVIMI" lit="101006"/></c:set>   <%-- Fecha movimiento --%>
                                            <c:set var="title1"><axis:alt f="axisctr220" c="BENEF" lit="9906366"/></c:set>  <%-- Beneficiario Pignoración--%>                                 
                                            <c:set var="title2"><axis:alt f="axisctr220" c="MOTIV" lit="100588" /></c:set>  <%-- Descripción --%> 
                                            <c:set var="title3"><axis:alt f="axisctr220" c="RANK" lit="9906365" /></c:set>  <%-- Rank --%> 
                                            <c:set var="title4"><axis:alt f="axisctr220" c="USU" lit="100894" /></c:set>  <%-- Usuario --%>              
                                            <c:set var="title5"><axis:alt f="axisctr220" c="FEFECTO" lit="100883" /></c:set>  <%-- Fecha efecto --%>
                                           
                                            
                                            <div id="dt_polizas" class="seccion displayspace"> 
                                                <display:table name="${__formdata.T_IAX_MVTPOLIZAPIGNORADA}" id="T_IAX_MVTPOLIZAPIGNORADA" export="false" class="dsptgtable" pagesize="-1" 
                                                    sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr220.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                    <display:column title="${title0}" sortable="true" sortProperty="FMOVIMI" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <fmt:formatDate value="${T_IAX_MVTPOLIZAPIGNORADA.FMOVIMI}" pattern="dd/MM/yyyy"/>
                                                        </div>
                                                    </display:column>
                                                     
                                                   
                                                    <display:column title="${title1}" sortable="true" sortProperty="TTIPMOV" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${T_IAX_MVTPOLIZAPIGNORADA.TNOMBRE}    
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="TMOTMOV" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${T_IAX_MVTPOLIZAPIGNORADA.TTEXTO}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="TMOTMOV" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${T_IAX_MVTPOLIZAPIGNORADA.NRANGO}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="CUSUMOV" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${T_IAX_MVTPOLIZAPIGNORADA.CUSUMOV}
                                                        </div>
                                                    </display:column>  
                                                    <display:column title="${title5}" sortable="true" sortProperty="FMOVIMI" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <fmt:formatDate value="${T_IAX_MVTPOLIZAPIGNORADA.FEFECTO}" pattern="dd/MM/yyyy"/>
                                                        </div>
                                                    </display:column>
                                                    
                                                    <display:column title="" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <a href="javascript:f_abrir_modal('axisctr221',null,'&SSEGURO='+document.miForm.SSEGURO.value+'&MODO=ELIMINAR_BENEF&TMOTMOV=BOT_DESPIGNORAR&SPERSON=${T_IAX_MVTPOLIZAPIGNORADA.SPERSON}&NMOVIMI=${T_IAX_MVTPOLIZAPIGNORADA.NMOVIMI}');">
                                                                <img border="0" src="images/delete.gif"  style="cursor:pointer" alt="<axis:alt f="axisctr220" c="eliminar" lit="1000127"/>" title="<axis:alt f="axisctr220" c="ELIMINAR" lit="9906381"/>"/>
                                                            </a>
                                                        </div>
                                                        <input type="hidden" id="NMOVIMIPIG" value="${T_IAX_MVTPOLIZAPIGNORADA.NMOVIMI}" name="NMOVIMIPIG"/>
                                                    </display:column>
                                                </display:table>                                                        
                                            </div>
                </td>     
            </tr>            
        </table>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                    </table>
                   </axis:visible>
                    <!--  -->
                </td>     
            </tr>            
        </table>
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr220</c:param>
            <c:param name="__botones">salir<axis:visible f="axisctr220" c="BOT_CONSULTAPOLIZA">,102316</axis:visible><axis:visible f="axisctr220" c="BOT_BLOQUEAR">,9001575</axis:visible><axis:visible f="axisctr220" c="BOT_DESBLOQUEAR">,9001576</axis:visible><axis:visible f="axisctr220" c="BOT_PIGNORAR">,9001577</axis:visible><axis:visible f="axisctr220" c="BOT_DESPIGNORAR">,9001578</axis:visible><axis:visible f="axisctr220" c="BOT_SUSPENDER"><c:if test="${__formdata.PROXCMOTMOV == 391}">,9904545</c:if></axis:visible><axis:visible f="axisctr220" c="BOT_REINICIAR"><c:if test="${__formdata.PROXCMOTMOV == 392}">,9904546</c:if></axis:visible></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

</body>
</html>