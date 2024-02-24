<%/* Revision:# n7l4akEFgDxgch20tFHHLg== # */%>
<%-- 
*  Fichero: axisfic005.jsp
*  @author <a href = "mailto:erhernandez@csi-ti.com">Edgar Hernndez</a>
*
*  Fecha: 21/06/2016
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


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

    <!--********** CALENDARIO ************************* -->
      <!-- Hoja de estilo del Calendario -->
      <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
      <!-- Script principal del calendario -->
      <script type="text/javascript" src="scripts/calendar.js"></script>
      <!-- Idioma del calendario, en funcin del Locale -->
      <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
      <!-- Setup del calendario -->
      <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** --> 


    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload_axisfic005() {
            <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
              retocarPAGE_CSS('axisfic005');
            </c:if>
            revisarEstilos();
            var resultado = '${requestScope.resultado}';
            if (!objUtiles.estaVacio(resultado) && resultado == "0"){
                parent.f_aceptar_axisfic005();  
            }
        }
        
                
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
                formdataCMODO = '${__formdata.CMODO}';
                if (!objUtiles.estaVacio(formdataCMODO) && formdataCMODO != "1"){
                  objUtiles.ejecutarFormulario("modal_axisfic005.do", "aceptar",  document.axisfic005Form, "_self", objJsMessages.jslit_cargando);
                }else{
                    f_but_cancelar();
               }    
            }
        }
        
        function f_but_cancelar() {        
            revisarEstilos();
            parent.f_cerrar_axisfic005();
        }                
        
        function f_but_salir() {
            revisarEstilos();
            parent.f_cerrar_axisfic005();
        }
        
        function f_formatdate(entrada,title){
            var jDate = new JsFecha();
            if(entrada.value.length>0){
              entrada.value=jDate.formateaFecha(entrada.value);
                  
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt f="axisfic005" c="ALER_ERR" lit="1000421"/>");
                }
            }
        } 
        
        function f_but_9909412(){
            if (objValidador.validaEntrada()) {
                formdataCMODO = '${__formdata.CMODO}';
                if (!objUtiles.estaVacio(formdataCMODO) && formdataCMODO != "1"){
                  objUtiles.ejecutarFormulario("modal_axisfic005.do", "calcular",  document.axisfic005Form, "_self", objJsMessages.jslit_cargando);
                }
            }
        }
        
        
        function f_but_9000554(){
            if (objValidador.validaEntrada()) {
                formdataCMODO = '${__formdata.CMODO}';
                if (!objUtiles.estaVacio(formdataCMODO) && formdataCMODO != "1"){
                  objUtiles.ejecutarFormulario("modal_axisfic005.do", "datosHost",  document.axisfic005Form, "_self", objJsMessages.jslit_cargando);
                }
            }
        }
        
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
          function f_onchange_CMONCAM(){
              if (objValidador.validaEntrada()) {
            //  formdataCMONCAM = '${__formdata.CMONCAM}';
            //  if (!objUtiles.estaVacio(formdataCMONCAM) && formdataCMONCAM != null){
                    objUtiles.ejecutarFormulario("modal_axisfic005.do", "consultarMonedaCambio",  document.axisfic005Form, "_self", objJsMessages.jslit_cargando);
            //  }
             }
            
          }
        

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
                
        /****************************************************************************************/
        /************************************** axisfic006****************************************/
        /****************************************************************************************/    
          function f_abrir_axisfic006(selectedSFINANCI, selectedNMOVIMI) {
              objUtiles.abrirModal("axisfic006", "src", "modal_axisfic006.do?operation=init&AXISMPRXXX=axisfic006&SFINANCI="+selectedSFINANCI+"&NMOVIMI="+selectedNMOVIMI);
          }
          function f_aceptar_axisfic006(selectedSFINANCI, selectedNMOVIMI){
              objUtiles.cerrarModal("axisfic006");
              objUtiles.ejecutarFormulario("modal_axisfic005.do", "form", document.axisfic005Form, "_self", objJsMessages.jslit_cargando);
              f_onchange_CMONCAM();
          }
          function f_cancelar_axisfic006(){
              objUtiles.cerrarModal("axisfic006");
          }
          
        /****************************************************************************************/
        /*********************************** axisfic007 ********************************/
        /****************************************************************************************/    
         function f_abrir_axisfic007(NCAMPO,NNOMCAMP){
             var TCAMPO=objDom.getValorPorId(NCAMPO);
             // Inicio IAXIS-3674 10/06/2019
             var SFINANCI="${__formdata.SFINANCI}";
             var NMOVIMI="${__formdata.NMOVIMI}";
             // Fin IAXIS-3674 10/06/2019
             itemc=NCAMPO;
         var re = /%/g;
             TCAMPO = TCAMPO.replace(re,"XxX");
             // Inicio IAXIS-3674 10/06/2019
             if (NCAMPO != "TCUPOR"){
                 TCAMPO = ""; 
             } 
             objUtiles.abrirModal("axisfic007", "src", "modal_axisfic007.do?operation=form&NCAMPO="+NCAMPO+"&NNOMCAMP="+NNOMCAMP+"&TCAMPO="+TCAMPO+"&SFINANCI="+SFINANCI+"&NMOVIMI="+NMOVIMI);
             // Fin IAXIS-3674 10/06/2019
             // objDom.setValorPorId(itemc, "");
         }  
                 
         function f_aceptar_axisfic007(CODIGO, TEXTO){
             f_cerrar_axisfic007();
             if (!objUtiles.estaVacio(TEXTO)){
                objDom.setValorPorId(itemc,TEXTO);
             }else{   
                 limpiaCampos(itemc);
             }
         }   
        
         function f_cerrar_axisfic007(){
             objUtiles.cerrarModal("axisfic007"); 
         } 
            
        /****************************************************************************************/
        /************************************** UTILES *******************************************/
        /****************************************************************************************/
        function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
        }
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        
    </script>  

  </head>
  <body onload="f_onload_axisfic005()">
    <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
    
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisfic006" c="MODFIC006" lit=""/>
      </c:param>
      <c:param name="nid" value="axisfic006"/>
    </c:import> 
    
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
         <axis:alt f="axisfic005" c="LIT_1000573" lit="1000573" />
       </c:param>
       <c:param name="nid" value="axisfic007" />
    </c:import> 
      
    <form name="axisfic005Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SFINANCI"  value="${__formdata.SFINANCI}"/>
        <input type="hidden" name="NMOVIMI"  value="${__formdata.NMOVIMI}"/>
        <input type="hidden" name="SPERSON"  value="${__formdata.SPERSON}"/>
        <input type="hidden" name="CMODO" value="${__formdata.CMODO}">
        <input type="hidden" name="CAGENTE"  value="${__formdata.CAGENTE}"/> 
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisfic005" c="formulario" lit="9909081" /></c:param>
            <c:param name="producto"><axis:alt f="axisfic005" c="producto" lit="9909081" /></c:param>
            <c:param name="form">axisfic005</c:param>
        </c:import>
        
        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:70%">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                    <table class="seccion">
                       <tr>
                           <th style="height:0px"></th>
                       </tr>
                       <!-- Cuentas -->
                       <axis:visible c="DSP_CUENTAS" f="axisfic005">
                            <c:if test="${__formdata.T_IAX_FINANCIERA==null}">  
                                <tr>
                                    <td class="campocaja" colspan="4">
                                        <img src="images/mes.gif" id="DSP_CUENTAS_parent" onclick="objEstilos.toggleDisplay('DSP_CUENTAS', this)" style="cursor: pointer" /> 
                                            <b><axis:alt f="axisfic005" c="CCUENTAS" lit="1000092" /></b>
                                        <hr class="titulo">
                                    </td>
                                </tr>
                                <tr id="DSP_CUENTAS_children" style="display:yes">
                                    <td class="campocaja" colspan="2" >
                                        <axis:visible c="BT_EDICUENTAS" f="axisfic005"><!-- IAXIS-4854 -->
                                                <c:if test="${__formdata.CMODO != 'CONSULTA'}">  <!-- POST-123 -->
                                                <div style="float:right;">
              
                                                    <img border="0" alt='<axis:alt f="axisfic005" c="LIT_EDITAR" lit="100002"/>'
                                                         title='<axis:alt f="axisfic005" c="LIT_EDITAR" lit="100002"/>' src="images/lapiz.gif"
                                                            onclick="f_abrir_axisfic006('${__formdata.SFINANCI}', '${__formdata.NMOVIMI}')"/>
                                                  
                                                </div>
                                             </c:if>  <!-- POST-123 -->
                                        </axis:visible><!-- IAXIS-4854 -->
                                         <c:if test="${__formdata.CMODO == 'CONSULTA'}">  <!-- POST-123 -->
                                              <br>
                                          </c:if>                                   
                                        <div class="displayspace">
                                            <c:set var="title0"><axis:alt f="axisfic005" c="TVALPAR_LIT" lit="109373"/></c:set>
                                            <c:set var="title1"><axis:alt f="axisfic005" c="NVALPAR_LIT" lit="101159"/></c:set>
                                           
                                              <div class="separador">&nbsp;</div>
                                              <display:table name="${__formdata.lstParCuenta}"
                                                             id="idLstParCuenta"
                                                             export="false"
                                                             class="dsptgtable"
                                                             pagesize="-1"
                                                             defaultsort="0"
                                                             defaultorder="ascending"
                                                             sort="list"
                                                             cellpadding="0" 
                                                             cellspacing="0"
                                                             requestURI="axis_axisfic005.do?paginar=true">
                                                            <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                    <display:column title="" sortProperty="NORDEN" headerClass="sortable" media="html" sortable="false" autolink="false" style="width:6%;">
                                                        <div class="dspNumber">${idLstParCuenta.NORDEN}</div>
                                                    </display:column>
                                                    <display:column title="${title0}" sortProperty="TVALPAR" headerClass="sortable" media="html" sortable="false" autolink="false" style="width:22%;">
                                                        <div class="dspText">${idLstParCuenta.TPARAM}</div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortProperty="NVALPAR" headerClass="sortable" media="html" sortable="false" autolink="false" style="width:22%;">                                                              
                                                        <div class="dspNumber">
                                                            <c:if test="${idLstParCuenta.CTIPO==4}">
                                                                <div class="dspText">
                                                                  ${idLstParCuenta.RESP}
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${idLstParCuenta.CTIPO!=4}">
                                                                <c:if test="${idLstParCuenta.NVALPAR != null}"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstParCuenta.NVALPAR}"/></c:if>
                                                                <c:if test="${idLstParCuenta.FVALPAR != null}">${idLstParCuenta.FVALPAR}</c:if>
                                                                <c:if test="${idLstParCuenta.TVALPAR != null}"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstParCuenta.TVALPAR}"/></c:if>
                                                            </c:if>
                                                        </div>
                                                    </display:column>
                                                                
                                              </display:table>                          
                                        </div>   
                                    </td>
                                    <td class="campocaja" colspan="2">  
                                        
                                        <br>    
                                    
                                        <div class="displayspace">
                                            <c:set var="title2"><axis:alt f="axisfic005" c="NINDCIE_LIT" lit="9909785"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisfic005" c="NINDSEC_LIT" lit="9909786"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisfic005" c="NINDSEC_LIT" lit="101761"/></c:set>
                                          
                                              <div class="separador">&nbsp;</div>
                                              <display:table name="${__formdata.lstIndicadores}"
                                                             id="idLstIndicadores"
                                                             export="false"
                                                             class="dsptgtable"
                                                             pagesize="-1"
                                                             defaultsort="2"
                                                             defaultorder="ascending"
                                                             sort="list"
                                                             cellpadding="0" 
                                                             cellspacing="0"
                                                             requestURI="axis_axisfic005.do?paginar=true">
                                                            <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                    <display:column title="${title4}" sortProperty="TINDCAD" headerClass="sortable" media="html" sortable="true" autolink="false" style="width:25%;">
                                                        <div class="dspText">${idLstIndicadores.TINDCAD}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortProperty="NINDCIE" headerClass="sortable" media="html" sortable="true" autolink="false" style="width:25%;">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstIndicadores.NINDCLI}"/></div>
                                                    </display:column>
                                                    <c:if test="${__formdata.CTIPIDE!=96}">
                                                    <display:column title="${title3}" sortProperty="NINDSEC" headerClass="sortable" media="html" sortable="true" autolink="false" style="width:25%;">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstIndicadores.NINDSEC}"/></div>
                                                    </display:column>
                                                    </c:if>         
                                              </display:table>                          
                                        </div>      
                                    </td>
                                </tr>
                            </c:if>
                      </axis:visible>   
                       <!-- Concepto -->
                       <axis:visible c="DSP_INDICAFINAN" f="axisfic005">
                         <c:if test="${__formdata.T_IAX_FINANCIERA==null}">
                            <tr>
                                <td class="campocaja" colspan="4">
                                  <img src="images/mes.gif" id="DSP_INDICAFINAN_parent"
                                    onclick="objEstilos.toggleDisplay('DSP_INDICAFINAN', this)"
                                    style="cursor: pointer" /> <b><axis:alt f="axisfic005"
                                    c="CINDICAFINAN" lit="100896" /></b>
                                    <hr class="titulo">
                                </td>
                            </tr>
                            <tr id="DSP_INDICAFINAN_children" style="display: none">
                                <td class="campocaja" colspan="4">
                                    <tr>
                                        <th style="width: 25%; height: 0px"></th>
                                        <th style="width: 25%; height: 0px"></th>
                                        <th style="width: 25%; height: 0px"></th>
                                        <th style="width: 25%; height: 0px"></th>
                                    </tr>

                                    <tr>
                                        <axis:visible f="axisfic005" c="CESVALOR">
                                            <td class="titulocaja" id="LIT_CESVALOR" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="CESVALOR" lit="9909073" /></b></td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="CMONORI">
                                            <td class="titulocaja" id="LIT_CMONORI" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="CMONORI" lit="9907718" /></b></td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="FCUPO">
                                            <td class="titulocaja" id="LIT_FCUPO" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="FCUPO" lit="9909110" /></b></td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="ICUPOG">
                                            <td class="titulocaja" id="LIT_ICUPOG" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="ICUPOG" lit="9909108" /></b></td>
                                        </axis:visible>

                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfic005" c="CESVALOR">
                                            <td class="campocaja" colspan="1"><select
                                                name="CESVALOR" id="CESVALOR" size="1"
                                                class="campowidthselect campo campotexto"
                                                style="width: 90%;"
                                                title="<axis:alt f="axisfic005" c="CESVALOR" lit="9909073"/>"
                                                <%-- <c:if test="${__formdata.CMODO == '1'}"> disabled="disabled" </c:if> --%>>&nbsp; <!-- POST-123 -->
                                                    <option value="<%=Integer.MIN_VALUE%>">-
                                                        <axis:alt f="axisfic005" c="C_CESVALOR" lit="1000348" />
                                                        -
                                                    </option>
                                                    <c:forEach var="element"
                                                        items="${__formdata.listValores.lstEsValores}">
                                                        <option value="${element.CATRIBU}"
                                                            <c:if test="${element.CATRIBU == __formdata.CESVALOR}"> selected </c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                                    </c:forEach>
                                            </select></td>
                                        </axis:visible>
                                                   <%-- -- INI - IAXIS-15405 - JLTS - 04/05/2021, Se adiciona la obligatoriedad del campo --%>
                                                   <axis:visible f="axisfic005" c="CMONORI" >
                                                      <td class="campocaja" colspan="1">       
                                                        <select name="CMONORI" id="CMONORI" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                                                title="<axis:alt f="axisfic005" c="CMONORI" lit="9907718"/>"
                                                                <axis:atr f="axisfic005" c="CMONORI" a="obligatorio=true"/>
                                                                <%-- <c:if test="${__formdata.CMODO == '1'}"> disabled="disabled" </c:if> --%> >&nbsp; <!-- POST-123 -->
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfic005" c="C_CMONORI" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listaMon}">
                                                                <option value = "${element.CMONEDA}" 
                                                                <c:if test="${element.CMONEDA == __formdata.CMONORI}"> selected </c:if> />
                                                                    ${element.TMONEDA} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>         
                                                      </td>
                                                   </axis:visible>
                                                   <%-- -- FIn - IAXIS-15405 - JLTS - 04/05/2021 --%> 
                                        <axis:visible f="axisfic005" c="FCUPO">
                                             <!-- POST-123 --><td class="campocaja" colspan="1"><jsp:useBean
                                                    id="todayFCUPO" class="java.util.Date" /><!-- IAXIS-4854 axis:atr-->
                                                <c:set var="FCUPO">
                                                    <fmt:formatDate pattern="dd/MM/yyyy"
                                                        value="${__formdata.FCUPO}" />
                                                </c:set> <input type="text"
                                                <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>
                                                onblur="javascript:f_formatdate(this,'')" formato="fecha"
                                                alt="<axis:alt f="axisfic005" c="FCUPO" lit="9909110"/>"
                                                title="<axis:alt f="axisfic005" c="FCUPO" lit="9909110"/>"
                                                name="FCUPO" id="FCUPO"
                                                <axis:atr f="axisfic005" c="FCUPO" a="modificable=true"/>
                                                value="${FCUPO} <c:if test="${empty FCUPO}"><fmt:formatDate pattern="dd/MM/yyyy" value="${todayFCUPO}"/></c:if>"
                                                style="width: 90%;"
                                                class="campowidthinput campo campotexto_ob" /> <axis:visible
                                                    c="ICO_FCUPO" f="axisfic005">
                                                    <a id="icon_FCUPO" style="vertical-align: middle;"> <img
                                                        alt="<axis:alt f="axisfic005" c="SELECT" lit="108341"/>"
                                                        title="<axis:alt f="axisfic005" c="ICO_FCUPO" lit="9909109" />"
                                                        src="images/calendar.gif" /></a>
                                                </axis:visible></td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="ICUPOG">
                                            <td class="campocaja" colspan="1">
                                                <!-- IAXIS-4854 axis:atr--> <!-- POST-123 --> <input type="numeric"
                                                class="campowidthinput campo camponumerico" id="ICUPOG"
                                                name="ICUPOG" size="15"
                                                <axis:atr f="axisfic005" c="ICUPOG" a="modificable=true"/>
                                                <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>
                                                title="<axis:alt f="axisfic005" c="ICUPOG" lit="9909108"/>"
                                                style="width: 100%"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.ICUPOG}'/>" />
                                            </td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfic005" c="ICUPOS">
                                            <!-- IAXIS-4854 axis:atr-->
                                            <td class="titulocaja" id="LIT_ICUPOS" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="ICUPOS" lit="9909109" /></b></td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="FCUPOS">
                                            <td class="titulocaja" id="LIT_FCUPOS" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="FCUPOS" lit="9909131" /></b></td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="TCUPOR">
                                            <td class="titulocaja" id="LIT_TCUPOR" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="TCUPOR" lit="9909111" /></b></td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="TCONCEPC">
                                            <td class="titulocaja" id="LIT_TCONCEPC" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="TCONCEPC" lit="9909113" /></b></td>
                                        </axis:visible>

                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfic005" c="ICUPOS">
                                            <td class="campocaja" colspan="1">
                                                <!-- IAXIS-4854 axis:atr-->  <!-- POST-123 --><input type="numeric"
                                                class="campowidthinput campo camponumerico" id="ICUPOS"
                                                name="ICUPOS" size="15"
                                                <axis:atr f="axisfic005" c="ICUPOS" a="modificable=true"/>
                                                <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>
                                                title="<axis:alt f="axisfic005" c="ICUPOS" lit="9909109"/>"
                                                style="width: 100%"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.ICUPOS}'/>" />
                                            </td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="FCUPOS">
                                            <td class="campocaja" colspan="1">
                                                <!-- IAXIS-4854 axis:atr --> <jsp:useBean id="todayFCUPOS"
                                                    class="java.util.Date" /> <c:set var="FCUPOS">
                                                    <fmt:formatDate pattern="dd/MM/yyyy"
                                                        value="${__formdata.FCUPOS}" />
                                                </c:set>  <!-- POST-123 --><input type="text"
                                                <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>
                                                onblur="javascript:f_formatdate(this,'')" formato="fecha"
                                                alt="<axis:alt f="axisfic005" c="FCUPOS" lit="9909110"/>"
                                                title="<axis:alt f="axisfic005" c="FCUPOS" lit="9909110"/>"
                                                name="FCUPOS" id="FCUPOS"
                                                <axis:atr f="axisfic005" c="FCUPOS" a="modificable=true"/>
                                                value="${FCUPOS} <c:if test="${empty FCUPOS}"><fmt:formatDate pattern="dd/MM/yyyy" value="${todayFCUPOS}"/></c:if>"
                                                style="width: 90%;"
                                                class="campowidthinput campo campotexto_ob" /> <axis:visible
                                                    c="ICO_FCUPOS" f="axisfic005">
                                                    <a id="icon_FCUPOS" style="vertical-align: middle;"> <img
                                                        alt="<axis:alt f="axisfic005" c="SELECT" lit="108341"/>"
                                                        title="<axis:alt f="axisfic005" c="ICO_FCUPOS" lit="9909131" />"
                                                        src="images/calendar.gif" /></a>
                                                </axis:visible>
                                            </td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="TCUPOR">
                                            <td class="campocaja" colspan="1"><input type="text"
                                                class="campowidthinput campo campotexto" readonly="readonly"
                                                size="15" value="${__formdata.TCUPOR}" name="TCUPOR"
                                                id="TCUPOR" style="width: 50%;"
                                                title="<axis:alt f="axisfic005" c="lit_9909111" lit="9909111"/>" />
                                                 <!-- POST-123 --><%-- <c:if test="${__formdata.CMODO != '1'}"> --%>         
                                                         &nbsp;<img id="findTcup"
                                                        border="0" src="images/mas.gif"
                                                        onclick="f_abrir_axisfic007('TCUPOR','9909111')"
                                                        style="cursor: pointer" />
                                                <%-- </c:if>  --%>&nbsp;<c:if test="${__formdata.TCUPOR!=null}">
                                                    <span id="TCUPOR_span"><b><axis:alt
                                                                f="axisfic005" c="formulario" lit="9910983" /></b></span>
                                                </c:if> <c:if test="${__formdata.TCUPOR==null}">
                                                    <span id="TCUPOR_span"><b><axis:alt
                                                                f="axisfic005" c="formulario" lit="9910984" /></b></span>
                                                </c:if>
                                            </td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="TCONCEPC">
                                            <td class="campocaja" colspan="1"><textarea cols=""
                                                    rows="1" class="campo campotexto" id="TCONCEPC"
                                                    name="TCONCEPC" size="15"
                                                    title="<axis:alt f="axisfic005" c="lit_9909113" lit="9909113"/>"
                                                    readonly="readonly"
                                                    style="width: 50%; resize: none; overflow: hidden"
                                                    <axis:atr f="axisfic005" c="TCONCEPC" a="obligatorio=true&isInputText=false" />>${__formdata.TCONCEPC}</textarea>
                                                 <!-- POST-123 --><%-- <c:if test="${__formdata.CMODO != '1'}"> --%>         
                                                     &nbsp;<img id="findTcpc" border="0"
                                                        src="images/lapiz.gif"
                                                        onclick="f_abrir_axisfic007('TCONCEPC','9909113')"
                                                        style="cursor: pointer" />
                                                <%-- </c:if>  --%>&nbsp;<c:if test="${__formdata.TCONCEPC!=null}">
                                                    <span id="TCONCEPC_span"><b><axis:alt
                                                                f="axisfic005" c="formulario" lit="9910983" /></b></span>
                                                </c:if> <c:if test="${__formdata.TCONCEPC==null}">
                                                    <span id="TCONCEPC_span"><b><axis:alt
                                                                f="axisfic005" c="formulario" lit="9910984" /></b></span>
                                                </c:if></td>
                                        </axis:visible>
                                    </tr>
                                    <tr>

                                        <axis:visible f="axisfic005" c="TCONCEPS">
                                            <td class="titulocaja" id="LIT_TCONCEPS" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="TCONCEPS" lit="9909114" /></b></td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="TCBUREA">
                                            <td class="titulocaja" id="LIT_TCBUREA" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="TCBUREA" lit="9909115" /></b></td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="TCOTROS">
                                            <td class="titulocaja" id="LIT_TCOTROS" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="TCOTROS" lit="9909116" /></b></td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="CMONCAM">
                                            <td class="titulocaja" id="LIT_CMONCAM" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="CMONCAM" lit="9909132" /></b></td>
                                        </axis:visible>

                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfic005" c="TCONCEPS">
                                            <td class="campocaja" colspan="1"><textarea cols=""
                                                    rows="1" class="campo campotexto" id="TCONCEPS"
                                                    name="TCONCEPS" size="15"
                                                    title="<axis:alt f="axisfic005" c="lit_9909114" lit="9909114"/>"
                                                    readonly="readonly"
                                                    style="width: 50%; resize: none; overflow: hidden"
                                                    <axis:atr f="axisfic005" c="TCONCEPS" a="obligatorio=true&isInputText=false" />>${__formdata.TCONCEPS}</textarea>
                                                 <!-- POST-123 --><%-- <c:if test="${__formdata.CMODO != '1'}"> --%>         
                                                     &nbsp;<img id="findTcpc" border="0"
                                                        src="images/lapiz.gif"
                                                        onclick="f_abrir_axisfic007('TCONCEPS','9909114')"
                                                        style="cursor: pointer" />
                                                <%-- </c:if>  --%>&nbsp;<c:if test="${__formdata.TCONCEPS!=null}">
                                                    <span id="TCONCEPS_span"><b><axis:alt
                                                                f="axisfic005" c="formulario" lit="9910983" /></b></span>
                                                </c:if> <c:if test="${__formdata.TCONCEPS==null}">
                                                    <span id="TCONCEPS_span"><b><axis:alt
                                                                f="axisfic005" c="formulario" lit="9910984" /></b></span>
                                                </c:if>
                                            </td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="TCBUREA">
                                            <td class="campocaja" colspan="1"><textarea cols=""
                                                    rows="1" class="campo campotexto" id="TCBUREA"
                                                    name="TCBUREA" size="15"
                                                    title="<axis:alt f="axisfic005" c="lit_9909115" lit="9909115"/>"
                                                    readonly="readonly"
                                                    style="width: 50%; resize: none; overflow: hidden"
                                                    <axis:atr f="axisfic005" c="TCBUREA" a="obligatorio=true&isInputText=false" />>${__formdata.TCBUREA}</textarea>
                                                 <!-- POST-123 --><%-- <c:if test="${__formdata.CMODO != '1'}"> --%>         
                                                     &nbsp;<img id="findTcpc" border="0"
                                                        src="images/lapiz.gif"
                                                        onclick="f_abrir_axisfic007('TCBUREA','9909115')"
                                                        style="cursor: pointer" />
                                                <%-- </c:if> --%> &nbsp;<c:if test="${__formdata.TCBUREA!=null}">
                                                    <span id="TCBUREA_span"><b><axis:alt
                                                                f="axisfic005" c="formulario" lit="9910983" /></b></span>
                                                </c:if> <c:if test="${__formdata.TCBUREA==null}">
                                                    <span id="TCBUREA_span"><b><axis:alt
                                                                f="axisfic005" c="formulario" lit="9910984" /></b></span>
                                                </c:if></td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="TCOTROS">
                                            <td class="campocaja" colspan="1"><textarea cols=""
                                                    rows="1" class="campo campotexto" id="TCOTROS"
                                                    name="TCOTROS" size="15"
                                                    title="<axis:alt f="axisfic005" c="lit_9909116" lit="9909116"/>"
                                                    readonly="readonly"
                                                    style="width: 50%; resize: none; overflow: hidden"
                                                    <axis:atr f="axisfic005" c="TCOTROS" a="obligatorio=true&isInputText=false" />>${__formdata.TCOTROS}</textarea>
                                                 <!-- POST-123 --><%-- <c:if test="${__formdata.CMODO != '1'}"> --%>         
                                                     &nbsp;<img id="findTcpc" border="0"
                                                        src="images/lapiz.gif"
                                                        onclick="f_abrir_axisfic007('TCOTROS','9909116')"
                                                        style="cursor: pointer" />
                                                <%-- </c:if>  --%>&nbsp;<c:if test="${__formdata.TCOTROS!=null}">
                                                    <span id="TCOTROS_span"><b><axis:alt
                                                                f="axisfic005" c="formulario" lit="9910983" /></b></span>
                                                </c:if> <c:if test="${__formdata.TCOTROS==null}">
                                                    <span id="TCOTROS_span"><b><axis:alt
                                                                f="axisfic005" c="formulario" lit="9910984" /></b></span>
                                                </c:if></td>
                                        </axis:visible>

                                        <axis:visible f="axisfic005" c="CMONCAM">
                                            <td class="campocaja" colspan="1">
                                                <!-- IAXIS-4854 axis:atr --> <select name="CMONCAM"
                                                id="CMONCAM" size="1"
                                                class="campowidthselect campo campotexto"
                                                style="width: 90%;"
                                                title="<axis:alt f="axisfic005" c="CMONCAM" lit="9909132"/>"
                                                onchange="f_onchange_CMONCAM()"
                                                <axis:atr f="axisfic005" c="CMONCAM" a="modificable=true"/>
                                                <%-- <c:if test="${__formdata.CMODO == '1'}"> disabled="disabled" </c:if> --%>>&nbsp; <!-- POST-123 -->
                                                    <option value="<%= Integer.MIN_VALUE %>">-
                                                        <axis:alt f="axisfic005" c="C_CMONCAM" lit="1000348" /> -
                                                    </option>
                                                    <c:forEach var="element" items="${__formdata.listaMon}">
                                                        <option value="${element.CMONEDA}"
                                                            <c:if test="${element.CMONEDA == __formdata.CMONCAM}"> selected </c:if> />
                                                                    ${element.TMONEDA} 
                                                                </option>
                                                    </c:forEach>
                                            </select>
                                            </td>
                                        </axis:visible>
                                    </tr>
                                    <tr>

                                        <axis:visible f="axisfic005" c="NCAPFIN">
                                            <td class="titulocaja" id="LIT_NCAPFIN" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="NCAPFIN" lit="89906089" /></b></td>
                                        </axis:visible>
                                        
                                        <!-- Cambio para IAXIS-15710 : Start -->
                                        <axis:visible f="axisfic005" c="SECTOR_EMPRESA">
                                            <td class="titulocaja" id="LIT_SECTOR_EMPRESA" colspan="1">
                                                <b><axis:alt f="axisfic005" c="SECTOR_EMPRESA" lit="89908133"/></b>
                                            </td>
                                        </axis:visible> 
                                                       
                                        <axis:visible f="axisfic005" c="TAMANO_EMPRESA">
                                            <td class="titulocaja" id="LIT_TAMANO_EMPRESA" colspan="1">
                                                <b><axis:alt f="axisfic005" c="TAMANO_EMPRESA" lit="89908134"/></b>
                                            </td>
                                        </axis:visible> 
                                        <!-- Cambio para IAXIS-15710 : End -->
                                    </tr>
                                    <tr>

                                        <!-- INI - 15895 - CJAD - 19/07/2021 - habilitar edicion de campo -->
                                                    <axis:visible f="axisfic005" c="NCAPFIN" >
                                                          <td class="campocaja" colspan="1">
                                                             <!-- POST-123 --><input type="numeric" class="campowidthinput campo camponumerico" id="NCAPFIN" name="NCAPFIN" size="15"
                                                             <axis:atr f="axisfic005" c="NCAPFIN" a="modificable=true"/>
                                                             <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>
                                                              title="<axis:alt f="axisfic005" c="NCAPFIN" lit="89906089"/>" style="width:100%" value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.NCAPFIN}'/>"/>
                                                          </td>                                                 
                                                    </axis:visible>
                                    <!-- FIN - 15895 - CJAD - 19/07/2021 - habilitar edicion de campo -->

                                        <!-- Cambio para IAXIS-15710 : Start -->
                                                    <axis:visible f="axisfic005" c="SECTOR_EMPRESA" >
                                                      <td class="campocaja" colspan="1">      
                                                        <select name="SECTOR_EMPRESA" id="SECTOR_EMPRESA" size="1" class="campowidthselect campo campotexto" style="width:90%;" 
                                                                title="<axis:alt f="axisfic005" c="SECTOR_EMPRESA" lit="89908133"/>"
                                                            
                                                                <axis:atr f="axisfic005" c="SECTOR_EMPRESA" a="obligatorio=false&modificable=true&isInputText=false"/> // INI TCS_MAMB POST89 tama�o
                                                                >&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfic005" c="C_SECTOR_EMPRESA" lit="1000348"/> - </option>    
                                                            <c:forEach var="element" items="${__formdata.listValores.lstSectorEmpresa}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.SECTOR_EMPRESA}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>            
                                                      </td>                                               
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="axisfic005" c="TAMANO_EMPRESA" >
                                                        <td class="campocaja" colspan="1">       
                                                        <select name="TAMANO_EMPRESA" id="TAMANO_EMPRESA" size="1" class="campowidthselect campo campotexto" style="width:90%;" 
                                                                title="<axis:alt f="axisfic005" c="TAMANO_EMPRESA" lit="89908134"/>"
                                                                <axis:atr f="axisfic005" c="TAMANO_EMPRESA" a="obligatorio=false&modificable=true&isInputText=false"/>
                                                                >&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfic005" c="C_TAMANO_EMPRESA" lit="1000348"/> - </option>    
                                                            <c:forEach var="element" items="${__formdata.listValores.lstTamanoEmpresa}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.TAMANO_EMPRESA}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>            
                                                        </td>                                                
                                                    </axis:visible>
                                        <!-- Cambio para IAXIS-15710 : End -->
                                    </tr>
                                    <!-- INI - TCS_3 - JLTS - 20/02/2018 - Se adicionan los parmetros ICUPOSV1, ICUPOGV1 y NCAPFINV1 -->
                                    <tr>
                                        <axis:visible f="axisfic005" c="ICUPOGV1">
                                            <td class="titulocaja" id="LIT_ICUPOGV1" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="ICUPOGV1" lit="3000010" /></b></td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfic005" c="ICUPOGV1">
                                            <!-- INI --IAXIS-15657 -- JLTS -- 09/06/2021. Se coloca un valor por defecto
                                        <td class="campocaja" colspan="1"><input type="numeric"
                                        class="campowidthinput campo camponumerico" id="ICUPOGV1"
                                        name="ICUPOGV1" size="15" readonly="readonly"
                                        <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if>
                                        title="<axis:alt f="axisfic005" c="ICUPOGV1" lit="2000084"/>"
                                        style="width: 100%"
                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.ICUPOGV1}'/>" />
                                        </td>
                                        -->
                                            <td class="toplinks"><a
                                                href="https://app.compliance.com.co/validador/login.html#/"
                                                target="_blank">
                                                    <div style="height: 100%; width: 100%">COMPLIANCE</div>
                                            </a></td>

                                            <!-- FIN --IAXIS-15657 -- JLTS -- 09/06/2021.-->
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfic005" c="ICUPOSV1">
                                            <td class="titulocaja" id="LIT_ICUPOSV1" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="ICUPOSV1" lit="3000011" /></b></td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfic005" c="ICUPOSV1">
                                            <!-- INI --IAXIS-15657 -- JLTS -- 09/06/2021. Se ajusta el tipo de numeric a text y se coloca un valor por defecto
                                        <td class="campocaja" colspan="1"><input type="numeric"
                                            class="campowidthinput campo camponumerico" id="ICUPOSV1"
                                            name="ICUPOSV1" size="15" readonly="readonly"
                                            <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if>
                                            title="<axis:alt f="axisfic005" c="ICUPOSV1" lit="2000085"/>"
                                            style="width: 100%"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.ICUPOSV1}'/>" />
                                        </td>
                                        -->
                                            <td class="toplinks"><a
                                                href="https://www.informacolombia.com/area-de-clientes/"
                                                target="_blank">
                                                    <div style="height: 100%; width: 100%">INFORMA</div>
                                            </a></td>
                                            <!-- FIN --IAXIS-15657 -- JLTS -- 09/06/2021.-->
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfic005" c="NCAPFINV1">
                                            <td class="titulocaja" id="LIT_NCAPFINV1" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="NCAPFINV1" lit="3000012" /></b></td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfic005" c="NCAPFINV1">
                                            <!-- INI --IAXIS-15657 -- JLTS -- 09/06/2021. Se ajusta el tipo de numeric a text y se coloca un valor por defecto
                                        <td class="campocaja" colspan="1"><input type="numeric"
                                            class="campowidthinput campo camponumerico" id="NCAPFINV1"
                                            name="NCAPFINV1" size="15" readonly="readonly"
                                            title="<axis:alt f="axisfic005" c="NCAPFINV1" lit="2000086"/>"
                                            style="width: 100%"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.NCAPFINV1}'/>" />
                                        </td>
                                     -->
                                            <td class="toplinks"><a
                                                href="https://sistemas.fasecolda.com/SISCONC/Login.aspx"
                                                target="_blank">
                                                    <div style="height: 100%; width: 100%">SISCONC</div>
                                            </a></td>
                                            <!-- FIN --IAXIS-15657 -- JLTS -- 09/06/2021.-->
                                        </axis:visible>
                                    </tr>
                                    <!-- FIN - TCS_3 - JLTS - 20/02/2018 - Se adicionan los parmetros ICUPOSV1, ICUPOGV1 y NCAPFINV1 -->
                                    <!-- INI - TCS_9998 IAXIS-2490 - 24/02/2019 -  JLTS - Se adicionan campos PNCONTPOL y PNANIOSVINC -->
                                    <tr class="blank_row">
                                        <td style="line-height: 20px;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfic005" c="NCONTPOL">
                                            <td class="titulocaja" id="LIT_NCONTPOL" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="NCONTPOL" lit="9908891" /></b></td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfic005" c="NCONTPOL">
                                            <td class="campocaja" colspan="1"><input type="numeric"
                                                class="campowidthinput campo camponumerico" id="NCONTPOL"
                                                name="NCONTPOL" size="15" readonly="readonly"
                                                title="<axis:alt f="axisfic005" c="NCONTPOL" lit="9908891"/>"
                                                style="width: 100%"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.NCONTPOL}'/>" />
                                            </td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfic005" c="NANIOSVINC">
                                            <td class="titulocaja" id="LIT_NANIOSVINC" colspan="1"><b><axis:alt
                                                        f="axisfic005" c="NANIOSVINC" lit="2000087" /></b></td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisfic005" c="NANIOSVINC">
                                            <td class="campocaja" colspan="1"><input type="numeric"
                                                class="campowidthinput campo camponumerico" id="NANIOSVINC"
                                                name="NANIOSVINC" size="15" readonly="readonly"
                                                title="<axis:alt f="axisfic005" c="NANIOSVINC" lit="2000087"/>"
                                                style="width: 100%"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.NANIOSVINC}'/>" />
                                            </td>
                                        </axis:visible>
                                        <!-- FIN - TCS_9998 IAXIS-2490 - 24/02/2019 -  JLTS - Se adicionan campos PNCONTPOL y PNANIOSVINC -->
                                    </tr>
                                </td>
                            </tr>
                         </c:if>
                       </axis:visible>
                    </table>
                </td>
            </tr>
        </table>            
<!-- POST-123 -->
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisfic005</c:param><c:param name="f">axisfic005</c:param> 
            <%-- <c:param name="__botones"><c:if test="${__formdata.CMODO != 1}"> cancelar,9000554,9909412,aceptar,</c:if><c:if test="${__formdata.CMODO == 1}">salir</c:if> </c:param>
                 <c:param name="__botones">cancelar,9000554,9909412,aceptar,salir</c:param> --%>
         <%--POST 134
            <c:param name="__botones"><axis:visible f="axisfic005" c="but_9909412">,9909412</axis:visible><axis:visible f="axisfic005" c="but_9000554">,9000554</axis:visible>,cancelar,aceptar,salir</c:param> 
         --%>
         <c:param name="__botones"><axis:visible f="axisfic005" c="but_9909412">,9909412</axis:visible><axis:visible f="axisfic005" c="but_9000554">,9000554</axis:visible>,cancelar,<axis:visible f="axisfic005" c="but_aceptar">,aceptar</axis:visible>,salir</c:param><%--POST-213--%>           
        </c:import>
    </form>
    <%-- <c:if test="${__formdata.CMODO != '1'}"> --%> 
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FCUPO",
                ifFormat       :    "%d/%m/%Y",
                button         :    "icon_FCUPO", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField     :    "FCUPOS",
                ifFormat       :    "%d/%m/%Y",
                button         :    "icon_FCUPOS", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
    <%-- </c:if> --%>
     <!-- POST-123 -->
        <c:import url="../include/mensajes.jsp" />
</div>
    </body>    

</html>
