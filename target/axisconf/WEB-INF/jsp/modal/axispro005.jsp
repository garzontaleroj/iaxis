<%--/**
*  Fichero: axispro005.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*  
*  T?tulo: Modal Datos de gestión
*
*  Fecha: 21/04/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
<head>
    <title><axis:alt f="axispro005" c="P" lit="1000182"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        
        function f_onload(){                
            if(!objUtiles.estaVacio(objDom.getValorPorId("hay_cambios_en_duraciones")) 
                    && objUtiles.utilEquals(objDom.getValorPorId("hay_cambios_en_duraciones"), "true")){
                objDom.setVisibilidadPorId("but_cancelar", "hidden");
            }

            var ok = "${__formdata.OK}"; 
            if (!objUtiles.estaVacio(ok) && objUtiles.utilEquals(ok,"0"))
                parent.f_aceptar_axispro003( "axispro005");   
                
            f_cargar_propiedades_pantalla();            
        }
        
        function f_aceptar_axispro005(pantalla_que_llama){
            //Que pantalla modal llama a esta función. En función de quien sea, lo borramos 
            if(!objUtiles.estaVacio(pantalla_que_llama) && objUtiles.utilEquals(pantalla_que_llama, "axispro005")) 
                f_cerrar_modal("axispro005");
            else if(!objUtiles.estaVacio(pantalla_que_llama) && objUtiles.utilEquals(pantalla_que_llama, "axispro011")) 
                f_cerrar_modal("axispro011");
            
            objUtiles.ejecutarFormulario("modal_axispro005.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_aceptar(){
            if(objValidador.validaEntrada()){
                
          /*      var SPRODUC = ((document.getElementById("SPRODUC"))? objDom.getValorPorId("SPRODUC") : null);
                var CDURACI = ((document.getElementById("TDURACI"))? objDom.getValorPorId("TDURACI") : null);
                var CTEMPOR = ((document.getElementById("TTEMPOR"))? objDom.getValorPorId("TTEMPOR") : null);
                var NDURCOB = ((document.getElementById("NDURCOB"))? objDom.getValorPorId("NDURCOB") : null);
                var CDURMIN = ((document.getElementById("TDURMIN"))? objDom.getValorPorId("TDURMIN") : null);
                var NVTOMIN = ((document.getElementById("NVTOMIN"))? objDom.getValorPorId("NVTOMIN") : null);
                var CDURMAX = ((document.getElementById("TDURMAX"))? objDom.getValorPorId("TDURMAX") : null);
                var NVTOMAX = ((document.getElementById("NVTOMAX"))? objDom.getValorPorId("NVTOMAX") : null);
                var CTIPEFE = ((document.getElementById("TTIPEFE"))? objDom.getValorPorId("TTIPEFE") : null);
                var NRENOVA = ((document.getElementById("NRENOVA"))? objDom.getValorPorId("NRENOVA") : null);
                var CMODREN = ((document.getElementById("CMODREN"))? ((document.miForm.CMODREN.checked)? 1 :0) : null);
                var CPRODCAR = ((document.getElementById("TPRODCAR"))? ((document.miForm.TPRODCAR.checked)? 1 :0) : null);
                        var CREVALI = ((document.getElementById("TREVALI"))? objDom.getValorPorId("TREVALI") : null);
                
                var PREVALI = ((document.getElementById("PREVALI"))? objDom.getValorPorId("PREVALI") : null);
                if( PREVALI != null && (parseFloat(PREVALI)<0 || parseFloat(PREVALI)>100)){
                    alert("objJsMessages.jslit_error_precarg");
                    return;
                }
                
                var IREVALI = ((document.getElementById("IREVALI"))? objDom.getValorPorId("IREVALI") : null);
                var CTARMAN = ((document.getElementById("TTARMAN"))? objDom.getValorPorId("TTARMAN") : null);
                var CREASEG = ((document.getElementById("TREASEG"))? objDom.getValorPorId("TREASEG") : null);
                var CRETENI = ((document.getElementById("TRETENI"))? objDom.getValorPorId("TRETENI") : null);
                var CPRORRA = ((document.getElementById("TPRORRA"))? objDom.getValorPorId("TPRORRA") : null);
                var CPRIMIN = ((document.getElementById("TPRIMIN"))? objDom.getValorPorId("TPRIMIN") : null);
                var IPRIMIN = ((document.getElementById("IPRIMIN"))? objDom.getValorPorId("IPRIMIN") : null);
                var CCLAPRI = ((document.getElementById("TCLAPRI"))? objDom.getValorPorId("TCLAPRI") : null);
                var IPMINFRA = ((document.getElementById("IPMINFRA"))? objDom.getValorPorId("IPMINFRA") : null);
                var NEDAMIC = ((document.getElementById("NEDAMIC"))? objDom.getValorPorId("NEDAMIC") : null);
                var CIEDMIC = ((document.getElementById("CIEDMIC"))? ((document.miForm.CIEDMIC.checked)? 1 :0) : null);
                var CIEDMAC = ((document.getElementById("CIEDMAC"))? ((document.miForm.CIEDMAC.checked)? 1 :0) : null);
                var NEDAMAC = ((document.getElementById("NEDAMAC"))? objDom.getValorPorId("NEDAMAC") : null);
                var NEDAMAR = ((document.getElementById("NEDAMAR"))? objDom.getValorPorId("NEDAMAR") : null);
                var CIEDMAR = ((document.getElementById("CIEDMAR"))? ((document.miForm.CIEDMAR.checked)? 1 :0) : null);
                var NIEDMI2C = ((document.getElementById("NIEDMI2C"))? objDom.getValorPorId("NIEDMI2C") : null);
                var CIEMI2C = ((document.getElementById("CIEMI2C"))? ((document.miForm.CIEMI2C.checked)? 1 :0) : null);
                var NEDMA2C = ((document.getElementById("NEDMA2C"))? objDom.getValorPorId("NEDMA2C") : null);
                var CIEMA2C = ((document.getElementById("CIEMA2C"))? ((document.miForm.CIEMA2C.checked)? 1 :0) : null);
                var NEDMA2R = ((document.getElementById("NEDMA2R"))? objDom.getValorPorId("NEDMA2R") : null);
                var CIEMA2R = ((document.getElementById("CIEMA2R"))? ((document.miForm.CIEMA2R.checked)? 1 :0) : null);
                var NSEDMAC = ((document.getElementById("NSEDMAC"))? objDom.getValorPorId("NSEDMAC") : null);
                var CISEMAC = ((document.getElementById("CISEMAC"))? ((document.miForm.CISEMAC.checked)? 1 :0) : null);
                var CVINPOL = ((document.getElementById("CVINPOL"))? ((document.miForm.CVINPOL.checked)? 1 :0) : null);
                var CVINPRE = ((document.getElementById("CVINPRE"))? ((document.miForm.CVINPRE.checked)? 1 :0) : null);
                var CCUESTI = ((document.getElementById("CCUESTI"))? ((document.miForm.CCUESTI.checked)? 1 :0) : null);
                var CCTACOR = ((document.getElementById("CCTACOR"))? ((document.miForm.CCTACOR.checked)? 1 :0) : null);
                
*/
           objUtiles.ejecutarFormulario("modal_axispro005.do", "setDatosGestion", document.miForm, "_self", objJsMessages.jslit_cargando);   
         
             /*   objAjax.invokeAsyncCGI("modal_axispro005.do", callbackAjaxSetDatos, "operation=ajax_set_datos&SPRODUC="+SPRODUC+"&CDURACI="+CDURACI+
                                            "&CTEMPOR="+CTEMPOR+"&NDURCOB="+NDURCOB+"&CDURMIN="+CDURMIN+"&NVTOMIN="+NVTOMIN+
                                            "&CDURMAX="+CDURMAX+"&NVTOMAX="+NVTOMAX+"&CTIPEFE="+CTIPEFE+"&NRENOVA="+NRENOVA+
                                            "&CMODREN="+CMODREN+"&CPRODCAR="+CPRODCAR+"&CREVALI="+CREVALI+"&PREVALI="+PREVALI+
                                            "&IREVALI="+IREVALI+"&CTARMAN="+CTARMAN+"&CREASEG="+CREASEG+"&CRETENI="+CRETENI+
                                            "&CPRORRA="+CPRORRA+"&CPRIMIN="+CPRIMIN+"&IPRIMIN="+IPRIMIN+"&CCLAPRI="+CCLAPRI+
                                            "&IPMINFRA="+IPMINFRA+"&NEDAMIC="+NEDAMIC+"&CIEDMIC="+CIEDMIC+"&NEDAMAC="+NEDAMAC+
                                            "&CIEDMAC="+CIEDMAC+"&NEDAMAR="+NEDAMAR+"&CIEDMAR="+CIEDMAR+"&NIEDMI2C="+NIEDMI2C+
                                            "&CIEMI2C="+CIEMI2C+"&NEDMA2C="+NEDMA2C+"&CIEMA2C="+CIEMA2C+"&NEDMA2R="+NEDMA2R+
                                            "&CIEMA2R="+CIEMA2R+"&NSEDMAC="+NSEDMAC+"&CISEMAC="+CISEMAC+
                                            "&CVINPOL="+CVINPOL+"&CVINPRE="+CVINPRE+"&CCUESTI="+CCUESTI+
                                            "&CCTACOR="+CCTACOR, this, objJsMessages.jslit_cargando);*/
            } 
        }
        
        function callbackAjaxSetDatos (ajaxResponseText){
          try{
                var doc=objAjax.domParse(ajaxResponseText);

                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_OK")[0]))
                       parent.f_aceptar_axispro005("axispro005");
                }
            }catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
         }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axispro005");
        }
        
        function f_abrir_modal_axispro011(){
            var SPRODUC = objDom.getValorPorId("SPRODUC");
            //Abrimos modal de duraciones
            objUtiles.abrirModal("axispro011", "src", "modal_axispro011.do?operation=form&SPRODUC=" + SPRODUC);    
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
    function actualitzarCheckbox(obj){
         objDom.setValorPorId(obj.name, ((objDom.getComponenteMarcado(obj))? "1" : "0" ));
    }
    function f_onchange() {
            // Recargar formulario para esconder/mostrar campos en función de 
            objUtiles.ejecutarFormulario("modal_axispro005.do?RECARGAR=0", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
    }
    </script>
</head>
 <body class=" " onload="f_onload()">

    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
    <input type="hidden" name="operation" value="" />
    <input type="hidden" id="SPRODUC" name="SPRODUC" value="${param.SPRODUC}" />
    
    <input type="hidden" id="hay_cambios_en_duraciones" name="hay_cambios_en_duraciones" value="${requestScope.hay_cambios_en_duraciones}" />
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axispro005" c="P005" lit="1000221"/></c:param>
        <c:param name="formulario"><axis:alt f="axispro005" c="P005" lit="1000221"/></c:param>
        <c:param name="form">axispro005</c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axispro011|<axis:alt f="axispro005" c="P011" lit="1000227"/></c:param>
    </c:import>

    <div class="separador">&nbsp;</div>
    <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                                <div class="notitulo"></div>
                                <table class="seccion" align="center" cellpadding="0" cellspacing="5">
                                    <tr>
                                        <td align="left">
                                            <tr>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                            </tr>
                                            <tr>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="NDURPER" lit="1000120" /></b>
                                                </td>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="TIT2" lit="1000466"/></b>
                                                </td>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="TIT3" lit="1000467"/></b>
                                                </td>
                                                <td rowspan="2">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                          
                                                                 <!-- DisplayTag Lista de duraciones permitidas -->
                                                                <c:set var="title0"><axis:alt f="axispro005" c="NUDPER2" lit="152979" /></c:set>
                                                                <div class="displayspace" style="height:45px;">
                                                                    <display:table name="${__formdata.DURPERIODOPROD}" id="LISTA" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                    requestURI="axis_axispro001.do?paginar=true&operation=gestion">
                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODDURPERIODO.NDURPER" headerClass="sortable" media="html" autolink="false" >
                                                                            <div class="dspText">${LISTA.OB_IAX_PRODDURPERIODO.NDURPER}</div>
                                                                        </display:column>
                                                                   </display:table>
                                                                </div>
                                                            <td>
                                                                <a href="javascript:f_abrir_modal_axispro011()"><img border="0" alt="<axis:alt f="axispro005" c="EDIT" lit="100002"/> <axis:alt f="axispro005" c="EDIT2" lit="152979"/>" title="<axis:alt f="axispro005" c="EDIT" lit="100002"/> <axis:alt f="axispro005" c="EDIT2" lit="152979"/>" src="images/lapiz.gif"/></a>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                                                   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="campocaja">
                                                    <select name="CDURACI" id="CDURACI" size="1" onchange="javascript:void(0)" class="campowidthselect campo campotexto"
                                                    obligatorio="true" title="<axis:alt f="axispro005" c="M1" lit="1000120"/>">                                        
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro005" c="M2" lit="108341"/> - </option>
                                                        <c:forEach var="TDURACI" items="${axispro001_listaCduraci}" varStatus="status">
                                                            <option <c:if test="${TDURACI.CATRIBU == __formdata.CDURACI}">selected</c:if> 
                                                                value = "${TDURACI.CATRIBU}">
                                                                ${TDURACI.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                <td class="campocaja">                                        
                                                    <select name="CTEMPOR"  id="CTEMPOR" size="1" onchange="javascript:void(0)" class="campowidthselect campo campotexto"
                                                    obligatorio="true" title="<axis:alt f="axispro005" c="M3" lit="1000466"/>">                                        
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro005" c="M4" lit="108341"/> - </option>
                                                        <c:forEach var="TTEMPOR" items="${axispro001_listaCtempor}" varStatus="status">
                                                            <option <c:if test="${TTEMPOR.CATRIBU == __formdata.CTEMPOR}">selected</c:if> 
                                                                value = "${TTEMPOR.CATRIBU}">
                                                                ${TTEMPOR.TATRIBU}
                                                            </option>
                                                        </c:forEach>    
                                                    </select>
                                                </td> 
                                                <td class="campocaja">                                        
                                                    <input type="text" class="campowidthinput campo campotexto" id="NDURCOB" name="NDURCOB" size="15"
                                                    value="${__formdata.NDURCOB}" formato="entero" title="<axis:alt f="axispro005" c="M5" lit="102862"/>"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="M6" lit="1000468" /></b>
                                                </td>
                                                <c:if test="${!empty __formdata.CDURMIN}">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="M7" lit="9000510" /></b>
                                                </td>
                                                </c:if>
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axispro005" c="M8" lit="1000469" /></b>
                                                </td>
                                                <c:if test="${!empty __formdata.CDURMAX}">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="M9" lit="9000511" /></b>
                                                </td>
                                                </c:if>
                                            </tr>
                                            <tr>
                                                <td class="campocaja">
                                                 <select name="CDURMIN"  id="CDURMIN" size="1" onchange="javascript:f_onchange()" class="campowidthselect campo campotexto">                                        
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro005" c="TATRIBU" lit="108341"/> - </option>
                                                        <c:forEach var="TDURMIN" items="${axispro001_listaCdurmin}" varStatus="status">
                                                            <option <c:if test="${TDURMIN.CATRIBU == __formdata.CDURMIN}">selected</c:if> 
                                                                value = "${TDURMIN.CATRIBU}">
                                                                ${TDURMIN.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                 <c:if test="${!empty __formdata.CDURMIN}">
                                                <td class="campocaja"> 
                                                   
                                                    <input formato="entero" maxlength="2" type="text" class="campowidthinput campo campotexto" id="NVTOMIN" name="NVTOMIN" size="15"
                                                    value="${__formdata.NVTOMIN}" />
                                                 <%--   <select name="NVTOMIN"  id="NVTOMIN" size="1" onchange="javascript:void(0)" class="campowidthselect campo campotexto">                                        
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro005" c="KK" lit="108341"/> - </option>
                                                        <c:forEach var="NVTOMIN" items="${axispro001_listaCdurmaxis}" varStatus="status">
                                                            <option <c:if test="${NVTOMIN.CATRIBU == __formdata.NVTOMIN}">selected</c:if> 
                                                                value = "${NVTOMIN.CATRIBU}">
                                                                ${NVTOMIN.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>--%>
                                                   
                                                </td> 
                                                 </c:if>
                                                 
                                               <td class="campocaja">
                                                    <select name="CDURMAX"  id="CDURMAX" size="1" onchange="javascript:f_onchange()" class="campowidthselect campo campotexto">                                        
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro005" c="CDURMAX" lit="108341"/> - </option>
                                                        <c:forEach var="TDURMAXa" items="${axispro001_listaCdurmaxis}" varStatus="status">
                                                            <option <c:if test="${TDURMAXa.CATRIBU == __formdata.CDURMAX}">selected</c:if> 
                                                                value = "${TDURMAXa.CATRIBU}">
                                                                ${TDURMAXa.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                 <c:if test="${!empty __formdata.CDURMAX}">
                                                <td class="campocaja">
                                                            <input formato="entero" maxlength="2" type="text" class="campowidthinput campo campotexto" id="NVTOMAX" name="NVTOMAX" size="15"
                                                            value="${__formdata.NVTOMAX}" />
                                                </td>
                                                </c:if>
                                            </tr>
                                        </td>
                                    </tr>
                                </table>
                                <!--SEGUNDA SUBSECCION -->
                                <div class="notitulo">&nbsp;</div>
                                <table class="seccion" align="center" cellpadding="0" cellspacing="5">
                                    <tr>
                                        <td align="left">
                                            <tr>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                            </tr>
                                            <tr>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="CTIPEFE" lit="1000470"/></b>
                                                </td>
                                                <c:if test="${__formdata.CTIPEFE==1}">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="NRENOVA" lit="1000597" /></b>
                                                </td>
                                                </c:if>
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axispro005" c="CMODNRE" lit="1000290"/></b>
                                                    <input <c:if test="${__formdata.CMODNRE == 1}">checked</c:if>  onClick="javascript:actualitzarCheckbox(this)"
                                                    type="checkbox" onClick="javascript:actualitzarCheckbox(this)" id="CMODNRE" name="CMODNRE" value="${__formdata.CMODNRE}" />
                                                </td> 
                                                
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axispro005" c="CPRODCAR" lit="112523"/></b>
                                                    <input <c:if test="${__formdata.CPRODCAR == 1}">checked</c:if> 
                                                    type="checkbox" onClick="javascript:actualitzarCheckbox(this)" id="CPRODCAR" name="CPRODCAR" value="${__formdata.CPRODCAR}" />
                                                </td> 
                                               
                                                                         
                                            </tr>
                                            <tr>
                                                <td class="campocaja">
                                                    <select name="CTIPEFE"  id="CTIPEFE" size="1" onchange="javascript:f_onchange()" class="campowidthselect campo campotexto"
                                                    obligatorio="true" title="<axis:alt f="axispro005" c="CTIPEFE" lit="1000470"/>">                                        
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro005" c="MINVAL" lit="108341"/> - </option>
                                                        <c:forEach var="TTIPEFE" items="${axispro001_listaCtipefe}" varStatus="status">
                                                            <option <c:if test="${TTIPEFE.CATRIBU == __formdata.CTIPEFE}">selected</c:if> 
                                                                value = "${TTIPEFE.CATRIBU}">
                                                                ${TTIPEFE.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                <c:if test="${__formdata.CTIPEFE==1}">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="NRENOVA" name="NRENOVA" size="15"
                                                    value="${__formdata.NRENOVA}"  />
                                                </td>
                                                </c:if>
                                                 
                                            </tr>
                                            <tr>
                                                <c:choose>
                                                    <c:when test="${__formdata.CREVALI == 2 || __formdata.CREVALI == 6 || __formdata.CREVALI == 1}">
                                                           <td class="titulocaja" colspan="2">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td class="titulocaja">
                                                    </c:otherwise>
                                                </c:choose>
                                                    <b><axis:alt f="axispro005" c="NOUSS" lit="109951" /></b>
                                                </td>
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axispro005" c="PREVALI" lit="100772" /></b>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                             
                                                <td class="campocaja">
                                                    <select name="CREVALI"  id="CREVALI" size="1" onchange="javascript:f_onchange()" class="campowidthselectbig campo campotexto">                                        
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro005" c="TATRIBU2" lit="108341"/> - </option>
                                                        <c:forEach var="TREVALI" items="${axispro001_listaCrevali}" varStatus="status">
                                                            <option <c:if test="${TREVALI.CATRIBU == __formdata.CREVALI}">selected</c:if> 
                                                                value = "${TREVALI.CATRIBU}">
                                                                ${TREVALI.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                 <c:if test="${__formdata.CREVALI == 2 || __formdata.CREVALI == 6}">
                                                <td class="campocaja">   
                                                  
                                                        <input formato="decimal" type="text" class="campowidthinput campo campotexto" style="width:90%" id="PREVALI" name="PREVALI" size="15"
                                                        value="<fmt:formatNumber pattern='###.##' value='${__formdata.PREVALI}'/>"  />%
                                                </td>
                                                </c:if>
                                                <c:if test="${__formdata.CREVALI == 1}">
                                                <td class="campocaja">   
                                                                <input formato="decimal" type="text" class="campowidthinput campo campotexto" id="IREVALI" name="IREVALI" size="15"
                                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IREVALI}'/>"  />
                                                </td>                         
                                                </c:if>
                                                <td  class="campocaja"> 
                                                   <select name="CTARMAN"  id="CTARMAN" size="1" onchange="javascript:void(0)" class="campowidthselectbig campo campotexto" style="width:95%;"
                                                   obligatorio="true" title="<axis:alt f="axispro005" c="TATRIBU3" lit="100772"/>">                                        
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro005" c="MINVAL" lit="108341"/> - </option>
                                                        <c:forEach var="TTARMAN" items="${axispro001_listaCtarman}" varStatus="status">
                                                            <option <c:if test="${TTARMAN.CATRIBU == __formdata.CTARMAN}">selected</c:if> 
                                                                value = "${TTARMAN.CATRIBU}">${TTARMAN.TATRIBU}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                        </td>
                                    </tr>
                                </table>
                                <!--TERCERA SUBSECCION -->
                                <div class="notitulo">&nbsp;</div>
                                <table class="seccion" align="center" cellpadding="0" cellspacing="5">                
                                    <tr>
                                        <td align="left">
                                            <tr>
                                                    <th style="width:100%;height:0px"></th>
                                            </tr>
                                            <tr>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="CREASEG" lit="100956" /></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="campocaja">
                                                    <select name="CREASEG"  id="CREASEG" size="1" style="width:20%" onchange="javascript:void(0)" class="campowidthselectmedium campo campotexto">                                        
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro005" c="MINVAL" lit="108341"/> - </option>
                                                        <c:forEach var="TREASEG" items="${axispro001_listaSino}" varStatus="status">
                                                            <option <c:if test="${TREASEG.CATRIBU == __formdata.CREASEG}">selected</c:if> 
                                                                value = "${TREASEG.CATRIBU}">
                                                                ${TREASEG.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                    
                                                </td>
                                            </tr>
                                        </td>
                                    </tr>
                                </table>
                                <!--CUARTA SUBSECCION -->
                                <div class="notitulo">&nbsp;</div>
                                <table class="seccion" align="center" cellpadding="0" cellspacing="5">
                                    <tr>
                                        <td align="left">
                                            <tr>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                            </tr>
                                            <tr>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="CRETENI" lit="1000471" /></b>
                                                </td>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="CPRORRA" lit="1000472"/></b>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td class="campocaja">
                                                    <select name="CRETENI"  id="CRETENI" size="1" onchange="javascript:void(0)" class="campowidthselect campo campotexto">                                        
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro005" c="MINVAL" lit="108341"/> - </option>
                                                        <c:forEach var="TRETENI" items="${axispro001_listaCreteni}" varStatus="status">
                                                            <option <c:if test="${TRETENI.CATRIBU == __formdata.CRETENI}">selected</c:if> 
                                                                value = "${TRETENI.CATRIBU}">
                                                                ${TRETENI.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                <td class="campocaja" >                                        
                                                    <select name="CPRORRA"  id="CPRORRA" size="1" onchange="javascript:void(0)" class="campowidthselectmeddium campo campotexto" >                                        
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro005" c="MINVAL" lit="108341"/> - </option>
                                                        <c:forEach var="TPRORRA" items="${axispro001_listaCprorra}" varStatus="status">
                                                            <option <c:if test="${TPRORRA.CATRIBU == __formdata.CPRORRA}">selected</c:if> 
                                                                value = "${TPRORRA.CATRIBU}">
                                                                ${TPRORRA.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                <tr>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="TIT4" lit="1000473" /></b>
                                                </td>
                                                 <c:if test="${__formdata.CPRIMIN==0}"> 
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="TIT56" lit="1000477"/></b>
                                                </td>
                                                </c:if>
                                                
                                                 <c:if test="${__formdata.CPRIMIN==1}"> 
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axispro005" c="TIT6" lit="108347"/>&nbsp;<axis:alt f="axispro005" c="TIT61" lit="1000491"/></b>
                                                </td>
                                                </c:if>
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axispro005" c="TIT7" lit="109608"/></b>
                                                </td>
                                                </tr>
                                                <tr>
                                                <td class="campocaja">
                                                    <select name="CPRIMIN"  id="CPRIMIN" size="1" onchange="javascript:f_onchange()" class="campowidthselect campo campotexto">                                        
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro005" c="MINVAL" lit="108341"/> - </option>
                                                        <c:forEach var="TPRIMIN" items="${axispro001_listaCprimin}" varStatus="status">
                                                            <option <c:if test="${TPRIMIN.CATRIBU == __formdata.CPRIMIN}">selected</c:if> 
                                                                value = "${TPRIMIN.CATRIBU}">
                                                                ${TPRIMIN.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                <c:if test="${__formdata.CPRIMIN==0}"> 
                                                <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" id="IPRIMIN" name="IPRIMIN" size="15"
                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IPRIMIN}'/>" formato="decimal" title="<axis:alt f="axispro005" c="IPRIMIN" lit="102659"/>"/>
                                                </td>
                                                </c:if>
                                                
                                                <c:if test="${__formdata.CPRIMIN==1}"> 
                                                <td class="campocaja" colspan="2">
                                                            <select name="CCLAPRI"  id="CCLAPRI" size="1" onchange="javascript:void(0)" class="campowidthselect campo campotexto">                                        
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro005" c="MINVAL" lit="108341"/> - </option>
                                                            <c:forEach var="TCLAPRI" items="${axispro001_listaFormulas}" varStatus="status">
                                                                <option <c:if test="${TCLAPRI.CLAVE == __formdata.CCLAPRI}">selected</c:if> 
                                                                    value = "${TCLAPRI.CLAVE}">
                                                                    ${TCLAPRI.FORMULA}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                </td>
                                                </c:if>
                                                
                                                <td class="campocaja">     
                                                    <input type="text" class="campowidthinput campo campotexto" id="IPMINFRA" name="IPMINFRA" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${__formdata.IPMINFRA}'/>" formato="decimal" title="<axis:alt f="axispro005" c="IPMINDFRA" lit="109608"/>"/>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </td>
                                    </tr>
                                </table>
                                <!--QUINTA SUBSECCION -->
                                <div class="notitulo">&nbsp;</div>
                                <table class="seccion" align="center" cellpadding="0" cellspacing="5">
                                    <tr>
                                        <td align="left">
                                            <tr>
                                                <th style="width:15%;height:0px"></th>
                                                <th style="width:15%;height:0px"></th>
                                                <th style="width:15%;height:0px"></th>
                                                <th style="width:15%;height:0px"></th>
                                                <th style="width:15%;height:0px"></th>
                                                <th style="width:15%;height:0px"></th>
                                            </tr>
                                            <tr>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="CIEDMIC" lit="9001544"/></b>
                                                    <input  <c:if test="${__formdata.CIEDMIC == 1}">checked</c:if> 
                                                    type="checkbox" onClick="javascript:actualitzarCheckbox(this);" id="CIEDMIC" name="CIEDMIC" value="${__formdata.CIEDMIC}" />
                                                </td>   
                                                
                                                <td class="campocaja">
                                                    <input maxlength="3" type="text" class="campowidthinput campo campotexto" id="NEDAMIC" name="NEDAMIC" size="15"
                                                    value="${__formdata.NEDAMIC}" formato="entero" title="<axis:alt f="axispro005" c="NEDAMIC" lit="100717" />"/>
                                                </td>
                                                
                                               
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="CIEDMAC" lit="9001545"/></b>
                                                    <input <c:if test="${__formdata.CIEDMAC == 1}">checked</c:if> 
                                                    type="checkbox" onClick="javascript:actualitzarCheckbox(this);" id="CIEDMAC" name="CIEDMAC" value="${__formdata.CIEDMAC}" />
                                                </td>  
                                                
                                                <td class="campocaja">
                                                    <input maxlength="3" type="text" class="campowidthinput campo campotexto" id="NEDAMAC" name="NEDAMAC" size="15"
                                                    value="${__formdata.NEDAMAC}" formato="entero" title="<axis:alt f="axispro005" c="NEDAMAC" lit="100718" />"/>
                                                </td>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="CIEDMAR" lit="9001546"/></b>
                                                    <input <c:if test="${__formdata.CIEDMAR == 1}">checked</c:if> 
                                                    type="checkbox" onClick="javascript:actualitzarCheckbox(this);" id="CIEDMAR" name="CIEDMAR" value="${__formdata.CIEDMAR}" />
                                                </td>
                                          
                                                <td class="campocaja">
                                                    <input maxlength="3" type="text" class="campowidthinput campo campotexto" id="NEDAMAR" name="NEDAMAR" size="15"
                                                    value="${__formdata.NEDAMAR}" formato="entero" title="<axis:alt f="axispro005" c="NEDAMAR" lit="100719" />"/>
                                                </td>
                                          
                                            </tr>
                                            <tr>
                                              
                                                
                                                
                                            </tr>
                                            <c:if test="${!empty __formdata.C2CABEZAS && __formdata.C2CABEZAS == 1}">
                                            <tr>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="CIEMI2C" lit="1000122"/></b>
                                                    <input <c:if test="${__formdata.CIEMI2C == 1}">checked</c:if> 
                                                    type="checkbox" onClick="javascript:actualitzarCheckbox(this)" id="CIEMI2C" name="CIEMI2C" value="${__formdata.CIEMI2C}" />
                                                </td>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="CIEMA2C" lit="9001548"/></b>
                                                    <input <c:if test="${__formdata.CIEMA2C == 1}">checked</c:if> 
                                                    type="checkbox" onClick="javascript:actualitzarCheckbox(this)" id="CIEMA2C" name="CIEMA2C" value="${__formdata.CIEMA2C}" />
                                                </td>
                                                <td class="titulocaja">
                                                     <b><axis:alt f="axispro005" c="CIEMAR2" lit="9001547"/></b>
                                                     <input <c:if test="${__formdata.CIEMA2R == 1}">checked</c:if> 
                                                    type="checkbox"  onClick="javascript:actualitzarCheckbox(this)" id="CIEMA2R" name="CIEMA2R" value="${__formdata.CIEMA2R}" />
                                                </td>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axispro005" c="CISEMAC" lit="9001549"/></b>
                                                    <input <c:if test="${__formdata.CISEMAC == 1}">checked</c:if> 
                                                    type="checkbox" onClick="javascript:actualitzarCheckbox(this)" id="CISEMAC" name="CISEMAC" value="${__formdata.CISEMAC}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="campocaja">
                                                    <input maxlength="3" type="text" class="campowidthinputbig campo campotexto" id="NEDMI2C" name="NEDMI2C" size="15"
                                                    value="${__formdata.NEDMI2C}" formato="entero" title="<axis:alt f="axispro005" c="NEDMI2C" lit="1000122" />"/>
                                                </td>
                                                <td class="campocaja">
                                                    <input maxlength="3" type="text" class="campowidthinputbig campo campotexto" id="NEDMA2C" name="NEDMA2C" size="15"
                                                    value="${__formdata.NEDMA2C}" formato="entero" title="<axis:alt f="axispro005" c="NEDMA2C" lit="1000121" />"/>
                                                </td>
                                                <td class="campocaja">
                                                    <input maxlength="3" type="text" class="campowidthinputbig campo campotexto" id="NEDMA2R" name="NEDMA2R" size="15"
                                                    value="${__formdata.NEDMA2R}" formato="entero" title="<axis:alt f="axispro005" c="NEDMAR2" lit="1000123" />"/>
                                                </td>
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinputbig campo campotexto" id="NSEDMAC" name="NSEDMAC" size="15"
                                                    value="${__formdata.NSEDMAC}" formato="entero" title="<axis:alt f="axispro005" c="NSEDMAC" lit="1000353" />"/>
                                                </td>
                                            </tr>
                                            </c:if>
                                         </td>
                                    </tr>
                                </table>
                                <!--SEXTA SUBSECCION -->
                                <div class="notitulo">&nbsp;</div>
                                <table class="seccion" align="center" cellpadding="0" cellspacing="5">
                                    <tr>
                                        <td align="left">
                                            <tr>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                            </tr>
                                            <tr>
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axispro005" c="CVINPOL" lit="1000474" /></b>
                                                    <input <c:if test="${__formdata.CVINPOL == 1}">checked</c:if> 
                                                    type="checkbox" onClick="javascript:actualitzarCheckbox(this)" id="CVINPOL" name="CVINPOL" value="${__formdata.CVINPOL}" />
                                                </td>                           
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axispro005" c="CVINPRE" lit="9000507" /></b>
                                                    <input <c:if test="${__formdata.CVINPRE == 1}">checked</c:if> 
                                                    type="checkbox" onClick="javascript:actualitzarCheckbox(this)" id="CVINPRE" name="CVINPRE" value="${__formdata.CVINPRE}" />
                                                </td>                           
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axispro005" c="CCUESTI" lit="104734" /></b>
                                                    <input <c:if test="${__formdata.CCUESTI == 1}">checked</c:if> 
                                                    type="checkbox" onClick="javascript:actualitzarCheckbox(this)" id="CCUESTI"" name="CCUESTI"" value="${__formdata.CCUESTI}" />
                                                </td>                           
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axispro005" c="CCTACOR" lit="151638" /></b>
                                                    <input onClick="javascript:actualitzarCheckbox(this)" <c:if test="${__formdata.CCTACOR == 1}">checked="true"</c:if> 
                                                    type="checkbox" onClick="javascript:actualitzarCheckbox(this)" id="CCTACOR" name="CCTACOR" value="${__formdata.CCTACOR}"/>
                                                </td>  
                                                <axis:ocultar c="CPREAVISO" f="axisper017" dejarHueco="false" >
	                                                <td class="titulocaja" >
	                                                    <b><axis:alt f="axispro005" c="CPREAVISO" lit="9903597" /></b>
	                                                    <input onClick="javascript:actualitzarCheckbox(this)" <c:if test="${__formdata.CPREAVISO == 1}">checked="true"</c:if> 
	                                                    type="checkbox" onClick="javascript:actualitzarCheckbox(this)" id="CPREAVISO" name="CPREAVISO" value="${__formdata.CPREAVISO}"/>
	                                                </td>
                                                </axis:ocultar>
                                            
                                            </tr>
                                        </td>
                                    </tr>
                                </table>
                            
                </td>
            </tr>
        </table>
        <div class="separador">&nbsp;</div>
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axispro005</c:param>
        <c:param name="__botones">cancelar,aceptar</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    </form>
    <c:import url="../include/mensajes.jsp" />
</body>
</html>