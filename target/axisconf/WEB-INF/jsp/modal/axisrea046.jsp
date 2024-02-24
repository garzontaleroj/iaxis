<%/**
*  Fichero: axisrea046.jsp
*  @author <a href="mailto:jpacheco@csi-ti.com">Juan Carlos Pacheco</a>
*  
*   
*  Modal buscador de productos. 
*
*  Fecha: 10/09/2015
* Aplicando estilos nuevos/experimentales - 24.4.2008
*/
%>

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


<script language="Javascript" type="text/javascript">
    function f_onload() {
        revisarEstilos();
          document.miForm.NPOLIZA.focus();  
        f_cargar_propiedades_pantalla();        
    }
   
    // Primero miramos si hay alguna opción de la lista seleccionada
    function f_but_aceptar() {                    
        var hayChecked = objUtiles.f_GuardaCasillasChecked("radioProducto");
        if(typeof hayChecked == 'boolean') {
            alert(objJsMessages.jslit_selecciona_producto);
        }else{
            f_seleccionar (hayChecked);
        }
    }
    
    function f_but_cancelar() {                        
        parent.f_cerrar_modal("axisrea046");                         

    }
    
    function f_but_buscar(){
    var npoliza= document.getElementById('NPOLIZA').value;
    var nsinies= document.getElementById('NSINIES').value;
    var NRECIBO = document.getElementById("NRECIBO").value;
    var FINIEFE = document.getElementById("FINIEFE").value;
    var FFINEFE = document.getElementById("FFINEFE").value;
        if (objValidador.validaEntrada()) {
            if(!objUtiles.estaVacio(document.getElementById("but_aceptar"))) 
                objDom.setDisabledPorId("but_aceptar", true);
                if(npoliza.length>1 || nsinies.length>1 || !objUtiles.estaVacio(NRECIBO) ||
                        !objUtiles.estaVacio(FINIEFE) || !objUtiles.estaVacio(FFINEFE)){
                   objUtiles.ejecutarFormulario("modal_axisrea046.do", "busqueda_poliza", document.miForm, "_self", objJsMessages.jslit_cargando);
                }else{
                   // alert("<axis:alt f="axisrea046" c="MENSAJE2" lit="9908591"/>");  
                	  alert("<axis:alt f='axisrea046' c='BUT_BUSCAR' lit='9001867'/>\n<axis:alt f='axisrea046' c='NPOLIZA' lit='800242'/>, <axis:alt f='axisrea046' c='NSINIES' lit='101298'/>,<axis:alt f='axisrea046' c='NRECIBO' lit='800636'/>, <axis:alt f='axisrea046' c='FINIEFE' lit='1000556'/>, <axis:alt f='axisrea046' c='FFINEFE' lit='1000557'/>");
                     
                }
                
        }
     }
    
    function f_seleccionar(SPRODUC){
        if (objUtiles.estaVacio(SPRODUC))
            alert (objJsMessages.jslit_error_de_seleccion);
        else
            parent.f_aceptar_axisrea046(SPRODUC);
     }  
     
     function f_llenar_ramos(valor){
           objAjax.invokeAsyncCGI("modal_axisrea046.do", callbackAjaxRecuperarRamos, "operation=ajax_recuperar_ramos&CVALOR="+valor, this, objJsMessages.jslit_actualizando_registro);
    }
    
    function callbackAjaxRecuperarRamos(ajaxResponseText){
            try {  
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                                
                    var elementos = doc.getElementsByTagName("element");
                    var modelocombo = document.miForm.RAMO;     
                    objDom.borrarOpcionesDeCombo(modelocombo);
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        var elementos = doc.getElementsByTagName("element");
                        var modelocombo = document.miForm.RAMO;     
                        objDom.borrarOpcionesDeCombo(modelocombo);
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "<axis:alt f="axisrea046" c="RAMO" lit="108341"/>", modelocombo, 0);
                        for (i = 0; i < elementos.length; i++) {
                            var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CRAMO")[0]) ?
                                         objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CRAMO"), 0, 0) : "";
                            var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TRAMO")[0]) ?
                                         objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TRAMO"), 0, 0): "";
                            objDom.addOpcionACombo(codigo, desc, modelocombo, i+1);
                        }
                        
                    }
                    if (elementos.length == 0){
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "Seleccione", modelocombo, 0);
                        var elementos = doc.getElementsByTagName("element");
                        var versioncombo = document.miForm.RAMO;     
                        objDom.borrarOpcionesDeCombo(versioncombo);
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "Seleccione", versioncombo, 0);
                    }
                    
                } 
             } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
               }
            }
            
  			//INI - AXIS 4105 - 05/06/2019 - AABG - SE AGREGA NUEVO PARAMETRO MOVIMIENTO
            function f_seleccionar_poliza(NPOLIZA,NSINIESTRO,SSEGURO,CGENERA, NMOVIGEN){
                //alert('NPOLIZA: '+NPOLIZA+'  , NSINIESTRO: '+NSINIESTRO + 'NMOVIGEN: '+NMOVIGEN);
                
                parent.f_set_poliza(NPOLIZA,NSINIESTRO,SSEGURO,CGENERA, NMOVIGEN);
            }
          //FIN - AXIS 4105 - 05/06/2019 - AABG - SE AGREGA NUEVO PARAMETRO MOVIMIENTO
    
</script>
</head>
<body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisrea046" c="formulario" lit="1000188"/></c:param>
            <c:param name="producto"><axis:alt f="axisrea046" c="producto" lit="1000188"/></c:param>
            <c:param name="form">axisrea046</c:param>
        </c:import>

        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">        
            <tr>
                <td>
                    <table class="seccion">
                        <tr>
                            <!-- No poliza -->                                      
                            <axis:ocultar f="axisrea046" c="NPOLIZA" dejarHueco="false"> 
                                <td class="titulocaja">
                                   <b><axis:alt f="axisrea046" c="NPOLIZA" lit="9001514"/></b>
                                </td>
                           </axis:ocultar>
                           
                           <!-- No recibo -->                                      
                            <axis:ocultar f="axisrea046" c="NRECIBO" dejarHueco="false"> 
                                <td class="titulocaja">
                                   <b><axis:alt f="axisrea046" c="NRECIBO" lit="111838"/></b>
                                </td>
                           </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisrea046" c="NPOLIZA" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           value="${__formdata['NPOLIZA']}"
                                           name="NPOLIZA" id="NPOLIZA" size="15"
                                           formato="entero"
                                           title='<axis:alt f="axisrea046" c="NPOLIZA" lit="9001514"/>'
                                           <c:if test="${!empty __formdata['MODO'] && __formdata['MODO']=='APERTURASINIESTROS'}">readonly</c:if>/>
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisrea046" c="NRECIBO" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           value="${__formdata['NRECIBO']}"
                                           name="NRECIBO" id="NRECIBO" size="15"
                                           formato="entero"
                                           title='<axis:alt f="axisrea046" c="NRECIBO" lit="111838"/>'/>
                                </td>
                                </axis:ocultar>
                           </tr>
                          <tr>
                          	     <!-- Fecha inicio efecto -->
                                <axis:ocultar f="axisrea046" c="FINIEFE" dejarHueco="false"> 
                                <td class="titulocaja">
                                   <b><axis:alt f="axisrea046" c="FINIEFE" lit="1000556"/></b>
                                </td>
                                </axis:ocultar>
                                
                                <!-- Fecha fin efecto -->
                                <axis:ocultar f="axisrea046" c="FFINEFE" dejarHueco="false"> 
                                <td class="titulocaja">
                                   <b><axis:alt f="axisrea046" c="FFINEFE" lit="1000557"/></b>
                                </td>
                                </axis:ocultar>
                          	
                          </tr>
                          <tr>
                          
                          	<axis:ocultar f="axisrea046" c="FINIEFE" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FINIEFE" name="FINIEFE" size="15" 
                                                <axis:atr f="axisrea046" c="FINIEFE" a="formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FINIEFE']}"/>" style="width:35%"
                                                title="<axis:alt f="axisrea046" c="FINIEFE" lit="1000556"/>"/><a style="vertical-align:middle;"><img
                                                id="icon_FINIEFE" alt="<axis:alt f="axisrea046" c="FINIEFE" lit="108341"/>" title="<axis:alt f="axisrea046" c="FINIEFE" lit="108341" />" src="images/calendar.gif"/></a>
                                            </td>
                            </axis:ocultar>
                           	
                           	<axis:ocultar f="axisrea046" c="FFINEFE" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FFINEFE" name="FFINEFE" size="15" 
                                                <axis:atr f="axisrea046" c="FFINEFE" a="formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FFINEFE']}"/>" style="width:35%"
                                                title="<axis:alt f="axisrea046" c="FFINEFE" lit="1000557"/>"/><a style="vertical-align:middle;"><img
                                                id="icon_FFINEFE" alt="<axis:alt f="axisrea046" c="FFINEFE" lit="108341"/>" title="<axis:alt f="axisrea046" c="FFINEFE" lit="108341" />" src="images/calendar.gif"/></a>
                                            </td>
                            </axis:ocultar>
                           
                          
                          </tr>
                          <tr>   
                           
                                <!-- Siniestro -->
                                <axis:ocultar f="axisrea046" c="NSINIES" dejarHueco="false"> 
                                <td class="titulocaja">
                                   <b><axis:alt f="axisrea046" c="NSINIES" lit="101298"/></b>
                                </td>
                                </axis:ocultar>
                          
                          </tr>
                          <tr>
                           
                             <!-- Siniestro -->
                                <axis:ocultar f="axisrea046" c="NSINIES" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           value="${__formdata['NSINIES']}"
                                           name="NSINIES" id="NSINIES" size="15"
                                           formato="entero"
                                           title='<axis:alt f="axisrea046" c="SINIESTRO" lit="101298"/>'/>
                                </td>
                                </axis:ocultar>
                           
                        </tr>
                    </table>
                    <div class="separador">&nbsp;</div>

                                    <c:set var="title1">
                                        <axis:alt f="axisrea046" c="NPOLIZA" lit="9001514"/>
                                    </c:set>
                                    <c:set var="title2">
                                        <axis:alt f="axisrea046" c="SINIS" lit="101298"/>
                                    </c:set>
                                    <c:set var="title3">
                                        <axis:alt f="axisrea046" c="CERTIF" lit="101300"/>
                                    </c:set>
                                    <c:set var="title4">
                                        <axis:alt f="axisrea046" c="ESTAT_SINIS" lit="112259"/>
                                    </c:set>
                                    <c:set var="title5">
                                        <axis:alt f="axisrea046" c="DESC_PRODUCTO" lit="1000111"/>
                                    </c:set>
                                    <c:set var="title7">
                                       <axis:alt f="axisrea046" c="FEFECTO" lit="100883"></axis:alt>
                                    </c:set>
                                    
                                    <c:set var="title8">
                                       <axis:alt f="axisrea046" c="DESMOVIMI" lit="1000298"></axis:alt>
                                    </c:set>
                   <!-- INI - AXIS 4105 - 05/06/2019 - AABG - SE AGREGA NUEVO PARAMETRO MOVIMIENTO AL LLAMADO DEL METODO F_SELECCIONAR_POLIZA -->
                      <div class="seccion displayspaceGrande">
                                        <display:table name="${__formdata.AXISSIN_POLIZAS}"
                                                       id="miListaPolizas"
                                                       export="false"
                                                       class="dsptgtable"
                                                       pagesize="4"
                                                       defaultsort="2"
                                                       defaultorder="ascending"
                                                       requestURI="modal_axisrea046.do?paginar=true"
                                                       sort="list"
                                                       cellpadding="0"
                                                       cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>  
                                            <display:column title="${title1}"
                                                            sortable="true"
                                                            sortProperty="NPOLIZA"
                                                            headerClass="headwidth10 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspNumber">
                                                    <a onclick="f_seleccionar_poliza('${miListaPolizas.NPOLIZA}','${miListaPolizas.NSINIES}','${miListaPolizas.SSEGURO}','${miListaPolizas.CGENERA}','${miListaPolizas.NMOVIGEN}');"> 
                                                        ${miListaPolizas['NPOLIZA']}
                                                    </a>
                                                </div>
                                            </display:column>
                                            
                                            <!-- ini bug 0021781 -->
                                            <axis:visible c="NCERTIF2" f="axisrea046"> 
                                            <display:column title="${title2}"
                                                            sortable="true"
                                                            sortProperty="NSINIES"

                                                            headerClass="headwidth10 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspNumber">
                                                    <a onclick="f_seleccionar_poliza('${miListaPolizas.NPOLIZA}','${miListaPolizas.NSINIES}','${miListaPolizas.SSEGURO}','${miListaPolizas.CGENERA}','${miListaPolizas.NMOVIGEN}');"> 
                                                        ${miListaPolizas['NSINIES']}

                                                    </a>
                                                </div>
                                            </display:column>       
                                            </axis:visible>
                                            <axis:visible c="CERTIF" f="axisrea046"> 
                                            <display:column title="${title3}"
                                                            sortable="true"
                                                            sortProperty="TPRODUC"
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                    <a onclick="f_seleccionar_poliza('${miListaPolizas.NPOLIZA}','${miListaPolizas.NSINIES}','${miListaPolizas.SSEGURO}','${miListaPolizas.CGENERA}','${miListaPolizas.NMOVIGEN}');"> 
                                                        ${miListaPolizas['NCERTIF']}
                                                    </a>
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            <!-- fin bug 0021781 -->
                                            <axis:visible c="TPRODUC_CAB" f="axisrea046"> 
                                            <display:column title="${title5}"
                                                            sortable="true"
                                                            sortProperty="TPRODUC"
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                    <a onclick="f_seleccionar_poliza('${miListaPolizas.NPOLIZA}','${miListaPolizas.NSINIES}','${miListaPolizas.SSEGURO}','${miListaPolizas.CGENERA}','${miListaPolizas.NMOVIGEN}');"> 
                                                        ${miListaPolizas['TPRODUC']}
                                                    </a>
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisrea046" c="FEFECTO">
                                            <display:column title="${title7}"
                                                            sortable="true"
                                                            sortProperty="FEFECTO"
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                  <a onclick="f_seleccionar_poliza('${miListaPolizas.NPOLIZA}','${miListaPolizas.NSINIES}','${miListaPolizas.SSEGURO}','${miListaPolizas.CGENERA}','${miListaPolizas.NMOVIGEN}');"> 
                                                        <fmt:formatDate value="${miListaPolizas['FEFECTO']}" pattern="dd/MM/yyyy"/>
                                                    </a>
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible c="TAGENTE_CAB" f="axisrea046"> 
                                            <display:column title="${title8}"
                                                            sortable="true"
                                                            sortProperty="TAGENTE"
                                                            headerClass="headwidth10 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspNumber">
                                                        ${miListaPolizas['DESCMOVIMI']}
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                        </display:table>
                                        <c:choose>
                                            <c:when test="${!empty  __formdata.AXISSIN_POLIZAS}">
                                                <script language="javascript">//objUtiles.retocarDsptagtable("miListaId");</script>
                                            </c:when>
                                            <c:otherwise>
                                                <script language="javascript">
                                                        </script>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <!-- FIN - AXIS 4105 - 05/06/2019 - AABG - SE AGREGA NUEVO PARAMETRO MOVIMIENTO AL LLAMADO DEL METODO F_SELECCIONAR_POLIZA -->
                                    </td>
                </tr>
        </table>
        
        <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisrea046</c:param>
                <c:param name="__botones">cancelar,buscar</c:param>
            </c:import>   
    </form>
    <script type="text/javascript">
			Calendar.setup({
				inputField     :    "FINIEFE",
				ifFormat       :    "%d/%m/%Y",
				button         :    "icon_FINIEFE", 
				singleClick    :    true,
				firstDay       :    1
			});
			Calendar.setup({
				inputField     :    "FFINEFE",
				ifFormat       :    "%d/%m/%Y",
				button         :    "icon_FFINEFE", 
				singleClick    :    true,
				firstDay       :    1
			});
	</script>
    <c:import url="../include/mensajes.jsp" />
    
</body>
</html>