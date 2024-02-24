<%/**
*  Fichero: axisadm056.jsp
*  @author <a href = "mailto:icanada@csi-ti.com">Ivan Canada</a>  
*	Calculo de la cuenta del activo y del pasivo	
*  Fecha: 15/09/2010
*/


%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><fmt:message key="100681"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload(){
                f_cargar_propiedades_pantalla();       
                
                <c:if test="${empty sessionScope.listaCuadros}">
                    <c:if test="${empty __formdata.LINK_INFORME}">                
                        var ok = "${__formdata.OK}";        
                        if (objUtiles.estaVacio(ok)){
                                f_abrir_axisadm055();
                        }
                    </c:if>               
                </c:if>
            }            
            
            function f_cargar_propiedades_pantalla(){
                f_cargapropietatexpander();
                f_cargar_valores_defecto();
                objDependencias.modificarPropiedadesSegunModificableYVisible();
                f_carga_dependencias();
                revisarEstilos();
            }
          
            
            function f_but_anterior() {
            }
           
            function f_but_cancelar() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm054", "cancelar", document.miForm, "_self");                  
                
            }
            
            function f_formatdate(entrada,title){
             var jDate = new JsFecha();
                if(entrada.value.length>0){
                    entrada.value=jDate.formateaFecha(entrada.value);
                
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        alert("<fmt:message key="1000421"/>");
                    }
                }
            }       
            
            
            function f_but_buscar(CEMPRES,SPRODUC,NPOLIZA,NCERTIF,FVAL_BUS,CRAMO){                
                f_cerrar_axisadm055();
                objDom.setValorPorId("FVALORA",FVAL_BUS);
                objDom.setValorPorId("CEMPRES",CEMPRES);
                objDom.setValorPorId("SPRODUC",SPRODUC);
                objDom.setValorPorId("CRAMO",CRAMO);
                objDom.setValorPorId("NPOLIZA",NPOLIZA);
                objDom.setValorPorId("NCERTIF",NCERTIF);
                objDom.setValorPorId("LINK_INFORME",'');
                objDom.setValorPorId("LINK_INFORME2",'');                
                var params = "?FVAL_BUS="+FVAL_BUS;
                objUtiles.ejecutarFormulario("axis_axisadm056.do"+params, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);                
            }
            
            
            function f_imprimir_fitxer(pfitxer){            
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?mantenerExtension=mantenerExtension&mimetype="+escape("text/xml")+"&operation=tunnel&file="+pfitxer,600,200);
            }  
            
            
            function f_but_9000569(){                      
                 var FVAL_BUS = objDom.getValorPorId("FVALORA");                 
                 objUtiles.ejecutarFormulario("axis_axisadm056.do?FVAL_BUS="+FVAL_BUS, "montar_fichero", document.miForm, "_self", objJsMessages.jslit_cargando);                               
            }

            /*******************************************************************************************/
            /***************************************** MODAL *******************************************/
            /*******************************************************************************************/
            function f_cerrar_axisadm055()
            {
                objUtiles.cerrarModal("axisadm055");
            }
            
            function f_abrir_axisadm055(){
                objUtiles.abrirModal("axisadm055", "src", "modal_axisadm055.do?operation=form"); 
            }
            
            
            function f_cerrar_axisadm059()
            {
                objUtiles.cerrarModal("axisadm059");
            }
            
        
            
        </script>
        
       
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="f">axisadm056</c:param>
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="9901476" /></c:param>
                <c:param name="nid" value="axisctr056" />
        </c:import>
        <input type="hidden" name="operation"/>     
        <input type="hidden" name="INDICE" id="INDICE"  value="${__formdata.INDICE}"/>
        <input type="hidden" name="CEMPRES" id="CEMPRES"  value="${__formdata.CEMPRES}"/>
        <input type="hidden" name="SPRODUC" id="SPRODUC"  value="${__formdata.SPRODUC}"/>
        <input type="hidden" name="CRAMO" id="CRAMO"  value="${__formdata.CRAMO}"/>
        <input type="hidden" name="NPOLIZA" id="NPOLIZA"  value="${__formdata.NPOLIZA}"/>
        <input type="hidden" name="NCERTIF" id="NCERTIF"  value="${__formdata.NCERTIF}"/>
        
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><fmt:message key="9901475" /></c:param>
                <c:param name="formulario"><fmt:message key="9901475" /></c:param>
                <c:param name="form">axisadm056</c:param>
        </c:import>
        
         <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><fmt:message key="9901474" /></c:param>
            <c:param name="nid" value="axisadm055" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><fmt:message key="9901531" /></c:param>
            <c:param name="nid" value="axisadm059" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
           <c:param name="nid_y_titulo">axisimprimir|<fmt:message key="1000205" />|true</c:param>
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

    <!-- Area de campos  -->
    <div class="separador">&nbsp;</div>
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0"> 
        <tr>
          <td>
            <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="9901475" />
            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisadm055()" style="cursor:pointer"/> </div>
                                                  
            <!--campos-->
             <table class="seccion">
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
                               <axis:ocultar f="axisadm056" c="FVALORA"> 
                                    <td class="titulocaja" ><!-- PÓLIZA -->
                                         <b><axis:alt f="axisadm057" c="FVALORA" lit="105957"></axis:alt></b>                                                                          
                                    </td>
                                </axis:ocultar>                                  
                             </tr>
                             <tr>
                                <%-- Fecha Valoración --%>
                                <axis:ocultar f="axisadm056" c="FVALORA"> 
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15"                                               
                                                    value="<fmt:formatDate value='${__formdata.FVALORA}' pattern='dd/MM/yyyy'/>" name="FVALORA" id="FVALORA" onblur="javascript:f_formatdate(this,'')"
                                                    style="width:40%;" alt="<fmt:message key="105957"/>" title="<fmt:message key="105957"/>"
                                                    <axis:atr f="axisadm054" c="FVALORA" a="formato=fecha&modificable=false"/> />
                                    </td>                             
                                </axis:ocultar>
                             </tr>
                              
                            
                              
                             <%-- Resultado --%>
                              <tr id="Lista_detalle" >    
                                <td colspan="4"> 
                                          <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="111046" /></div>
                                          <c:set var="title0"><fmt:message key="9001875"/></c:set>  <%-- Póliza --%>
                                          <c:set var="title1"><fmt:message key="1000590"/></c:set>   <%-- Fecha Valor --%>
                                          <c:set var="title2"><fmt:message key="9901468"/></c:set>   <%-- Interes Futuro --%>
                                          <c:set var="title3"><fmt:message key="9901469"/></c:set>   <%-- Porc. Credibilidad --%>
                                          <c:set var="title4"><fmt:message key="107120"/></c:set>   <%-- Provisión Matematica --%>
                                          <c:set var="title5"><fmt:message key="152270"/></c:set>   <%-- Fecha Vencimiento Estimada --%>
                                          <c:set var="title6"><fmt:message key="152271"/></c:set>   <%-- Proyección --%>
                                          <!-- Valores de columnas -->
                                          <div class="displayspaceGrande">                                             
                                            <display:table name="${__formdata.axisctr_listadetalle}" id="miListaId" export="false" style="width:98.5%;" class="dsptgtable" 
                                            pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                            requestURI="axis_axisadm056.do?operation=form&paginar=true">
                                              <%@ include file="../include/displaytag.jsp"%>
                                               <!--Npoliza -->
                                              <axis:visible f="axisadm056" c="NPOLIZA"> 
                                                  <display:column title="${title0}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                    <div class="dspText">${miListaId.NPOLIZA}</div>
                                                  </display:column>   
                                              </axis:visible>                                                
                                              <!-- Fvalorea -->
                                             <axis:visible f="axisadm056" c="NPOLIZA"> 
                                                 <display:column title="${title1}" sortable="true" sortProperty="FVALORA" headerClass="sortable fixed"  media="html" autolink="false" >                                                                                       
                                                    <div class="dspDate"><fmt:formatDate value="${miListaId.FVALORA}" pattern="dd/MM/yyyy"/></div>                                                
                                                  </display:column>
                                              </axis:visible>
                                              <!-- Interes a Futuro -->
                                              <axis:visible f="axisadm056" c="PINTFUT"> 
                                                  <display:column title="${title2}" sortable="true" sortProperty="PINTFUT" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                    <div class="dspNumber"><fmt:formatNumber value="${miListaId.PINTFUT}" pattern="###,##0.00"/></div>                                                
                                                  </display:column>
                                              </axis:visible>    
                                              <!-- Credibilidad -->
                                              <axis:visible f="axisadm056" c="PCREDIBI"> 
                                                  <display:column title="${title3}" sortable="true" sortProperty="PCREDIBI" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                    <div class="dspNumber"><fmt:formatNumber value="${miListaId.PCREDIBI}" pattern="###,##0.00"/></div>                                                
                                                  </display:column>
                                              </axis:visible>
                                              <!-- Prov. Matematica -->
                                              <axis:visible f="axisadm056" c="IPROMAT"> 
                                                  <display:column title="${title4}" sortable="true" sortProperty="IPROMAT" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                    <div class="dspNumber"><fmt:formatNumber value="${miListaId.IPROMAT}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>                                                
                                                  </display:column>                                               
                                              </axis:visible>
                                            <!-- Data Venciment Estimada -->   
                                              <axis:visible f="axisadm056" c="FVENEST"> 
                                                  <display:column title="${title5}" sortable="true" sortProperty="FVENEST" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                    <div class="dspDate"><fmt:formatDate value="${miListaId.FVENEST}" pattern="dd/MM/yyyy"/></div>                                                
                                                  </display:column>
                                              </axis:visible>    
                                              <!-- Proyección -->
                                              <axis:visible f="axisadm056" c="IPROYEC"> 
                                                  <display:column title="${title6}" sortable="true" sortProperty="IPROYEC" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                    <div class="dspNumber"><fmt:formatNumber value="${miListaId.IPROYEC}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>                                                
                                                  </display:column>  
                                              </axis:visible>
                                            </display:table>
                                          </div>  
                                          
                                <div class="separador">&nbsp;</div>
                                </td>
                            </tr>
                            
                             <!-- Seccion 4 Informes-->
                            <div class="separador">&nbsp;</div>
                            <table class="area" align="center">  
                                     <tr>
                                            <th style="width:50%;height:0px"></th>        
                                            <th style="width:50%;height:0px"></th>
                                     </tr>       
                                     <c:if test="${!empty __formdata.LINK_INFORME || !empty __formdata.LINK_INFORME2}">
                                        <tr>
                                            <axis:ocultar f="axisadm056" c="LINKS" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b id="label_LINKS"><fmt:message key="107913"/></b> <%-- Links fitxers generats --%>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                    </c:if>                                       
                                    <c:if test="${!empty __formdata.LINK_INFORME}">                                   
                                        <tr>
                                            <axis:ocultar f="axisadm056" c="LINK_INFORME" dejarHueco="false">
                                                <td class="campocaja" id="fichero">
                                                      <input type="text" readonly 
                                                   style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                   onclick="javascript:f_imprimir_fitxer(this.value)" class="campowidthinput campo campotexto_ob" size="15"  name="LINK_INFORME" id="LINK_INFORME"
                                                   title="<fmt:message key="107913"/>" value="${__formdata.LINK_INFORME}"/>                                                                                                        
                                                </td>                                          
                                            </axis:ocultar>
                                            <td>                                            
                                        </tr>
                                       </c:if> 
                                       <c:if test="${!empty __formdata.LINK_INFORME2}">   
                                        <tr>
                                            <axis:ocultar f="axisadm056" c="LINK_INFORME2" dejarHueco="false">
                                                <td class="campocaja" id="fichero">
                                                      <input type="text" readonly 
                                                   style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                   onclick="javascript:f_imprimir_fitxer(this.value)" class="campowidthinput campo campotexto_ob" size="15"  name="LINK_INFORME2" id="LINK_INFORME2"
                                                   title="<fmt:message key="107913"/>" value="${__formdata.LINK_INFORME2}"/>                                                                                                        
                                                </td>                                          
                                            </axis:ocultar>
                                            <td>                                            
                                        </tr>
                                    </c:if>
                                </table>
                             
                    </table>
            </table>    
    </table>
    
    <%--<c:param name="__botones">cancelar<c:if test="${__formdata.CESTADO == 1 || __formdata.CMODO == 'NVIGEN'}">,aceptar</c:if></c:param>--%>
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="__botones">cancelar,9000569</c:param>
    </c:import>
</form>



<c:import url="../include/mensajes.jsp" />
</body>
</html>

