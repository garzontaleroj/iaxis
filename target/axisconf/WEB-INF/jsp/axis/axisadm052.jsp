<%/*
*  Fichero: axisadm052.jsp
*
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
    <title><axis:alt c="titulo" f="axisadm052" lit="9901113"/></title> <%-- Resultado contabilidad diaria --%>
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
            var hayErrores    = ${!empty requestScope.__mensajes.m__clave};           
            if (${empty LISTA_CONT} && !hayErrores && objUtiles.estaVacio(objDom.getValorPorId("FLAG")))         
            {
                f_but_buscar();     
                objDom.setValorPorId("FLAG","1");
            }
        }        
        
        
         function f_aceptar_axisamd051(traspaso_check,CEMPRES,FCONTABINI,FCONTABFIN,FTRASPASINI,FTRASPASFIN,FADMININI,FADMINFIN) {
            objUtiles.cerrarModal("axisadm051");            
            objDom.setValorPorId("traspaso_check", traspaso_check);
            objDom.setValorPorId("CEMPRES_RECERCA", CEMPRES);
            objDom.setValorPorId("FCONTABINI", FCONTABINI);
            objDom.setValorPorId("FCONTABFIN", FCONTABFIN);
            objDom.setValorPorId("FTRASPASINI", FTRASPASINI);
            objDom.setValorPorId("FTRASPASFIN", FTRASPASFIN);
            objDom.setValorPorId("FADMININI", FADMININI);
            objDom.setValorPorId("FADMINFIN", FADMINFIN);
            objUtiles.ejecutarFormulario("axis_axisadm052.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm052", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            f_abrir_modal("axisadm051");
        }
        
        function f_montar_fichero(){
            <c:if test="${!empty LISTA_CONT}">
            objUtiles.ejecutarFormulario("axis_axisadm052.do", "montar_fichero", document.miForm, "_self", objJsMessages.jslit_cargando);
            //alert("bien");
            </c:if>
            <c:if test="${empty LISTA_CONT}">
            alert("<axis:alt c="alerfich" f="axisadm052" lit="9901229"/>");
            </c:if>
        }
        
        function f_traspasar(){
        	<c:if test="${!empty LISTA_CONT}">
            objUtiles.ejecutarFormulario("axis_axisadm052.do", "traspasar", document.miForm, "_self", objJsMessages.jslit_cargando);
          </c:if>
          <c:if test="${empty LISTA_CONT}">
          alert("<axis:alt c="alertras" f="axisadm052" lit="9901229"/>");
          </c:if>
        }
        
        function f_contabiliza_diario(){
            objUtiles.ejecutarFormulario("axis_axisadm052.do", "contabiliza_diario", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        
        function f_desglose_contab_dia(CEMPRES,FCONTAB,CCUENTA,NLINEA,NASIENT,CPAIS,CPROCES,FEFEADM){
            //alert("CEMPRES : "+CEMPRES);
            //alert("FCONTAB : "+FCONTAB);
            //alert("CCUENTA : "+CCUENTA);
            
            
            
            var FCONTABINI = objDom.getValorPorId("FCONTABINI");
            var FCONTABFIN = objDom.getValorPorId("FCONTABFIN");
            
            var params = "&CEMPRES="+CEMPRES+"&FCONTAB="+FCONTAB+"&CCUENTA="+CCUENTA+"&FCONTABINI="+FCONTABINI+"&FCONTABFIN="+FCONTABFIN+"&NLINEA="+NLINEA+"&CPAIS="+CPAIS+"&CPROCES="+CPROCES+"&FEFEADM="+FEFEADM+"&NASIENT="+NASIENT;            

            
            //alert(FCONTABINI);
            f_abrir_modal("axisadm053",null,params);        
        }
        
        
         function f_cerrar_axisadm053(){
            objUtiles.cerrarModal("axisadm053");
            //objUtiles.ejecutarFormulario("axis_axisadm004.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
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
        
        function f_cerrar_axisadm051() {
            objUtiles.cerrarModal("axisadm051");
        }
        
         function f_imprimir_fitxer(pfitxer){
            objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?mantenerExtension=mantenerExtension&mimetype="+escape("text/xml")+"&operation=tunnel&file="+pfitxer,600,200);
        }  
        
        function thiss(thiss){
            thiss.value = f_formatdate(thiss);
        }
        
        function f_formatdate(entrada){
            var jDate = new JsFecha();
            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    entrada.value = '';//alert('Formato fecha incorrecto para el campo '+ title);
                }
        }
         return entrada.value;
        }
       
        
        
        function f_clear_filter()
        {
            $("#CCUENTA").val("");
            $("#CPROCES").val("");
            objUtiles.ejecutarFormulario("axis_axisadm052.do", "filtrar_buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_send_filter()
        {
            objUtiles.ejecutarFormulario("axis_axisadm052.do", "filtrar_buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt c="titulo" f="axisadm052" lit="9901113"/></c:param>     <%-- Resultado contabilidad diaria --%>
                <c:param name="formulario"><axis:alt c="form" f="axisadm052" lit="9901113"/></c:param> <%-- Resultado contabilidad diaria --%>
                <c:param name="form">axisadm052</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo"> 
                axisadm051|<axis:alt c="titulo51" f="axisadm052" lit="9901134"/>#axisadm053|<axis:alt c="titulo53" f="axisadm052" lit="9901435"/>
                <%-- Buscador de contabilidad --%>
            </c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
           <c:param name="nid_y_titulo">axisimprimir|<axis:alt c="tituloImpr" f="axisadm052" lit="1000205" />|true</c:param>
        </c:import>
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="traspaso_check" name="traspaso_check" value="${__formdata.traspaso_check}"/>
        <input type="hidden" id="CEMPRES_RECERCA" name="CEMPRES_RECERCA" value="${__formdata.CEMPRES_RECERCA}"/>
        <input type="hidden" id="FLAG" name="FLAG" value="${__formdata.FLAG}"/>
        <input type="hidden" id="FCONTABINI" name="FCONTABINI" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTABINI}"/>"/>
        <input type="hidden" id="FCONTABFIN" name="FCONTABFIN" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTABFIN}"/>"/>
        <input type="hidden" id="FTRASPASINI" name="FTRASPASINI" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FTRASPASINI}"/>"/>
        <input type="hidden" id="FTRASPASFIN" name="FTRASPASFIN" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FTRASPASFIN}"/>"/>
        <input type="hidden" id="FADMININI" name="FADMININI" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FADMININI}"/>"/>
        <input type="hidden" id="FADMINFIN" name="FADMINFIN" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FADMINFIN}"/>"/>
                
     
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt c="flecha1" f="axisadm052" lit="9901113"/><%-- Detalle --%> &nbsp; ${resumen} &nbsp; <img border="0" src="images/find.gif" onclick="f_but_buscar()" style="cursor:pointer" alt="<axis:alt c="flecha2" f="axisadm052" lit="9000508"/>" title="<axis:alt c="flecha3" f="axisadm052" lit="9000508"/>"/></div>                    
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <axis:visible f="axisadm052" c="FILTER_LISTA_CONT" > 
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td class="titulocaja">
                                                        <b><axis:alt c="CCUENTA" f="axisadm052" lit="9000533"/></b>
                                                    </td>
                                                    <td class="titulocaja">
                                                        <b><axis:alt c="CPROCES" f="axisadm052" lit="1000576"/></b>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" value="${__formdata.CCUENTA}" name="CCUENTA" id="CCUENTA" size="15"/>
                                                    </td>
                                                    <td class="campocaja">
                                                        <input type="text" class="campo campotexto" value="${__formdata.CPROCES}" name="CPROCES" id="CPROCES" size="15"/>
                                                    </td>
                                                    <td>
                                                        <input type="button" class="boton" value="<axis:alt c="SEARCH" f="axisadm052" lit="9000508"/>" onclick="f_send_filter()">
                                                        <input type="button" class="boton" value="<axis:alt c="CLEAN" f="axisadm052" lit="9000440"/>" onclick="f_clear_filter()">
                                                    </td>
                                               </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    </axis:visible>
                                    <tr>
                                        <td>
                                            
                                        <%-- DisplayTag contabilidades --%>
                                            <c:set var="title0"><axis:alt c="CCUENTA" f="axisadm052" lit="9000533"/></c:set> <%-- Compte --%> 
                                            <c:set var="title1"><axis:alt c="TDESCRI" f="axisadm052" lit="100588"/></c:set>  <%-- Descripció --%>
                                            <c:set var="title2"><axis:alt c="FCONTA" f="axisadm052" lit="1000575"/></c:set> <%-- Data comptable --%>                                                                                      
                                            <c:set var="title3"><axis:alt c="FEFEADM" f="axisadm052" lit="1000596"/></c:set> <%-- Data administració --%>                                                                                      
                                            <c:set var="title4"><axis:alt c="CPROCES" f="axisadm052" lit="1000576"/></c:set> <%-- Procés --%>                                                                                      
                                            <c:set var="title5"><axis:alt c="FTRASPASO" f="axisadm052" lit="9901135"/></c:set> <%-- Data traspaso --%>                                                                                      
                                            <c:set var="title6"><axis:alt c="TAPUNTE" f="axisadm052" lit="9901136"/></c:set> <%-- Tipo apunte --%>                                                                                      
                                            <c:set var="title7"><axis:alt c="IAPUNTE" f="axisadm052" lit="100563"/></c:set> <%-- Importe --%>                                                                                      
                                            
                                           
                                            <div class="displayspaceGrande">
                                                <display:table name="${LISTA_CONT}" id="LISTA_CONT" export="false" class="dsptgtable" 
                                                        cellpadding="0" cellspacing="0"
                                                        pagesize="2000" defaultsort="1" defaultorder="ascending" sort="list"
                                                        requestURI="axis_axisadm052.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" style="width:15%" sortable="true" sortProperty="NUM" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            ${LISTA_CONT.CCUENTA}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title1}" style="width:20%" sortable="true" sortProperty="NUM" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            ${LISTA_CONT.TDESCRI}
                                                        </div>
                                                    </display:column>                                                    
                                                     <display:column title="${title2}" sortable="true" sortProperty="FCONTA" headerClass="sortable fixed" media="html" autolink="false"  style="width:10%">
                                                               <div class="dspText"><fmt:formatDate value="${LISTA_CONT.FCONTA}" pattern="dd/MM/yy" />
                                                                </div>             
                                                     </display:column>                
                                                     <display:column title="${title3}" sortable="true" sortProperty="FEFEADM" headerClass="sortable fixed" media="html" autolink="false"  style="width:15%">
                                                               <div class="dspText"><fmt:formatDate value="${LISTA_CONT.FEFEADM}" pattern="dd/MM/yy" />
                                                                </div>             
                                                     </display:column>  
                                                      <display:column title="${title4}" style="width:10%" sortable="true" sortProperty="CPROCES" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            ${LISTA_CONT.CPROCES}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="FTRASPASO" headerClass="sortable fixed" media="html" autolink="false"  style="width:10%">
                                                               <div class="dspText"><fmt:formatDate value="${LISTA_CONT.FTRASPASO}" pattern="dd/MM/yy" />
                                                                </div>             
                                                     </display:column> 
                                                     <display:column title="${title6}" sortable="true" sortProperty=" TAPUNTE" headerClass="sortable fixed" media="html" autolink="false"  style="width:5%">
                                                        <div class="dspText">
                                                            ${LISTA_CONT.TAPUNTE}
                                                        </div>             
                                                     </display:column>                                                         
                                                     <display:column title="${title7}" style="width:15%" sortable="true" sortProperty="IAPUNTE" headerClass="sortable fixed"  media="html" autolink="false">                                                        
                                                         
                                                         
                                                            <c:if test="${LISTA_CONT.IAPUNTE==null}">
                                                                <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LISTA_CONT.IAPUNTE}"/></div>                                                                                                                    
                                                            </c:if>
                                                            
                                                            <c:if test="${LISTA_CONT.IAPUNTE!=null}">
                                                                <a href="javascript:f_desglose_contab_dia('${__formdata.CEMPRES_RECERCA}','<fmt:formatDate value='${LISTA_CONT.FCONTA}' pattern='dd/MM/yyyy'/>', '${LISTA_CONT.CCUENTA}',  ${LISTA_CONT.NLINEA},  ${LISTA_CONT.NASIENT},  ${LISTA_CONT.CPAIS},  '${LISTA_CONT.CPROCES}', '<fmt:formatDate value='${LISTA_CONT.FEFEADM}' pattern='dd/MM/yyyy'/>');">
                                                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LISTA_CONT.IAPUNTE}"/></div>                                                                                                                    
                                                                </a>                                                                
                                                            </c:if>
                                                    </display:column>                                        
                                                </display:table>          
                                                <%--
                                                        <c:choose>
                                                            <c:when test="${!empty listaPlanes}">
                                                                <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                                                    <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                                                                </c:if>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <script language="javascript">
                                                                bjLista.esconderListaSpans();
                                                                objLista.esconderListaLinks();     
                                                                </script>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        --%>
                                            </div>
                                        </td>
                                    </tr>                                                                       
                                </table>
                                <div class="separador">&nbsp;</div>                                      
                                <table class="area" align="center">                                                                      
                                    <tr>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                    </tr>                                     
                                    <tr>
                                        <td class="campocaja">                                               
                                        </td>        
                                        <td class="campocaja">                                               
                                        </td>        
                                        <td class="campocaja">
                                           <axis:ocultar f="axisadm052" c="BUT_TRASPASAR" dejarHueco="false"> 
                                                    <input type="button" class="boton" style="vertical-align:bottom;cursor:pointer;" value="<axis:alt c="BUT_TRASPASAR" f="axisadm052" lit="9900788"/>" onclick="f_traspasar()"/>                                           
                                            </axis:ocultar>
                                        </td>    
                                        <td class="campocaja">
                                            <axis:ocultar f="axisadm052" c="BUT_INFORME" dejarHueco="false">                                             
                                                    <input type="button" class="boton" style="vertical-align:bottom;cursor:pointer;" value="<axis:alt c="BUT_INFORME" f="axisadm052" lit="9000569"/>" onclick="f_montar_fichero()"/>                                            
                                            </axis:ocultar>                                            
                                        </td> 
                                        <td class="campocaja">                                               
                                        </td>   
                                        <td class="campocaja">                                               
                                        </td>   
                                    </tr>
                                    </table>
                                    
                                    
                                      <table class="area" align="center">  
                                     <tr>
                                            <th style="width:50%;height:0px"></th>        
                                            <th style="width:50%;height:0px"></th>
                                     </tr>       
                                     <c:if test="${!empty __formdata.LINK_INFORME || !empty __formdata.LINK_TRASPASAR }">
                                        <tr>
                                            <axis:ocultar f="axisadm052" c="LINKS" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b id="label_LINKS"><axis:alt c="LINK_INFORME" f="axisadm052" lit="107913"/></b> <%-- Links fitxers generats --%>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                    </c:if>   
                                    <c:if test="${!empty __formdata.LINK_TRASPASAR}">                                   
                                        <tr>
                                            <axis:ocultar f="axisadm052" c="LINK_TRASPASAR" dejarHueco="false">
                                               <td class="campocaja" id="fichero">
                                                     <input type="text" readonly 
                                                   style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                   onclick="javascript:f_imprimir_fitxer(this.value)" class="campowidthinput campo campotexto_ob" size="15"  name="SORTIDA" id="SORTIDA"
                                                   title="<axis:alt c="LINK_TRASPASAR" f="axisadm052" lit="107913"/>" value="${__formdata.LINK_TRASPASAR}"/>          
                                                   
                                                </td>   
                                               </axis:ocultar>                                           
                                       
                                        </tr>
                                    </c:if>   
                                    <c:if test="${!empty __formdata.LINK_INFORME}">                                   
                                        <tr>
                                            <axis:ocultar f="axisadm052" c="LINK_INFORME" dejarHueco="false">
                                                <td class="campocaja" id="fichero">
                                                      <input type="text" readonly 
                                                   style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                   onclick="javascript:f_imprimir_fitxer(this.value)" class="campowidthinput campo campotexto_ob" size="15"  name="LINK_INFORME" id="LINK_INFORME"
                                                   title="<axis:alt c="LINK_INFORME" f="axisadm052" lit="107913"/>" value="${__formdata.LINK_INFORME}"/>      
                                                   
                                                </td>                                          
                                            </axis:ocultar>
                                            <td>                                            
                                        </tr>
                                    </c:if>
                                </table>
                                
                                
                                
                            </td>
                        </tr>
                    </table>
 
                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt c="flecha4" f="axisadm052" lit="9001598"/><%-- Detalle --%> &nbsp; ${resumen} &nbsp; </div>
                    
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                  <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                 </tr>
                                 <tr>
                                        <axis:ocultar f="axisadm052" c="CEMPRES" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_CEMPRES"><axis:alt c="CEMPRES" f="axisadm052" lit="101619"/></b> <%-- Empresa --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm052" c="FCONTAB" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FCONTAB"><axis:alt c="FCONTAB" f="axisadm052" lit="1000575"/></b>   <%-- Data contable --%>
                                            </td>            
                                        </axis:ocultar>                                    
                                    </tr>
                                    <tr>
                                        <%-- Empresa --%>
                                        <axis:ocultar f="axisadm052" c="CEMPRES" dejarHueco="false">
                                            <td class="campocaja">
                                            <select name="CEMPRES" id="CEMPRES" size="1" class="campowidthselect campo campotexto" <axis:atr f="axisdm052" c="CEMPRES" a="formato=fecha"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt c="LIT_SEL" f="axisadm052" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                                    <option value = "${element.CEMPRES}"
                                                    <c:if test="${__formdata.CEMPRES == element.CEMPRES || fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1}"> selected = "selected"</c:if>>
                                                        ${element.TEMPRES} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            </td>
                                        </axis:ocultar>
                                        <%-- Data contable --%>
                                       <axis:ocultar f="axisadm052" c="FCONTAB" dejarHueco="false">
                                             <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FCONTAB" name="FCONTAB" size="15" onchange="thiss(this);"
                                                <axis:atr f="axisdm052" c="FCONTAB" a="formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTAB}"/>" style="width:35%"
                                                title="<axis:alt c="FCONTAB1" f="axisadm052" lit="9000716"/>"/><a style="vertical-align:middle;"><img
                                                id="icon_FCONTAB" alt="<axis:alt c="FCONTAB" f="axisadm052" lit="1000575"/>" title="<axis:alt c="FCONTAB" f="axisadm052" lit="1000575" />" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm052" c="BUT_EJECUTAR" dejarHueco="false"> 
                                            <td class="campocaja">
                                                <input type="button" class="boton" style="vertical-align:bottom;cursor:pointer;" value="<axis:alt c="BUT_EJECUTAR" f="axisadm052" lit="109006"/>" onclick="f_contabiliza_diario()"/>
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
        
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisadm052</c:param>        
            <c:param name="__botones">salir</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    
      <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FCONTAB",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCONTAB", 
            singleClick    :    true,
            firstDay       :    1
        });
      
    </script>

</body>
</html>