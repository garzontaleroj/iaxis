<%/**
*  Fichero: axisadm082.jsp
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
<% String codPantalla = "axisadm082"; %>
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
        f_cargar_propiedades_pantalla();
    }

   
    // Primero miramos si hay alguna opción de la lista seleccionada
    function f_but_aceptar() {                    
        parent.document.miForm.FCONTABINI.value = document.miForm.FCONTABINI.value;
        parent.document.miForm.FCONTABFIN.value = document.miForm.FCONTABFIN.value;
        parent.document.miForm.FADMININI.value = document.miForm.FADMININI.value;
        parent.document.miForm.FADMINFIN.value = document.miForm.FADMINFIN.value;
        parent.f_cerrarbuscar_modal("axisadm082");
    }
   
    function f_but_cancelar() {
        parent.document.miForm.FCONTABINI.value = document.miForm.FCONTABINI.value;
        parent.document.miForm.FCONTABFIN.value = document.miForm.FCONTABFIN.value;
        parent.document.miForm.FADMININI.value = document.miForm.FADMININI.value;
        parent.document.miForm.FADMINFIN.value = document.miForm.FADMINFIN.value;
        parent.f_cerrarbuscar_modal("axisadm082");
    }      
    
    function f_but_9000508(){
       objUtiles.ejecutarFormulario ("modal_axisadm082.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_but_nuevo() {       
        if (!objUtiles.estaVacio(document.miForm.SELECCION.value))
        {
            var valores = new Array();  
            var registro = document.miForm.SELECCION.value;
                    //alert("registro"+registro);
                    valores= registro.split("#");
                    var SINTERF = valores[0];
                    var TTIPPAG = valores[1];
                    var IDPAGO = valores[2];
                    var FCONTA = valores[3];
                    var NASIENT = valores[4];
                    var NLINEA = valores[5];
                    var CCUENTA = valores[6];
                    var CCOLETILLA = valores[7];
                    var TDESCRI = valores[8];
                    var FEFEADM = valores[9];
                    var CPROCES = valores[10];
                    var CMANUAL = valores[11];                 
                    var TASIENT = valores[12];
                    var TAPUNTE = valores[13];
                    var IAPUNTE = valores[14];
                    var CENLACE = valores[15];
                    var CPAIS = valores[16];
                    var OTROS = valores[17];
                    var CLAVEASI = valores[18];
                    var FTRASPASO = valores[19];
                    var FASIENTO = valores[20];
                    var TIPODIARIO = valores[21];
                   
            objUtiles.abrirModal("axisadm083","src","modal_axisadm083.do?operation=form&SINTERF="+SINTERF+"&TTIPPAG="+TTIPPAG+
            "&IDPAGO="+IDPAGO+"&FCONTA="+FCONTA+"&NASIENT="+NASIENT+"&NLINEA="+NLINEA+"&CCUENTA="+CCUENTA+"&CCOLETILLA="+CCOLETILLA+
            "&TDESCRI="+TDESCRI+"&FEFEADM="+FEFEADM+"&CPROCES="+CPROCES+"&TASIENT="+TASIENT+"&TAPUNTE="+TAPUNTE+"&IAPUNTE="+IAPUNTE+
            "&CENLACE="+CENLACE+"&CPAIS="+CPAIS+"&OTROS="+OTROS+"&CLAVEASI="+CLAVEASI+"&FTRASPASO="+FTRASPASO+"&FASIENTO="+FASIENTO+
            "&TIPODIARIO="+TIPODIARIO);
        }
    }    
    
    function f_seleccionar(cadena){
        if (objUtiles.estaVacio(cadena))
            alert (objJsMessages.jslit_error_de_seleccion);
        else
            parent.f_aceptar_axisadm082(cadena);
    }        
    
    function f_sel_asiento(valor){        
            document.miForm.SELECCION.value=valor;        
            //alert(valor);
        }
    
    function f_seleccionarAge(cadena){
        f_aceptar_axisadm082(cadena);
    }     
    
    function f_cerrar_axisadm083(){
        objUtiles.cerrarModal("axisadm083");
    }
    
    function f_borrar_cta(CPAIS,FEFEADM,CPROCES,CCUENTA,NLINEA,NASIENT,CEMPRES,FCONTA,TDESCRI,SINTERF,TTIPPAG,IDPAGO,CCOLETILLA,OTROS){             
    var params = "?CPAIS="+CPAIS+"&FEFEADM="+FEFEADM+"&CPROCES="+CPROCES+"&CCUENTA="+CCUENTA+"&NLINEA="+NLINEA+"&NASIENT="+NASIENT+"&CEMPRES="+CEMPRES+"&FCONTA="+FCONTA+"&TDESCRI="+TDESCRI+"&SINTERF="+SINTERF+"&TTIPPAG="+TTIPPAG+"&IDPAGO="+IDPAGO+"&CCOLETILLA="+CCOLETILLA+"&OTROS="+OTROS;
               objUtiles.ejecutarFormulario ("modal_axisadm082.do"+params, "delete", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }

</script>
</head>
<body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
     <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisadm082" c="AXISADM083_MODAL" lit="9001219" /></c:param>
                <c:param name="nid" value="axisadm083" />
    </c:import>
    
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisadm082" c="FORM" lit="9905785" /></c:param>
            <c:param name="producto"><axis:alt f="axisadm082" c="producto" lit="9905785"/></c:param>
            <c:param name="form">axisadm082</c:param>
        </c:import>

        <input type="hidden" name="CEMPRES" value="${__formdata.CEMPRES}"/>
        <input type="hidden" name="SELECCION" value="${__formdata.SELECCION}"/>

        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table class="seccion">
                        <tr>                    
                            <!-- Fecha Alta -->
                            <axis:ocultar f="axisadm082" c="FCONTABINI" dejarHueco="false">
                            <td class="campocaja" style="width:15%">
                                <b><axis:alt f="axisadm082" c="FCONTABINI" lit="9901129"/></b>
                            </td>
                            </axis:ocultar>
                            <!-- Fecha contable final -->
                            <axis:ocultar f="axisadm082" c="FCONTABFIN" dejarHueco="false">
                            <td class="campocaja" style="width:15%">
                                <b><axis:alt f="axisadm082" c="FCONTABFIN" lit="9901130"/></b>
                            </td>
                            </axis:ocultar>
                        </tr>                    
                        <tr>

                            <!-- Fecha Alta -->
                            <axis:ocultar f="axisadm082" c="FCONTABINI" dejarHueco="false">
                            <td class="campocaja" style="width:15%">
                                <input type="text" name="FCONTABINI" id="FCONTABINI" size="15" obligatorio="true" class="campowidthinput campo campotexto"  style="width:50%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTABINI}"/>" 
                                title="<axis:alt f="axisadm082" c="FCONTABINI" lit="9901129"/>"
                                <axis:atr f="axisadm082" c="FCONTABINI" a="formato=fecha"/> /> <a style="vertical-align:middle;"><img
                                id="icon_FCONTABINI" border=0 alt="<axis:alt f="axisadm082" c="FCONTABINI" lit="9901129"/>" title="<axis:alt f="axisadm082" c="FCONTABINI" lit="9901129"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm082" c="FCONTABFIN" dejarHueco="false">
                            <td class="campocaja" style="width:15%">
                                <input type="text" name="FCONTABFIN" id="FCONTABFIN" size="15" obligatorio="true" class="campowidthinput campo campotexto"  style="width:50%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTABFIN}"/>" 
                                title="<axis:alt f="axisadm082" c="FCONTABFIN" lit="9901130"/>"
                                <axis:atr f="axisadm082" c="FCONTABFIN" a="formato=fecha"/> /> <a style="vertical-align:middle;"><img
                                id="icon_FCONTABFIN" border=0 alt="<axis:alt f="axisadm082" c="FCONTABFIN" lit="9901130"/>" title="<axis:alt f="axisadm082" c="FCONTABFIN" lit="9901130"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                         <axis:ocultar f="axisadm082" c="FADMININI" dejarHueco="false">
                            <td class="campocaja" style="width:15%">
                                <b><axis:alt f="axisadm082" c="FADMININI" lit="9904221"/></b>
                            </td>
                            </axis:ocultar>
                            <!-- Fecha contable final -->
                            <axis:ocultar f="axisadm082" c="FADMINFIN" dejarHueco="false">
                            <td class="campocaja" style="width:15%">
                                <b><axis:alt f="axisadm082" c="FADMINFIN" lit="9904222"/></b>
                            </td>
                            </axis:ocultar>
                            </tr>
                            <tr>
                            <axis:ocultar f="axisadm082" c="FADMININI" dejarHueco="false">
                             <td class="campocaja" style="width:15%">
                                <input type="text" name="FADMININI" id="FADMININI" size="15" class="campowidthinput campo campotexto"  style="width:50%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FADMININI}"/>" 
                                title="<axis:alt f="axisadm082" c="FADMININI" lit="9904221"/>"
                                <axis:atr f="axisadm082" c="FADMININI" a="formato=fecha"/> /> <a style="vertical-align:middle;"><img
                                id="icon_FADMININI" border=0 alt="<axis:alt f="axisadm082" c="FADMININI" lit="9904221"/>" title="<axis:alt f="axisadm082" c="FADMININI" lit="9904221"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisadm082" c="FADMINFIN" dejarHueco="false">
                                <td class="campocaja" style="width:15%">
                                    <input type="text" name="FADMINFIN" id="FADMINFIN" size="15" class="campowidthinput campo campotexto"  style="width:50%;"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FADMINFIN}"/>" 
                                    title="<axis:alt f="axisadm082" c="FADMINFIN" lit="9904222"/>"
                                    <axis:atr f="axisadm082" c="FADMINFIN" a="formato=fecha"/> /> <a style="vertical-align:middle;"><img
                                    id="icon_FADMINFIN" border=0 alt="<axis:alt f="axisadm082" c="FADMINFIN" lit="9904222"/>" title="<axis:alt f="axisadm082" c="FADMINFIN" lit="9904222"/>" src="images/calendar.gif"/></a>
                                </td>
                            </axis:ocultar>
                        </tr>
                    </table>     
                    <div class="separador">&nbsp;</div>
                    <c:set var="title0"><axis:alt f="axisadm082" c="title0" lit="9901778"/></c:set> <!-- Fecha Contabilidad -->
                    <c:set var="title1"><axis:alt f="axisadm082" c="title1" lit="105417"/></c:set> <!-- Nº Asiento -->
                    <c:set var="title2"><axis:alt f="axisadm082" c="title2" lit="9000533"/></c:set> <!-- Cuenta -->
                    <c:set var="title3"><axis:alt f="axisadm082" c="title3" lit="9001948"/></c:set> <!-- Debe/Haber -->                    
                    <c:set var="title5"><axis:alt f="axisadm082" c="title5" lit="100588"/></c:set> <!-- Descripcion -->
                    <c:set var="title6"><axis:alt f="axisadm082" c="title6" lit="1000596"/></c:set> <!-- Fecha Administracion -->
                    <c:set var="title7"><axis:alt f="axisadm082" c="title7" lit="9903796"/></c:set> <!-- Enlace -->
                    <c:set var="title8"><axis:alt f="axisadm082" c="title8" lit="1000576"/></c:set> <!-- Proceso -->
                    <c:set var="title4"><axis:alt f="axisadm082" c="title4" lit="100563"/></c:set> <!-- Importe -->
                    
                     <c:set var="total">0</c:set>                     

                    <div class="seccion displayspaceGrande">
                        <display:table name="${LISTAAPUNTES}" id="LISTAAPUNTES" export="false" class="dsptgtable" pagesize="6"  
                        requestURI="modal_axisadm082.do?operation=form&paginar=false" sort="list" cellpadding="0" cellspacing="0">
                        <%@ include file="../include/displaytag.jsp"%>
                       
                        <axis:visible c="RADIO" f="axisadm082"> 
                        <display:column title="" sortable="false" sortProperty="RADIO" headerClass="sortable"  media="html" autolink="false" style="width:2%">
                        <div class="dspIcons"><input onclick="f_sel_asiento('${LISTAAPUNTES.SINTERF}#${LISTAAPUNTES.TTIPPAG}#${LISTAAPUNTES.IDPAGO}#<fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAAPUNTES.FCONTA}"/>#${LISTAAPUNTES.NASIENT}#${LISTAAPUNTES.NLINEA}#${LISTAAPUNTES.CCUENTA}#${LISTAAPUNTES.CCOLETILLA}#${LISTAAPUNTES.TDESCRI}#<fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAAPUNTES.FEFEADM}"/>#${LISTAAPUNTES.CPROCES}#${LISTAAPUNTES.CMANUAL}#${LISTAAPUNTES.TASIENT}#${LISTAAPUNTES.TAPUNTE}#${LISTAAPUNTES.IAPUNTE}#${LISTAAPUNTES.CENLACE}#${LISTAAPUNTES.CPAIS}#${LISTAAPUNTES.OTROS}#${LISTAAPUNTES.CLAVEASI}#<fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAAPUNTES.FTRASPASO}"/>#<fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAAPUNTES.FASIENTO}"/>#${LISTAAPUNTES.TIPODIARIO}');" 
                        type="radio" id="RADIO" name="RADIO" value="${LISTAAPUNTES.SINTERF}#${LISTAAPUNTES.TTIPPAG}#${LISTAAPUNTES.IDPAGO}#<fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAAPUNTES.FCONTA}"/>#${LISTAAPUNTES.NASIENT}#${LISTAAPUNTES.NLINEA}#${LISTAAPUNTES.CCUENTA}#${LISTAAPUNTES.CCOLETILLA}#${LISTAAPUNTES.TDESCRI}#<fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAAPUNTES.FEFEADM}"/>#${LISTAAPUNTES.CPROCES}#${LISTAAPUNTES.CMANUAL}#${LISTAAPUNTES.TASIENT}#${LISTAAPUNTES.TAPUNTE}#${LISTAAPUNTES.IAPUNTE}#${LISTAAPUNTES.CENLACE}#${LISTAAPUNTES.CPAIS}#${LISTAAPUNTES.OTROS}#${LISTAAPUNTES.CLAVEASI}#<fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAAPUNTES.FTRASPASO}"/>#<fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAAPUNTES.FASIENTO}"/>#${LISTAAPUNTES.TIPODIARIO}"/>
                        </div>
                       </display:column>
                       </axis:visible>
                       
                       <axis:visible c="FCONTA" f="axisadm082"> 
                        <display:column title="${title0}" sortable="true" sortProperty="FCONTA" headerClass="sortable"  media="html" autolink="false" style="width:5%">
                            <div class="dspText">
                                <fmt:formatDate value='${LISTAAPUNTES.FCONTA}' pattern='dd/MM/yyyy'/>
                            </div>                            
                        </display:column>
                       </axis:visible>                    
                                      
                        <axis:visible c="TASIENT" f="axisadm082">                                             
                        <display:column title="${title1}" sortable="true" sortProperty="TASIENT" headerClass="sortable"  media="html" autolink="false" style="width:12%">
                            <div class="dspText">${LISTAAPUNTES.TASIENT}</div>                                                        
                        </display:column>
                        </axis:visible>
                        
                        <axis:visible c="CCUENTACOLETILLA" f="axisadm082"> 
                        <display:column title="${title2}" sortable="true" sortProperty="CCUENTACOLETILLA" headerClass="sortable"  media="html" autolink="false" style="width:5%">
                            <div class="dspText">${LISTAAPUNTES.CCUENTA}${LISTAAPUNTES.CCOLETILLA}
                            <input type="hidden" name="CCUENTA" value="${LISTAAPUNTES.CCUENTA}"/>
                            <input type="hidden" name="CCOLETILLA" value="${LISTAAPUNTES.CCOLETILLA}"/>
                            </div>                            
                        </display:column>
                       </axis:visible>
                       
                       <axis:visible c="TAPUNTE" f="axisadm082"> 
                        <display:column title="${title3}" sortable="true" sortProperty="TAPUNTE" headerClass="sortable"  media="html" autolink="false" style="width:3%">
                            <div class="dspText">${LISTAAPUNTES.TAPUNTE}</div>                      
                            
                         <c:if test="${LISTAAPUNTES.TAPUNTE == 'D' }">
                         <c:set var="total">${total + LISTAAPUNTES.IAPUNTE}</c:set>
                         </c:if>                                                     
                         <c:if test="${LISTAAPUNTES.TAPUNTE == 'H' }">
                         <c:set var="total">${total - LISTAAPUNTES.IAPUNTE}</c:set>
                         </c:if>          
                            
                        </display:column>      
                        </axis:visible>
                        
                        <axis:visible c="TDESCRI" f="axisadm082"> 
                        <display:column title="${title5}" sortable="true" sortProperty="TDESCRI" headerClass="sortable"  media="html" autolink="false" style="width:5%">
                            <div class="dspText">${LISTAAPUNTES.TDESCRI}</div>                            
                        </display:column>
                        </axis:visible>
                        
                        <axis:visible c="FEFEADM" f="axisadm082"> 
                        <display:column title="${title6}" sortable="true" sortProperty="FEFEADM" headerClass="sortable"  media="html" autolink="false" style="width:5%">
                            <div class="dspText">
                            <fmt:formatDate value='${LISTAAPUNTES.FEFEADM}' pattern='dd/MM/yyyy'/></div>                          
                        </display:column>
                        </axis:visible>
                        
                        <axis:visible c="CENLACE" f="axisadm082"> 
                        <display:column title="${title7}" sortable="true" sortProperty="CENLACE" headerClass="sortable"  media="html" autolink="false" style="width:5%">
                            <div class="dspText">${LISTAAPUNTES.CENLACE}</div>                            
                        </display:column>
                        </axis:visible>
                        
                        <axis:visible c="CPROCES" f="axisadm082"> 
                        <display:column title="${title8}" sortable="true" sortProperty="CPROCES" headerClass="sortable"  media="html" autolink="false" style="width:10%">
                            <div class="dspText">${LISTAAPUNTES.CPROCES}${LISTAAPUNTES.OTROS}</div>                            
                        </display:column>
                        </axis:visible>
                        
                        <axis:visible c="IAPUNTE" f="axisadm082"> 
                        <display:column title="${title4}" sortable="true" sortProperty="IAPUNTE" headerClass="sortable"  media="html" autolink="false" style="width:5%">
                            <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LISTAAPUNTES.IAPUNTE}"/></div>                            
                        </display:column> 
                        </axis:visible>                                                                                                                            
               
                        </display:table>                                                               
                    </div>
                </td>
            </tr>
        </table>
        
        <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisadm082</c:param>
                <c:param name="__botones">cancelar,9000508,nuevo</c:param>
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