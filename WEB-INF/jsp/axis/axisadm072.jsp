<%--/**
*  Fichero: axisadm072.jsp
*  Pantalla de generaciones de domiciliaciones de recibos.
*
*  Fecha: 25/06/2012
*/
--%>
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
        <title><axis:alt f="axisadm072" c="TITLE" lit="9001844"/></title> <!--Gestió Transferències-->
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
    
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
        
            function f_onload() {
               
               f_cargar_propiedades_pantalla();
            
               SALIR = "${__formdata.SALIR}";
               if (!objUtiles.estaVacio(SALIR) ){
                    objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm072", "cancelar", document.miForm, "_self");
               }
               
               
               var matriculas = "";
                <c:if test="${!empty __formdata.matriculas}">
                    transferencias = "NO_VACIO";
                </c:if> 
                
               var valor = document.miForm.NMATRIC_cerca.value;
               if (objUtiles.estaVacio(valor) ){
                    objUtiles.abrirModal("axisadm071","src","modal_axisadm071.do?operation=init");
               }
                
               
                f_cargar_propiedades_pantalla();
            }
            
            
            function f_but_salir() {
            	//objUtiles.ejecutarFormulario ("axis_axisadm072.do", "salir", document.miForm, "_self", objJsMessages.jslit_cargando);    
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm072", "cancelar", document.miForm, "_self");
            } 

            function f_buscar_transferencias (CEMPRES, CAGRUP,CRAMO,SPRODUC,
                FABONOINI,FABONOFIN,FTRANSINI,FTRANSFIN,CTRANSFERIDOS,tipos,NREMESA, origen){
                objUtiles.cerrarModal("axisadm071");
                 document.miForm.CEMPRES_cerca.value = CEMPRES;
                 document.miForm.CAGRUP_cerca.value = CAGRUP;
                 document.miForm.CRAMO_cerca.value = CRAMO;
                 document.miForm.SPRODUC_cerca.value = SPRODUC;
                 document.miForm.FABONOINI_cerca.value = FABONOINI;
                 document.miForm.FABONOFIN_cerca.value = FABONOFIN;
                 document.miForm.FTRANSINI_cerca.value = FTRANSINI;
                 document.miForm.FTRANSFIN_cerca.value = FTRANSFIN;
                
                 document.miForm.CTRANSFERIDOS_cerca.value = CTRANSFERIDOS;
                 document.miForm.tipos_cerca.value = tipos;
                 document.miForm.NREMESA_cerca.value = NREMESA;
                 document.miForm.NREMESA.value = NREMESA;
                 document.miForm.VNREMESA.value = NREMESA;

                 objUtiles.ejecutarFormulario ("axis_axisadm072.do?origen="+origen, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);    
             }
    
            
            
            function f_abrir_axisadm071(){
                  objUtiles.abrirModal("axisadm071","src","modal_axisadm071.do?operation=init&PARAMS=");
            }
            
            function f_cerrar_axisadm071(){
                objUtiles.cerrarModal("axisadm071");
                //f_but_salir();
            }

           

        /****************************************************************************************/
        /************************************** DETALLE *****************************************/
        /****************************************************************************************/
        
            function mostrar(nombreCapa,nombreDIV){ 
                objUtiles.scrollPoll(nombreCapa,nombreDIV);
            } 
    
            function ocultar(nombreCapa){ 
            document.getElementById(nombreCapa).style.visibility="hidden"; 
            }   
            
            function f_canviar_agrup(vremesa,vccc){
                //alert(vremesa+'#'+vccc);
                document.miForm.VNREMESA.value = vremesa;
                document.miForm.VCCC.value = vccc;
                objUtiles.ejecutarFormulario ("axis_axisadm072.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            
        /* ********************************************************************************** */
        /* ************************************ CARGAR DATOS ******************************** */
        /* ********************************************************************************** */
        
        function f_aceptar_axisadm071(NMATRIC){
              f_cerrar_axisadm071();
              document.miForm.NMATRIC_cerca.value = NMATRIC;
              objUtiles.ejecutarFormulario ("axis_axisadm072.do", "consultar", document.miForm, "_self", objJsMessages.jslit_cargando);    
        }

        </script>
    </head>
 
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="tipos_cerca" id="tipos_cerca" value="${__formdata.tipos_cerca}"/>
            <input type="hidden" name="CEMPRES_cerca" id="CEMPRES_cerca" value="${__formdata.CEMPRES_cerca}"/>
            <input type="hidden" name="NMATRIC_cerca" id="NMATRIC_cerca" value="${__formdata.NMATRIC_cerca}"/>
        
        
            <c:import url="../include/titulo_nt.jsp">
                    <c:param name="titulo"><axis:alt f="axisadm072" c="TITLE" lit="9902717" /> - <axis:alt f="axisadm072" c="TITLE" lit="9903345" /></c:param>
                    <c:param name="formulario"></c:param>
                    <c:param name="form">axisadm072</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisadm072" c="TIT072" lit="9903345" /></c:param>
                <c:param name="nid" value="axisadm071" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisadm072" c="TITIMP" lit="1000205" />|true</c:param>
            </c:import>      
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>     
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm072" c="CONSULTA_MATRICULAS" lit="9903345"/> 
                        <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisadm071()" style="cursor:pointer"/>
                        </div>
                
                        <table class="seccion">
                            <tr>
                                <td>
                                
                                    <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>
                               
                                    
                                    <!-- Campos cabcera -->
                                    
                                     <tr>
                                        <axis:ocultar f="axisadm072" c="TEMPRES" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm072" c="TEMPRES" lit="101619"/></b> <%-- Empresa --%>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm072" c="NNUMNIF" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm072" c="NNUMNIF" lit="9903661"/> </b> <%-- Documento --%>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm072" c="TPAGADOR" dejarHueco="false">     
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisadm072" c="TPAGADOR" lit="101028"/>/<axis:alt f="axisadm072" c="ASEGURADO" lit="101027"/> </b> <%-- Asegurado/Tomador --%>
                                        </td>                            
                                        </axis:ocultar>
                                     </tr>
                                    
                                     <tr>
                                        <td class="campocaja">  
                                            <input type="text" class="campowidthinput campo" size="15"   value="${__formdata.TEMPRES}" <axis:atr f="axisadm072" c="TEMPRES" a="modificable=false"/>  name="TEMPRES" id="TEMPRES"/>
                                        </td>
                                        
                                        <td class="campocaja">  
                                            <input type="text" class="campowidthinput campo" size="15"   value="${__formdata.NNUMNIF}" <axis:atr f="axisadm072" c="NNUMNIF" a="modificable=false"/> name="NNUMNIF" id="NNUMNIF"/>
                                        </td>
                                        
                                        <td class="campocaja" colspan="2">  
                                            <input type="text" class="campowidthinput campo" size="15"   value="${__formdata.TPAGADOR}" <axis:atr f="axisadm072" c="TPAGADOR" a="modificable=false"/> name="TPAGADOR" id="TPAGADOR"/>
                                        </td>
                                     </tr>
                                   
                                    
                                     <tr>
                                        <axis:ocultar f="axisadm072" c="NMATRIC" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm072" c="NMATRIC" lit="9001045"/></b> <%-- Matrícula --%>
                                        </td>
                                        </axis:ocultar>
                                      
                                        <td class="titulocaja" colspan="3">
                                            <b><axis:alt f="axisadm072" c="TESTADO" lit="101510"/> </b> <%-- Estado --%>
                                        </td>
                                     </tr>
                                     
                                     <tr>
                                        <td class="campocaja">  
                                            <input type="text" class="campowidthinput campo" size="100"   value="${__formdata.NMATRIC_cerca}" <axis:atr f="axisadm072" c="NMATRIC" a="modificable=false"/> name="NMATRIC" id="NMATRIC"/>
                                        </td>
                                        
                                        <td class="campocaja">  
                                            <input type="text" class="campowidthinput campo" size="15"   value="${__formdata.TESTADO}" <axis:atr f="axisadm072" c="TESTADO" a="modificable=false"/> name="TESTADO" id="TESTADO"/>
                                        </td>
                                    </tr>
                    
                                    
                                    <tr>
                                        <axis:ocultar f="axisadm072" c="TCOBBAN" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm072" c="TCOBBAN" lit="100879"/></b> <%-- Cobrador bancario --%>
                                        </td>
                                        </axis:ocultar>
                                       
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm072" c="CBANCAR" lit="100965"/> </b> <%-- Cuenta bancaria --%>
                                        </td>
                                        
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm072" c="TTIPO" lit="9001200"/> </b> <%-- Tipo cuenta --%>
                                        </td>
                                        
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm072" c="TBANCO" lit="9000964"/> </b> <%-- Banco --%>
                                        </td>
                                     </tr>
                                     
                                     <tr>
                                        <td class="campocaja">  
                                            <input type="text" class="campowidthinput campo" size="15"  <axis:atr f="axisadm072" c="TCOBBAN" a="modificable=false"/>  value="${__formdata.TCOBBAN}" name="TCOBBAN" id="TCOBBAN"/>
                                        </td>
                                        
                                        <td class="campocaja">  
                                            <input type="text" class="campowidthinput campo" size="15"  <axis:atr f="axisadm072" c="CBANCAR" a="modificable=false"/> value="${__formdata.CBANCAR}" name="CBANCAR" id="CBANCAR"/>
                                        </td>
                                        
                                        <td class="campocaja">  
                                            <input type="text" class="campowidthinput campo" size="15"  <axis:atr f="axisadm072" c="TTIPO" a="modificable=false"/>  value="${__formdata.TTIPO}" name="TTIPO" id="TTIPO"/>
                                        </td>
                                        
                                        <td class="campocaja">  
                                            <input type="text" class="campowidthinput campo" size="15"  <axis:atr f="axisadm072" c="TBANCO" a="modificable=false"/>  value="${__formdata.TBANCO}" name="TBANCO" id="TBANCO"/>
                                        </td>
                                    </tr>
                                    
                                    
                                    </table>
                                  </td>
                            </tr>
                        </table>  <!-- Fin de sección datos cabecera -->
                                 
                    
                        <div class="separador">&nbsp;</div>     
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm072" c="MOV_MATRICULAS" lit="9903860"/> 
                        </div>
                                            
                        <table class="seccion">
                            <tr>
                                <td>
                                
                                    <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>
                                    
                                    
                                    
                                    </table>
                                    
                                    <div class="separador">&nbsp;</div>
                                    
                                    <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>
                                
                                    <tr>
                                        <td class = "campocaja" colspan="5" >
                                          
                                            <c:set var="title0"><axis:alt f="axisadm072" c="NPOLIZA" lit="800242"/></c:set>
                                            <c:set var="title1"><axis:alt f="axisadm072" c="NRECIBO" lit="111838"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisadm072" c="FEFEC_REC" lit="9902085"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisadm072" c="TESTADO_REC" lit="1000553"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisadm072" c="SUBEST_REC" lit="102104"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisadm072" c="REMESA_PRE" lit="9903857"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisadm072" c="ESTADO_PRE" lit="9903858"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisadm072" c="FENVIO" lit="9903593"/></c:set>
                                            <c:set var="title8"><axis:alt f="axisadm072" c="FRESPUESTA" lit="9903852"/></c:set>
                                            <c:set var="title9"><axis:alt f="axisadm072" c="RESPUESTA" lit="9903853"/></c:set>
                                            <c:set var="title10"><axis:alt f="axisadm072" c="ARX_ENVIO" lit="9903855"/></c:set>
                                            <c:set var="title11"><axis:alt f="axisadm072" c="ARX_RESPTA" lit="9903854"/></c:set>
                                            
                                         
                                            <div class="displayspaceGrande" id="MOVS_MATRICULA">
                                            
                                                <display:table name="${__formdata.MOV_MATRICULAS}" id="miListaId" style="width:98%;" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                 requestURI="axis_axisadm072.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                    <%--display:column title="" sortable="false" headerClass="sortable fixed"  media="html" autolink="false" >    
                                                        <div class="dspIcons"><input <c:if test="${(__formdata.VNREMESA==miListaId.NREMESA) && (__formdata.VCCC==miListaId.CCC)}">checked="checked"</c:if> type="radio" id="selected" onclick="javascript:f_canviar_agrup('${miListaId.NREMESA}','${miListaId.CCC}')" name="selected" /></div>
                                                    </display:column--%>
                                                    <display:column title="${title0}" sortable="true"  sortProperty="NPOLIZA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                         <div class="dspText">${miListaId.NPOLIZA}</div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="NRECIBO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                         <div class="dspText">${miListaId.NRECIBO}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true"  sortProperty="FEFECTO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                         <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FEFECTO}"/></div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true"  sortProperty="TESTADO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                         <div class="dspText">${miListaId.TESTREC}</div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true"  sortProperty="SUBESTADO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                         <div class="dspText">${miListaId.SUBESTADO}</div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true"  sortProperty="SPROCES" headerClass="sortable fixed"  media="html" autolink="false" >
                                                         <div class="dspText">${miListaId.SPROCES}</div>
                                                    </display:column>
                                                    <display:column title="${title6}" sortable="true"  sortProperty="TESTADO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                         <div class="dspText">${miListaId.TESTADO}</div>
                                                    </display:column>
                                                    <display:column title="${title7}" sortable="true"  sortProperty="FENVIO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                         <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FENVIO}"/></div>
                                                    </display:column>
                                                    <display:column title="${title8}" sortable="true"  sortProperty="FENVIO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                         <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FFILEDEV}"/></div>
                                                    </display:column>
                                                    <display:column title="${title9}" sortable="true"  sortProperty="CNOTERR" headerClass="sortable fixed"  media="html" autolink="false" >
                                                         <div class="dspText">${miListaId.CNOTERR}</div>
                                                    </display:column>
                                                    <display:column title="${title10}" sortable="true" style="width:55%;" sortProperty="TFILEENV" headerClass="sortable fixed"  media="html" autolink="false" >
                                                         <div class="dspText">${miListaId.TFILEENV}</div>
                                                    </display:column>
                                                    <display:column title="${title11}" sortable="true" style="width:55%;" sortProperty="TFILEDEV" headerClass="sortable fixed"  media="html" autolink="false" >
                                                         <div class="dspText">${miListaId.TFILEDEV}</div>
                                                    </display:column>
                                                    
                                                    <%--display:column title="${title2}" sortable="true" style="width:20%;" sortProperty="IIMPORT" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.IIMPORT}"/></div>    
                                                    </display:column --%>
                                                </display:table>
                                            </div>
                                        </td>
                                    </tr>
                          

                               
                                </td>
                            </tr>
                        </table>
                   </td>
                </tr>
            </table>
            
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm072</c:param><c:param name="f">axisadm072</c:param>
            <c:param name="f">axisadm072</c:param>
            <c:param name="__botones">salir<c:if test="${__formdata.CTRANSFERIDOS_cerca == 0}">,105488</c:if><c:if test="${__formdata.CTRANSFERIDOS_cerca == 1}">,9901004</c:if><c:if test="${__formdata.CTRANSFERIDOS_cerca == 2}">,102803</c:if></c:param>
        </c:import>
                
        </form>

        <script type="text/javascript">
            <axis:ocultar f="axisadm072" c="FABONO" dejarHueco="false">
            Calendar.setup({
                inputField     :    "FABONO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FABONO", 
                singleClick    :    true,
                firstDay       :    1
            });
            </axis:ocultar>
        </script>
    
        <c:import url="../include/mensajes.jsp"/>
    
    </body>
  <% System.out.println("*************************************************************** 0"); %> 
</html>