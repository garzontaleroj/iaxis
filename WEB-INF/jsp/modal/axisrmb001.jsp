<%/*
*  Fichero: axisrmb001.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 20/08/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_cancelar() {
           parent.f_cerrar_modal('axisrmb001');                      
        }
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("modal_axisrmb001.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);                
            }
        }
        
        function f_but_nuevo(){
            parent.f_cerrar_modal('axisrmb001');             
            parent.f_but_buscarAlta();
        }
        
        function f_but_aceptar() {
            
            if(objUtiles.estaVacio(document.miForm.radioNREEMB)){
                alert(objJsMessages.jslit_busca_primero_general);
            }else{
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("radioNREEMB");

                if(typeof hayChecked == 'boolean') {
                    alert(objJsMessages.jslit_selecciona_registro);
                }else {
                    //alert("antes de lista - en aceptar");
                    seleccionarLista(objUtiles.utilSplit(hayChecked, "/")[0], objUtiles.utilSplit(hayChecked, "/")[1]);
                }
            }
        }

        function f_onload() {
            f_cargar_propiedades_pantalla();
            document.getElementById("NREEMB").focus();
            
        }
        
        function seleccionarLista (NREEMB) {
        //alert("En 001");
            if (objUtiles.estaVacio(NREEMB)){
                alert (objJsMessages.jslit_error_de_seleccion);
            }else{
                parent.f_aceptar_axisrmb001(NREEMB);
                   
            }
         }
         
         function f_seleccionarReemb (NREEMB,SSEGURO,NCERTIF) {
                parent.f_aceptar_axisrmb001(NREEMB,SSEGURO,NCERTIF);
         }
         
         
         /****************************************************************************************/
        /**********************************  FUNCIONES ALTA *************************************/
        /****************************************************************************************/
        
      
        function f_aceptar_axisrmb003(NREEMB){
            document.miForm.NREEMB.value = NREEMB;
            f_cerrar_axisrmb003(null);
            objUtiles.ejecutarFormulario("axis_axisrmb002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_cerrar_axisrmb003(isNew) {
            objUtiles.cerrarModal("axisrmb003");
            //alert(isNew);
            if (!objUtiles.estaVacio(isNew)) 
            if (isNew)
                f_abrir_modal('axisrmb008');  
        }
         
         //////////////////////////////////////////////////////////////////////////////////////////////
         ////////////////////////////////  FUNCIONES FORMATEO DE FECHAS ///////////////////////////////
         //////////////////////////////////////////////////////////////////////////////////////////////


         function f_formatdate(entrada,title){
            var jDate = new JsFecha();

            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert('Formato fecha incorrecto para el campo '+ title);
                }
            }
        }
    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axisrmb001.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisrmb001" c="BUSCADOR_REM" lit="9000438"/></c:param>      <%-- BUSCADOR DE REEMBOLSOS --%>
            <c:param name="formulario"><axis:alt f="axisrmb001" c="BUSCADOR_REM" lit="9000438"/></c:param>  <%-- BUSCADOR DE REEMBOLSOS --%>
            <c:param name="form">axisrmb001</c:param>
        </c:import>
        
        <input type="hidden" id="operation" name="operation" value=""/>
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">                    
                                    <tr>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                        <th style="width:25%;height:0%;"/>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb001" c="ESTADO" lit="100587"/></b> <%-- Estado --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb001" c="NREMBOLSO" lit="9001512"/></b> <%-- Nº Reembolso --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb001" c="NPOLIZA" lit="9001514"/></b>  <%-- Nº póliza --%>
                                        </td>                            
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb001" c="NCERTIF" lit="101168"/></b> <%-- Nº Certificado --%>
                                        </td>                                                       
                                    </tr>
                                    <tr>
                                        <td class="campocaja">                             
                                            <select name="CESTADO" id="CESTADO" size="1" class="campowidthselect campo campotexto" style="width:82.5%;">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrmb001" c="COMBO" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaEstados}">
                                                    <option value = "${element.CATRIBU}" 
                                                        <c:if test="${element.CATRIBU == __formdata.CESTADO}"> selected </c:if> />
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </td-->        
                                        <td class="campocaja">                                
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NREEMB}" name="NREEMB" id="NREEMB"
                                            style="width:80%;" <axis:atr f="axisrmb001" c="NREEMB" a="formato=entero"/> 
                                            title="<axis:alt f="axisrmb001" c="NREMBOLSO" lit="9001512"/>" />
                                        </td>        
                                        <td class="campocaja">                                
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA"
                                            style="width:80%;" <axis:atr f="axisrmb001" c="NPOLIZA" a="formato=entero"/> 
                                            title="<axis:alt f="axisrmb001" c="NPOLIZA" lit="9001514"/> <axis:alt f="axisrmb001" c="NPOLIZA" lit="9001514"/>" />
                                        </td>        
                                        <td class="campocaja">                                
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NCERTIF}" name="NCERTIF" id="NCERTIF"
                                            style="width:80%;" <axis:atr f="axisrmb001" c="NCERTIF" a="formato=entero"/> 
                                            title="<axis:alt f="axisrmb001" c="NCERTIF" lit="101168"/>" />
                                        </td>        
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisrmb001" c="NOMBRE" lit="105940"/></b>  <%-- Nombre --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb001" c="AGRSALUD" lit="9000435"/></b> <%-- Agr. salud --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb001" c="OFICINA" lit="9000436"/></b> <%-- Oficina --%>
                                        </td>                            
                                        <td class="titulocaja">
                                            
                                        </td>                                                     
                                    </tr>
                                    <tr>
                                        <td class="campocaja" colspan="2">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE"
                                            style="width:90%;" <axis:atr f="axisrmb001" c="TNOMBRE"/> />
                                        </td>
                                        <td class="campocaja">                             
                                            <select name="AGRSALUD" id="AGRSALUD" size="1" class="campowidthselect campo campotexto" style="width:82.5%;">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrmb001" c="COMBO" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaSalud}">
                                                    <option value = "${element.CVALPAR}" 
                                                        <c:if test="${element.CVALPAR == __formdata.AGR_SALUD}"> selected </c:if> />
                                                        ${element.TVALPAR} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja">                                
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.COFICINA}" name="COFICINA" id="COFICINA"
                                            style="width:80%;" <axis:atr f="axisrmb001" c="COFICINA" a="formato=entero"/> title="<axis:alt f="axisrmb001" c="OFICINA" lit="9000436"/>" />
                                        </td>
                                        
                                              
                                    </tr>
                                    
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb001" c="USUARI" lit="100894"/></b>  <%-- Usuario --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb001" c="NFACT_CLI" lit="9000650"/></b> <%-- NFACT_CLI --%>
                                        </td>
                                        <td class="titulocaja"><%-- NCASS --%>
                                          <b><axis:alt f="axisrmb001" c="NCLASS" lit="9001515"/></b> <%-- Nº CASS --%>
                                        </td>                            
                                        <td class="titulocaja">
                                          <b><axis:alt f="axisrmb001" c="FACTO" lit="9901057"/></b> <%-- Fecha Acto --%>
                                        </td>                                                       
                                    </tr>
                                    <tr>
                                       <td class="campocaja">                                
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.USUARIO}" name="USUARIO" id="USUARIO"
                                            style="width:80%;" <axis:atr f="axisrmb001" c="USUARIO"/> title="<axis:alt f="axisrmb001" c="USUARI" lit="100894"/>" />
                                        </td>  
                                        
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NFACT_CLI}" name="NFACT_CLI" id="NFACT_CLI"
                                            style="text-transform:uppercase; width:80%;" <axis:atr f="axisrmb001" c="NFACT_CLI"/> title="<axis:alt f="axisrmb001" c="NFACT_CLI" lit="9000650"/>" />
                                        </td>
                                        <td class="campocaja">                                
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NCASS}" name="NCASS" id="NCASS"
                                            style="width:80%;" <axis:atr f="axisrmb001" c="NCASS"/> title="<axis:alt f="axisrmb001" c="NCASS" lit="9001515"/> <axis:alt f="axisrmb001" c="NCLASS" lit="9001515"/>" />
                                        </td>       
                                        <td class="campocaja">                                
                                            <input type="text" class="campowidthinput campo campotexto" size="15" onchange="javascript:f_formatdate(this,'<axis:alt f="axisrmb001" c="FACTO" lit="9901057"/>');"
                                            value="<fmt:formatDate value='${__formdata.FACTO}' pattern='dd/MM/yyyy'/>" name="FACTO" id="FACTO" onblur="javascript:f_formatdate(this,'<axis:alt f="axisrmb001" c="FACTO" lit="9901057"/>');"
                                            style="width:65%;" <axis:atr f="axisrmb001" c="FACTO" a="formato=fecha"/> title="<axis:alt f="axisrmb001" c="FACTO" lit="9901057"/>" /> <a id="icon_FACTO" style="vertical-align:middle;"><img
                                            alt="<axis:alt f="axisrmb001" c="FACTO" lit="9901057"/>" title="<axis:alt f="axisrmb001" c="FACTO" lit="9901057" />" src="images/calendar.gif"/></a>
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
                    <c:set var="title1"><axis:alt f="axisrmb001" c="ESTADO" lit="100587"/></c:set>                              <%-- Estado --%>
                    <c:set var="title2"><axis:alt f="axisrmb001" c="NUMMFACT" lit="9000445"/></c:set>                             <%-- Num. Fact. --%>
                    <%-- BFP bug 22396 ini --%>
                    <c:set var="title2b"><axis:alt f="axisrmb001" c="TIPREEMB" lit="9903738"/></c:set>                             <%-- Tipus Reemb. --%>
                    <%-- BFP bug 22396 fi --%>
                    <c:set var="title3"><axis:alt f="axisrmb001" c="NREMBOLSO" lit="9001512"/></c:set>                             <%-- Nº Reembolso --%>
                    <c:set var="title4"><axis:alt f="axisrmb001" c="NPOLIZA" lit="9001514"/></c:set>                             <%-- Nº póliza --%>
                    <c:set var="title5"><axis:alt f="axisrmb001" c="NCAST" lit="9001515"/></c:set>                             <%-- Nº CASS --%>
                    <c:set var="title6"><axis:alt f="axisrmb001" c="NOMBRE" lit="105940"/></c:set>                              <%-- Nombre --%>
                    <c:set var="title7"><axis:alt f="axisrmb001" c="FFACTU" lit="9000451"/></c:set>                             <%-- F. factura --%>
                    <c:set var="title8"><axis:alt f="axisrmb001" c="NCERTIF" lit="101168"/></c:set>                              <%-- Num. Certif --%>
                    <c:set var="title9"><axis:alt f="axisrmb001" c="NHOJA" lit="9000650"/></c:set>                             <%-- Num. Hoja --%>
                    
                    <div class="displayspaceMaximo">
                        <display:table name="${sessionScope.axisctr_listaReembFact}" id="miListaId" export="false" class="dsptgtable" 
                        pagesize="20"  sort="list" cellpadding="0" cellspacing="0" 
                        requestURI="modal_axisrmb001.do?operation=form&paginar=true">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column headerClass="headwidth3 sortable fixed" title="" media="html" autolink="false">
                                <div class="dspIcons">
                                    <input value="${miListaId.NREEMB}" <c:if test="${miListaId['radioNREEMB']}">checked</c:if> type="radio" id="radioNREEMB" name="radioNREEMB" selected="true"/>
                                </div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="ESTADO" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId.TESTADO}</div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="NREEMB" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                <div class="dspText"><a href="javascript:f_seleccionarReemb('${miListaId.NREEMB}','${miListaId.SSEGURO}','${miListaId.NCERTIF}')">${miListaId.NREEMB}</a></div>
                            </display:column>
                            <%-- BFP bug 22396 ini --%>
                            <axis:visible f="axisrmb001" c="NUMMFACT">
                            <%-- BFP bug 22396 fi --%>
                                <display:column title="${title2}" sortable="true" sortProperty="NFACT" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                    <div class="dspText"><a href="javascript:f_seleccionarReemb('${miListaId.NREEMB}','${miListaId.SSEGURO}','${miListaId.NCERTIF}')">${miListaId.NFACT}</a></div>
                                </display:column>
                            <%-- BFP bug 22396 ini --%>
                            </axis:visible>
                            <%-- BFP bug 22396 fi --%>
                            <%-- BFP bug 22396 ini --%>
                            <axis:visible f="axisrmb001" c="TIPREEMB" >
                                <display:column title="${title2b}" sortable="true" sortProperty="TIPREEMB" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                    <div class="dspText">${miListaId.TIPREEMB}</div>
                                </display:column>
                            </axis:visible>
                            <%-- BFP bug 22396 fi --%>
                            <display:column title="${title4}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                <div class="dspText"><a href="javascript:f_seleccionarReemb('${miListaId.NREEMB}','${miListaId.SSEGURO}','${miListaId.NCERTIF}')">${miListaId.NPOLIZA}</a></div>
                            </display:column> 
                            <display:column title="${title8}" sortable="true" sortProperty="NCERTIF" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                <div class="dspText">${miListaId.NCERTIF}</div>
                            </display:column>   
                            <display:column title="${title5}" sortable="true" sortProperty="NCASS" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                <div class="dspText">${miListaId.NCASS}</div>
                            </display:column>                                        
                            <display:column title="${title9}" sortable="true" sortProperty="NFACT_CLI" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                <div class="dspText">${miListaId.NFACT_CLI}</div>
                            </display:column>                                        
                            <display:column title="${title6}" sortable="true" sortProperty="NOMBRE" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                <div class="dspText">${miListaId.NOM_ASEG}</div>
                            </display:column>              
                            <display:column title="${title7}" sortable="true" sortProperty="FFACTURA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                <div class="dspText"><fmt:formatDate value="${miListaId.FFACTURA}" pattern="dd/MM/yyyy"/></div>
                            </display:column>    
                            <display:column title="" sortable="true" sortProperty="FFACTURA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                <div class="dspText"></div>
                            </display:column>                               
                        </display:table>
                    </div>                       
                </td>
            </tr>

        </table>
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrmb001</c:param><c:param name="f">axisrmb001</c:param><c:param name="__botones">cancelar,buscar,aceptar<axis:visible f="axisrmb001" c="BT_NUEVO">,nuevo</axis:visible></c:param></c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FACTO",
            ifFormat       :    "%d/%m/%Y",
            button         :    "icon_FACTO",
            singleClick    :    true,
            firstDay       :    1
        });
    </script>
</body>
</html>