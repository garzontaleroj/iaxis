<%/**
*  Fichero: axisadm081.jsp
*  @author <a href="mailto:jdelrio@csi-ti.com">Javier del Rio</a>
*   
*  Apuntes manuales de contabilidad
*
*  Fecha: 19/04/2013
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
<% String codPantalla = "axisadm081"; %>
<html>
<head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>

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

<c:import url="../include/carga_framework_js.jsp" />

<script language="Javascript" type="text/javascript">

    function f_onload() {
        //revisarEstilos();
        //document.miForm.NPOLIZA.focus();        
        
        var OK_acceptar181 = "${requestScope.OK_acceptar181}"; 
            
            
            //if (!objUtiles.estaVacio(OK_acceptar181)==1){     
            //    alert("<axis:alt f='axisadm081' c='OK_ACCEPTAR' lit='111313'/>");                
            //}
        
        f_cargar_propiedades_pantalla();
    }

   function f_but_9900788()
   {
       objUtiles.ejecutarFormulario ("axis_axisadm081.do", "traspasar", document.miForm, "_self", objJsMessages.jslit_cargando); 
   }
    // Primero miramos si hay alguna opción de la lista seleccionada
    function f_but_aceptar() {                    
        var hayChecked = objUtiles.f_GuardaCasillasChecked("radioAsientoManual");
        if(typeof hayChecked == 'boolean') {
            alert("<axis:alt f="axisadm081" c="titulo" lit="9001554"/>");
        }else{
            f_seleccionar (hayChecked);
        }
    }
   
    function f_but_cancelar() {
         objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
    }      
    
    function f_but_9905784(){
       objUtiles.ejecutarFormulario ("axis_axisadm081.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_but_nuevo() {
        var PCEMPRES = objDom.getValorPorId("PCEMPRES");
           if (!objUtiles.estaVacio(PCEMPRES))
           {
                objUtiles.abrirModal("axisadm082","src","modal_axisadm082.do?operation=form&CEMPRES="+PCEMPRES+"&FCONTABINI="+objDom.getValorPorId("FCONTABINI")+"&FCONTABFIN="+objDom.getValorPorId("FCONTABFIN")+"&FADMININI="+objDom.getValorPorId("FADMININI")+"&FADMINFIN="+objDom.getValorPorId("FADMINFIN"));
           }           
    }    
    
    function f_seleccionar(cadena){
        if (objUtiles.estaVacio(cadena))
            alert (objJsMessages.jslit_error_de_seleccion);
        else
            parent.f_aceptar_axisadm081(cadena);
    }        
    
    function f_seleccionarAge(cadena){
        f_aceptar_axisadm081(cadena);
    }     
    
    function f_borrar_cta(CPAIS,FEFEADM,CPROCES,CCUENTA,NLINEA,NASIENT,CEMPRES,FCONTA,TDESCRI,SINTERF,TTIPPAG,IDPAGO,CCOLETILLA,OTROS){             

    var params = "?CPAIS="+CPAIS+"&FEFEADM="+FEFEADM+"&CPROCES="+CPROCES+"&PCCUENTA="+CCUENTA+"&NLINEA="+NLINEA+"&NASIENT="+NASIENT+"&CEMPRES="+CEMPRES+"&FCONTA="+FCONTA+"&TDESCRI="+TDESCRI+"&SINTERF="+SINTERF+"&TTIPPAG="+TTIPPAG+"&IDPAGO="+IDPAGO+"&PCCOLETILLA="+CCOLETILLA+"&OTROS="+OTROS;
               objUtiles.ejecutarFormulario ("axis_axisadm081.do"+params, "delete", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }

    function f_cerrar_modal(cual) {
        objUtiles.cerrarModal(cual);
    }
    
    function f_cerrarbuscar_modal(cual) {
        objUtiles.cerrarModal(cual);
        f_but_9000508();
    }

</script>
</head>
<body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
    
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisadm081" c="AXISADM082_MODAL" lit="9905785" /></c:param>
                <c:param name="nid" value="axisadm082" />
    </c:import>
    
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisadm081" c="FORM" lit="9905689" /></c:param>
            <c:param name="producto"><axis:alt f="axisadm081" c="producto" lit="9905689"/></c:param>
            <c:param name="form">axisadm081</c:param>
        </c:import>

        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table class="seccion">
                        <tr>
                            <!-- póliza -->   
                            <axis:ocultar f="axisadm081" c="CEMPRES" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm081" c="CEMPRES" lit="101619"/></b>
                            </td>                            
                            </axis:ocultar>
                        </tr>
                        <tr>
                         <axis:ocultar f="axisadm081" c="PCEMPRES" dejarHueco="false">
                            <td class="campocaja" style="width:10%">
                                <select name = "PCEMPRES" id ="PCEMPRES" size="1" class="campo campotexto_ob" style="width:90%" obligatorio="true"
                                                title="<axis:alt f="axisadm081" c="CEMPRES" lit="101619"/>">
                                                    <!--<option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm081" c="MIN_CEMPRES" lit="1000348"/> - </option>-->
                                                    <c:forEach items="${__formdata.LISTVALORES.LSTEMPRESAS}" var="item">
                                                        <option value = "${item.CEMPRES}" <c:if test="${__formdata.PCEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                                    </c:forEach>
                                                </select>
                            </td> 
                            </axis:ocultar>
                        </tr>                        
                        <tr>
                        <!-- certificado -->                           
                            <!-- Fecha Alta -->
                            <axis:ocultar f="axisadm081" c="FCONTABINI" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm081" c="FCONTABINI" lit="9901129"/></b>
                            </td>
                            </axis:ocultar>
                            <!-- Fecha contable final -->
                            <axis:ocultar f="axisadm081" c="FCONTABFIN" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm081" c="FCONTABFIN" lit="9901130"/></b>
                            </td>
                            </axis:ocultar>
                        </tr>                    
                        <tr>                                                      
                            <!-- Fecha Alta -->
                            <axis:ocultar f="axisadm081" c="FCONTABINI" dejarHueco="false">
                            <td class="campocaja" style="width:10%">
                                <input type="text" name="FCONTABINI" id="FCONTABINI" size="15" class="campowidthinput campo campotexto"  style="width:50%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTABINI}"/>" 
                                title="<axis:alt f="axisadm081" c="FCONTABINI" lit="9901129"/>"
                                <axis:atr f="axisadm081" c="FCONTABINI" a="formato=fecha"/> /> <a style="vertical-align:middle;"><img
                                id="icon_FCONTABINI" border=0 alt="<axis:alt f="axisadm081" c="FCONTABINI" lit="9901129"/>" title="<axis:alt f="axisadm081" c="FCONTABINI" lit="9901129"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm081" c="FCONTABFIN" dejarHueco="false">
                            <td class="campocaja" style="width:10%">
                                <input type="text" name="FCONTABFIN" id="FCONTABFIN" size="15" class="campowidthinput campo campotexto"  style="width:50%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTABFIN}"/>" 
                                title="<axis:alt f="axisadm081" c="FCONTABFIN" lit="9901130"/>"
                                <axis:atr f="axisadm081" c="FCONTABFIN" a="formato=fecha"/> /> <a style="vertical-align:middle;"><img
                                id="icon_FCONTABFIN" border=0 alt="<axis:alt f="axisadm081" c="FCONTABFIN" lit="9901130"/>" title="<axis:alt f="axisadm081" c="FCONTABFIN" lit="9901130"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                         <axis:ocultar f="axisadm081" c="FADMININI" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm081" c="FADMININI" lit="9904221"/></b>
                            </td>
                            </axis:ocultar>
                            <!-- Fecha contable final -->
                            <axis:ocultar f="axisadm081" c="FADMINFIN" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm081" c="FADMINFIN" lit="9904222"/></b>
                            </td>
                            </axis:ocultar>
                            </tr>
                            <tr>
                            <axis:ocultar f="axisadm081" c="FADMININI" dejarHueco="false">
                             <td class="campocaja">
                                <input type="text" name="FADMININI" id="FADMININI" size="15" class="campowidthinput campo campotexto"  style="width:50%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FADMININI}"/>" 
                                title="<axis:alt f="axisadm081" c="FADMININI" lit="9904221"/>"
                                <axis:atr f="axisadm081" c="FADMININI" a="formato=fecha"/> /> <a style="vertical-align:middle;"><img
                                id="icon_FADMININI" border=0 alt="<axis:alt f="axisadm081" c="FADMININI" lit="9904221"/>" title="<axis:alt f="axisadm081" c="FADMININI" lit="9904221"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisadm081" c="FADMINFIN" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" name="FADMINFIN" id="FADMINFIN" size="15" class="campowidthinput campo campotexto"  style="width:50%;"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FADMINFIN}"/>" 
                                    title="<axis:alt f="axisadm081" c="FADMINFIN" lit="9904222"/>"
                                    <axis:atr f="axisadm081" c="FADMINFIN" a="formato=fecha"/> /> <a style="vertical-align:middle;"><img
                                    id="icon_FADMINFIN" border=0 alt="<axis:alt f="axisadm081" c="FADMINFIN" lit="9904222"/>" title="<axis:alt f="axisadm081" c="FADMINFIN" lit="9904222"/>" src="images/calendar.gif"/></a>
                                </td>
                            </axis:ocultar>
                        </tr>
                    </table>
                    <div class="separador">&nbsp;</div>
                    <c:set var="title0"><axis:alt f="axisadm081" c="title0" lit="9901778"/></c:set> <!-- Fecha Contabilidad -->
                    <c:set var="title1"><axis:alt f="axisadm081" c="title1" lit="105417"/></c:set> <!-- Nº Asiento -->
                    <c:set var="title2"><axis:alt f="axisadm081" c="title2" lit="9000533"/></c:set> <!-- Cuenta -->
                    <c:set var="title3"><axis:alt f="axisadm081" c="title3" lit="9001948"/></c:set> <!-- Debe/Haber -->                    
                    <c:set var="title5"><axis:alt f="axisadm081" c="title5" lit="100588"/></c:set> <!-- Descripcion -->
                    <c:set var="title6"><axis:alt f="axisadm081" c="title6" lit="1000596"/></c:set> <!-- Fecha Administracion -->
                    <c:set var="title7"><axis:alt f="axisadm081" c="title7" lit="9903796"/></c:set> <!-- Enlace -->
                    <c:set var="title8"><axis:alt f="axisadm081" c="title8" lit="1000576"/></c:set> <!-- Proceso -->
                    <c:set var="title4"><axis:alt f="axisadm081" c="title4" lit="100563"/></c:set> <!-- Importe -->
                    
                     <c:set var="total">0</c:set>                     

                    <div class="seccion displayspaceGrande">
                        <display:table name="${LISTAAPUNTES}" id="LISTAAPUNTES" export="false" class="dsptgtable" pagesize="6"  
                        requestURI="axis_axisadm081.do?operation=form&paginar=true" sort="list" cellpadding="0" cellspacing="0">
                        <%@ include file="../include/displaytag.jsp"%>
                         
                        <axis:visible c="FCONTA" f="axisadm081"> 
                        <display:column title="${title0}" sortable="true" sortProperty="FCONTA" headerClass="sortable"  media="html" autolink="false" style="width:9%">
                            <div class="dspText">
                                <fmt:formatDate value='${LISTAAPUNTES.FCONTA}' pattern='dd/MM/yyyy'/>
                            </div>                            
                        </display:column>
                        </axis:visible>                                           
                                           
                        <axis:visible c="NASIENT" f="axisadm081">                                         
                        <display:column title="${title1}" sortable="true" sortProperty="NASIENT" headerClass="sortable"  media="html" autolink="false" style="width:8%">
                            <div class="dspText">${LISTAAPUNTES.NASIENT}</div>                                                        
                        </display:column>
                        </axis:visible>
                        
                        <axis:visible c="CCUENTACOLETILLA" f="axisadm081"> 
                        <display:column title="${title2}" sortable="true" sortProperty="CCUENTACOLETILLA" headerClass="sortable"  media="html" autolink="false" style="width:8%">
                            <div class="dspText">${LISTAAPUNTES.CCUENTA}${LISTAAPUNTES.CCOLETILLA}
                            </div>                            
                            <input type="hidden" name="CCUENTA" value="${LISTAAPUNTES.CCUENTA}"/>
                            <input type="hidden" name="CCOLETILLA" value="${LISTAAPUNTES.CCOLETILLA}"/>
                        </display:column>
                        </axis:visible>
                       
                        <axis:visible c="TAPUNTE" f="axisadm081"> 
                        <display:column title="${title3}" sortable="true" sortProperty="TAPUNTE" headerClass="sortable"  media="html" autolink="false" style="width:17%">
                            <div class="dspText">${LISTAAPUNTES.TAPUNTE}</div>                      
                            
                            <c:if test="${LISTAAPUNTES.TAPUNTE == 'D' }">
                         <c:set var="total">${total + LISTAAPUNTES.IAPUNTE}</c:set>
                         </c:if>                                                     
                         <c:if test="${LISTAAPUNTES.TAPUNTE == 'H' }">
                         <c:set var="total">${total - LISTAAPUNTES.IAPUNTE}</c:set>
                         </c:if>          
                            
                        </display:column>       
                        </axis:visible>
                        
                        <axis:visible c="TDESCRI" f="axisadm081"> 
                        <display:column title="${title5}" sortable="true" sortProperty="TDESCRI" headerClass="sortable"  media="html" autolink="false" style="width:10%">
                            <div class="dspText">${LISTAAPUNTES.TDESCRI}</div>                            
                        </display:column>
                        </axis:visible>
                        
                        <axis:visible c="FEFEADM" f="axisadm081"> 
                        <display:column title="${title6}" sortable="true" sortProperty="FEFEADM" headerClass="sortable"  media="html" autolink="false" style="width:8%">
                            <div class="dspText">
                            <fmt:formatDate value='${LISTAAPUNTES.FEFEADM}' pattern='dd/MM/yyyy'/></div>                          
                        </display:column>
                        </axis:visible>
                        
                        <axis:visible c="CENLACE" f="axisadm081"> 
                        <display:column title="${title7}" sortable="true" sortProperty="CENLACE" headerClass="sortable"  media="html" autolink="false" style="width:8%">
                            <div class="dspText">${LISTAAPUNTES.CENLACE}</div>                            
                        </display:column>
                        </axis:visible>
                        
                         <axis:visible c="CPROCES" f="axisadm081"> 
                         <display:column title="${title8}" sortable="true" sortProperty="CPROCES" headerClass="sortable"  media="html" autolink="false" style="width:8%">
                            <div class="dspText">${LISTAAPUNTES.CPROCES}</div>                            
                        </display:column>
                        </axis:visible>
                        
                        <axis:visible c="IAPUNTE" f="axisadm081"> 
                        <display:column title="${title4}" sortable="true" sortProperty="IAPUNTE" headerClass="headwidth10 sortable"  media="html" autolink="false" style="width:2%">
                            <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LISTAAPUNTES.IAPUNTE}"/></div>                            
                        </display:column> 
                        </axis:visible>
                        
                        <axis:visible c="DEL_APUNTE" f="axisadm081"> 
                        <display:column title="" headerClass="sortable fixed" media="html" style="width:3%;" autolink="false" >
                            <div class="dspIcons"><img border="0" alt="<axis:alt f="axisadm081" c="DEL_APUNTE" lit="1000127"/>" title1="<axis:alt f="axisadm081" c="DEL_APUNTE" lit="1000127"/>" src="images/delete.gif" width="15px" height="15px"
                                style="cursor:pointer;" onclick="javascript:f_borrar_cta('${LISTAAPUNTES.CPAIS}','<fmt:formatDate value='${LISTAAPUNTES.FEFEADM}' pattern='dd/MM/yyyy'/>','${LISTAAPUNTES.CPROCES}','${LISTAAPUNTES.CCUENTA}','${LISTAAPUNTES.NLINEA}',
                                '${LISTAAPUNTES.NASIENT}','${LISTAAPUNTES.CEMPRES}','<fmt:formatDate value='${LISTAAPUNTES.FCONTA}' pattern='dd/MM/yyyy'/>','${LISTAAPUNTES.TDESCRI}','${LISTAAPUNTES.SINTERF}','${LISTAAPUNTES.TTIPPAG}','${LISTAAPUNTES.IDPAGO}',
                                '${LISTAAPUNTES.CCOLETILLA}','${LISTAAPUNTES.CPROCES}');"/></div>                            

                        </display:column>                                                                                                    
                        </axis:visible>
                        
                        </display:table>   
                        
<axis:visible c="SALDO" f="axisadm081">                         
                    <table cellpadding="0" class="dsptgtable grid" style="width:100%" cellspacing="0"><tbody>
<tr class="gridEven">
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:15%"></td>
<td style="width:10%"> <b><axis:alt f="axisadm081" c="SALDO" lit="9000474"/></b></td>
<td style="width:15%">
<div class="dspNumber">
    <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${total}"/>
</div></td>
</tr>
</tbody></table> 
</axis:visible> 
                    
                    
                    </div>
                </td>
            </tr>
        </table>
        
        <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisadm081</c:param>
                    <c:param name="__botones">cancelar,9905784<axis:visible f="axisadm081" c="BT_TRASPASO" >,9900788</axis:visible><axis:visible f="axisadm081" c="BT_NUEVO" >,nuevo</axis:visible></c:param>
            </c:import>           
    </form>
    
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FADMININI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FADMININI", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FADMINFIN",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FADMINFIN", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FCONTABINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCONTABINI", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FCONTABFIN",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCONTABFIN", 
            singleClick    :    true,
            firstDay       :    1
        });
        
     </script>

</body>
</html>