<%/*
*  Fichero: axisfis002.jsp
*  @author <a href = "mailto:joan_torres@csi-ti.com">Joan Torres</a> 
*
*  Fecha: 30/05/2012
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

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            parent.f_cerrar_axisfis002();
       }       
    
       function f_onload(){
                f_cargar_propiedades_pantalla();                  
       }           
            
      
       
       function f_but_buscar(){   
            if (objValidador.validaEntrada()) {              
                objDom.setValorPorId ("INDICE",0);   
                objDom.setValorPorId ("INDICE2",0); 
                objUtiles.ejecutarFormulario("modal_axisfis002.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
       }
       
       function f_seleccionar_factura(NFACT,SFACT,CAGENTE){           
            if (objValidador.validaEntrada()) {
                parent.f_buscar(NFACT,SFACT,CAGENTE);
            }
       }
       
       function f_but_aceptar()
       {
          if (objValidador.validaEntrada()) {
            var NFACT =  objDom.getValorPorId("INDICE");
            var SFACT =  objDom.getValorPorId("INDICE2");
            var CAGENTE = objDom.getValorPorId("CAGENTE");
            if (NFACT!=0) parent.f_buscar(NFACT,SFACT,CAGENTE);
          }
       }
       
        function f_but_nuevo()
       {               
               parent.f_nuevo();
       }
       
       /***************************************** AJAX ******************************************/
       
            function f_actualizar_agente(){
                 if (objValidador.validaEntrada()) {
                    var CAGENTE =  objDom.getValorPorId("CAGENTE_TEXT");
                    objDom.setValorPorId("CAGENTE",CAGENTE);
                    objDom.setValorPorId("NOMBRE_TEXT", ""); 
                    objAjax.invokeAsyncCGI("modal_axisfis002.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + CAGENTE, this, objJsMessages.jslit_cargando);
                 }
                
            }
            
            function callbackAjaxCargarAgente(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);
                
                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado); 
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_TEXT",""); 
                        objDom.setValorPorId("CAGENTE_TEXT","");
                        //objDom.setValorPorId("CAGENTE","");
                    }
                }
            }
            
            
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                    }
            }
           /****************************** MODAL *************************************/ 
            function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=CTIPAGE_5_CTIPMED_5");
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("modal_axisfis002.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
                        

             function f_seleccionar_indice(posicion,psfact,cagente)           
            {    
                objDom.setValorPorId ("INDICE",posicion);
                objDom.setValorPorId ("INDICE2",psfact);
                objDom.setValorPorId ("CAGENTE",cagente);
            }
        
            function f_formatdate(entrada,title){
                var jDate = new JsFecha();
                if(entrada.value.length>0){
                    entrada.value=jDate.formateaFecha(entrada.value);
                
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        alert("<axis:alt c="aler" f="axisadm059" lit="1000421"/>");
                    }
                }
            }
            
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="INDICE" value="${__formdata.INDICE}" id="INDICE">
            <input type="hidden" name="INDICE2" value="${__formdata.INDICE2}" id="INDICE2">
            <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}" id="CAGENTE">
            <input type="hidden" name="CONDICION" value="CTIPAGE_5_CTIPMED_5" id="CONDICION">
            <c:if test="${!empty __formdata.LISTVALORES.LSTEMPRESAS && fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1  }">
                <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.LISTVALORES.LSTEMPRESAS[0].CEMPRES}" />
            </c:if>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form"  f="axisfis002" lit="9903743" /></c:param>
                <c:param name="producto"><axis:alt  c="producto" f="axisfis002" lit="9903743" /></c:param>
                <c:param name="form">axisfis002</c:param>
            </c:import>
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="titulo14" f="axisfis002" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>
            <!-- Area de campos  -->
            
            <div class="separador">&nbsp;</div>
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axisfis002" c="CEMPRES"  dejarHueco="false"> 
                                    <td class="titulocaja" colspan="2" ><!-- EMPRESA -->
                                         <b><axis:alt f="axisfis002" c="CEMPRES" lit="101619"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisfis002" c="CAGENTE"  dejarHueco="false" > 
                                    <td class="titulocaja" colspan="3">
                                        <b><axis:alt c="CAGENTE" f="axisfis002" lit="9901930" /></b>                                   
                                    </td>
                                </axis:ocultar> 
                             </tr>
                             <tr>
                               <axis:ocultar f="axisfis002" c="CEMPRES"  dejarHueco="false"> 
                                   <c:choose>  
                                                <c:when test="${fn:length(__formdata.LISTVALORES.LSTEMPRESAS) > 1 && !empty __formdata.LISTVALORES.LSTEMPRESAS}">
                                                  <td class="campocaja" colspan="2">
                                                        <select name="CEMPRES" id ="CEMPRES" size="1"  class="campowidthinput campo campotexto_ob" obligatorio="true" style="width:90%"
                                                        title="<axis:alt c="CEMPRES" f="axisfis002" lit="101619"/>" onchange="f_recarga_combos('E')"
                                                        <axis:atr f="axisfis002" c="CEMPRES" a="isInputText=false&obligatorio=false"/>>
                                                            <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt c="SELECC" f="axisfis002" lit="108341"/> - </option>                                                                                                        
                                                            <c:forEach items="${__formdata.LISTVALORES.LSTEMPRESAS}" var="item">
                                                                <option value = "${item.CEMPRES}" <c:if test="${!empty __formdata.CEMPRES && __formdata.CEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                                            </c:forEach>
                                                        </select>
                                                  </td>           
                                               </c:when>
                                    <c:otherwise> 
                                                 <td class="campocaja" colspan="2" >
                                                 
                                                 <input type= "text" class="campo campotexto" obligatorio="true" id="CEMPRES" name="CEMPRES" value = "${__formdata.LISTVALORES.LSTEMPRESAS[0].TEMPRES}"
                                                 <axis:atr f="axisfis002" c="CEMPRES" a="modificable=false&obligatorio=true"/>/>
                                                   </td>    
                                                    </c:otherwise> 
                                     </c:choose>  
                                 </axis:ocultar>                                 
                                <%-- AGENTE --%>
                                <axis:ocultar f="axisfis002" c="CAGENTE"  dejarHueco="false" > 
                                    <td class="campocaja" colspan="3">
                                        <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${__formdata.CAGENTE_TEXT}" class="campowidthinput campo campotexto" style="width:20%"
                                         title="<axis:alt  c="CAGENTE" f="axisfis002" lit="100584"/>" 
                                        <axis:atr f="axisfis002" c="CAGENTE" a="modificable=true"/> onchange="f_actualizar_agente()" />
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                        <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE_TEXT}"  style="width:70%" class="campowidthinput campo campotexto"/>
                                    </td>                                    
                                </axis:ocultar>                                
                             </tr>
                             <%-- SECCION 2 --%>
                             <tr> 
                                    <axis:ocultar f="axisfis002" c="NIF"  dejarHueco="false"> 
                                        <td class="titulocaja" ><!-- NIF -->
                                             <b><axis:alt f="axisfis002" c="NIF" lit="105904"></axis:alt></b>                                 
                                        </td>
                                    </axis:ocultar>    
                                    <axis:ocultar f="axisfis002" c="NFACTURA"  dejarHueco="false"> 
                                        <td class="titulocaja" colspan="2"  ><!-- NFACTURA -->
                                             <b><axis:alt f="axisfis002" c="NFACTURA" lit="9903744"></axis:alt></b>                                 
                                        </td>
                                    </axis:ocultar>  
                                    <axis:ocultar f="axisfis002" c="FINICIO"  dejarHueco="false"> 
                                        <td class="titulocaja"  ><!-- FINICIO -->
                                             <b><axis:alt f="axisfis002" c="FINICIO" lit="9000526"></axis:alt></b>                                 
                                        </td>
                                    </axis:ocultar>  
                                    <axis:ocultar f="axisfis002" c="FFIN"  dejarHueco="false"> 
                                        <td class="titulocaja"  ><!-- FFIN -->
                                             <b><axis:alt f="axisfis002" c="FFIN" lit="9000527"></axis:alt></b>                                 
                                        </td>
                                    </axis:ocultar>  
                               </tr>
                               <tr>
                               
                                 <axis:ocultar f="axisfis002" c="NIF"  dejarHueco="false"> 
                                      <td class="campocaja" >
                                        <input type= "text" class="campo campotexto"  id="NIF" name="NIF" value = "${__formdata.NIF}"
                                         <axis:atr f="axisfis002" c="NIF" a="modificable=true"/>/>                                    
                                      </td>  
                                  </axis:ocultar>   
                                   <axis:ocultar f="axisfis002" c="NFACTURA"  dejarHueco="false"> 
                                      <td class="campocaja" colspan="2" >
                                        <input type= "text" class="campo campotexto"  id="NFACTURA" name="NFACTURA" value = "${__formdata.NFACTURA}" maxlength="40" size="40" style="width:75%;"
                                          <axis:atr f="axisfis002" c="NFACTURA" a="modificable=true"/>/>                                    
                                      </td>  
                                  </axis:ocultar>   
                                  <axis:ocultar f="axisfis002" c="FINICIO"  dejarHueco="false"> 
                                    <td class="campocaja">                             
                                        <input type="text" class="campowidthinput campo campotexto" size="15" style="width:75%;"
                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICIO}"/>" name="FINICIO" id="FINICIO"
                                        title="<axis:alt f="axisfis002" c="FINICIO" lit="FINICIO"/>"
                                        onblur="javascript:f_formatdate(this,'')"
                                        <axis:atr f="axisfis002" c="FINICIO" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                        id="icon_FINICIO" alt="<axis:alt f="axisadm001" c="FINICIO" lit="108341"/>" title="<axis:alt f="axisfis002" c="FINICIO" lit="1000554"/>" src="images/calendar.gif"/></a>
                                    </td> 
                                  </axis:ocultar>  
                                  <axis:ocultar f="axisfis002" c="FFIN"  dejarHueco="false"> 
                                    <td class="campocaja">                             
                                        <input type="text" class="campowidthinput campo campotexto" size="15" style="width:75%;"
                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFIN}"/>" name="FFIN" id="FFIN"
                                        title="<axis:alt f="axisfis002" c="FFIN" lit="FFIN"/>"
                                        onblur="javascript:f_formatdate(this,'')"
                                        <axis:atr f="axisfis002" c="FFIN" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                        id="icon_FFIN" alt="<axis:alt f="axisadm001" c="FFIN" lit="108341"/>" title="<axis:alt f="axisfis002" c="FFIN" lit="1000554"/>" src="images/calendar.gif"/></a>
                                    </td> 
                                  </axis:ocultar>
                               </tr>
                               <%-- SECCION 3 --%>
                               <tr> 
                                    <axis:ocultar f="axisfis002" c="TIPFACTURA"  dejarHueco="false"> 
                                        <td class="titulocaja" ><!-- TIPFACTURA -->
                                             <b><axis:alt f="axisfis002" c="TIPFACTURA" lit="9903745"></axis:alt></b>                                 
                                        </td>
                                    </axis:ocultar>    
                                    <axis:ocultar f="axisfis002" c="ESTADO"  dejarHueco="false"> 
                                        <td class="titulocaja"  ><!-- ESTADO -->
                                             <b><axis:alt f="axisfis002" c="ESTADO" lit="100587"></axis:alt></b>                                 
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisfis002" c="CAUTORIZADA"  dejarHueco="false"> 
                                        <td class="titulocaja"  >
                                             <b><axis:alt f="axisfis002" c="CAUTORIZADA" lit="9906562"></axis:alt></b>                                 
                                        </td>
                                    </axis:ocultar>
                               </tr>
                               <tr> 
                                    <axis:ocultar f="axisfis002" c="TIPFACTURA"  dejarHueco="false"> 
                                        <td class="campocaja" ><!-- TIPFACTURA -->
                                            <select title="<axis:alt c="TIPFACTURA" f="axisfis002" lit='9903745' />" alt="<axis:alt c="TIPFACTURA" f="axisfis002" lit='9903745' />" name = "list_TIPFACTURA" id="list_TIPFACTURA" size="1" 
                                                class="campowidthselect campo campotexto" style="width:200px;"
                                                <axis:atr f="axisfis002" c="TIPFACTURA" a="modificable=true&isInputText=false"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfis002" c="MINVAL" lit="1000348"/> - </option>
                                                <c:forEach var="tipfact" items="${__formdata.LISTVALORES.LSTTIPFACTURA}">
                                                    <option value = "${tipfact.CATRIBU}"
                                                        <c:choose>
                                                            <c:when test="${__formdata.list_TIPFACTURA == tipfact.CATRIBU}">selected</c:when>
                                                        </c:choose>>
                                                        ${tipfact.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                            </select>     
                                        </td>
                                    </axis:ocultar>    
                                    <axis:ocultar f="axisfis002" c="ESTADO"  dejarHueco="false"> 
                                        <td class="campocaja"  ><!-- ESTADO -->
                                            <select title="<axis:alt c="ESTADO" f="axisfis002" lit='9903745' />" alt="<axis:alt c="ESTADO" f="axisfis002" lit='9903745' />" name = "list_ESTADO" id="list_ESTADO" size="1" 
                                                class="campowidthselect campo campotexto" style="width:200px;"
                                                <axis:atr f="axisfis002" c="ESTADO" a="modificable=true"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfis002" c="MINVAL" lit="1000348"/> - </option>
                                                <c:forEach var="estadofact" items="${__formdata.LISTVALORES.LSTESTADO}">
                                                    <option value = "${estadofact.CATRIBU}"
                                                        <c:choose>
                                                            <c:when test="${__formdata.list_ESTADO == estadofact.CATRIBU}">selected</c:when>
                                                        </c:choose>>
                                                        ${estadofact.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:ocultar>
                                     <axis:ocultar f="axisfis002" c="CAUTORIZADA"  dejarHueco="false"> 
                                        <td class="campocaja"  ><!-- CAUTORIZADA -->
                                            <select title="<axis:alt c="CAUTORIZADA" f="axisfis002" lit='9906562' />" alt="<axis:alt c="CAUTORIZADA" f="axisfis002" lit='9906562' />" name = "CAUTORIZADA" id="CAUTORIZADA" size="1" 
                                                class="campowidthselect campo campotexto" style="width:200px;"
                                                <axis:atr f="axisfis002" c="CAUTORIZADA" a="modificable=true"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfis002" c="MINVAL" lit="1000348"/> - </option>
                                                <c:forEach var="LSTCAUTORIZADA" items="${__formdata.LISTVALORES.LSTCAUTORIZADA}">
                                                    <option value = "${LSTCAUTORIZADA.CATRIBU}"
                                                        <c:choose>
                                                            <c:when test="${__formdata.CAUTORIZADA == LSTCAUTORIZADA.CATRIBU}">selected</c:when>
                                                        </c:choose>>
                                                        ${LSTCAUTORIZADA.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:ocultar>
                               </tr> 

                                </table>                                 
                            </td>
                        </tr>
                        </table>                        
                                <div class="separador">&nbsp;</div>
                                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisfis002" c="flecha" lit="9000442" /></div>
                                   <table class="seccion" align="center">
                                        <tr>
                                            <td>
                                            <table class="area" align="center"> 
                                            <tr>
                                                <td>       
                                                  <c:set var="title1"><axis:alt c="DMEDIADOR" f="axisfis002" lit="9901930"/></c:set>  <%-- CCOBBAN --%>
                                                  <c:set var="title2"><axis:alt c="DNIF" f="axisfis002" lit="105904"/></c:set>   <%-- NCUENTA --%>
                                                  <c:set var="title3"><axis:alt c="DNFACTURA" f="axisfis002" lit="9903744"/></c:set>   <%-- ENTIDAD --%>
                                                  <c:set var="title4"><axis:alt c="DFFACTURA" f="axisfis002" lit="9000956"/></c:set>  <%-- SUFIJO --%>
                                                  <c:set var="title5"><axis:alt c="DIMPORTE" f="axisfis002" lit="100563"/></c:set>   <%-- DESCRIP --%>
                                                  <c:set var="title6"><axis:alt c="DIRPF" f="axisfis002" lit="112579"/></c:set>   <%-- SELEC--%>
                                                  <c:set var="title7"><axis:alt c="DIMPNETO" f="axisfis002" lit="1000527"/></c:set>  <%-- NIF --%>
                                                  <c:set var="title8"><axis:alt c="DTIPIVA" f="axisfis002" lit="101340"/></c:set>   <%-- BAJA --%>                                                  
                                                  <c:set var="title9"><axis:alt c="DTFACTURA" f="axisfis002" lit="9903745"/></c:set>   <%-- BAJA --%>  
                                                  <c:set var="title10"><axis:alt c="DTESTADO" f="axisfis002" lit="100587"/></c:set>
                                                  <c:set var="title11"><axis:alt c="DIIMPCTA" f="axisfis002" lit="9904227"/></c:set>
                                                  <% int i=0; %>
                                                  <c:set var="pos"><%=i%></c:set>
                                                  <!-- Valores de columnas -->
                                                  <div class="displayspace">                                             
                                                    <display:table name="${listaFacturas}" id="miListaId" export="false" class="dsptgtable" 
                                                    pagesize="-1" defaultsort="2" defaultorder="descending" sort="list" cellpadding="0" cellspacing="0" 
                                                    requestURI="modal_axisfis002.do?operation=form&paginar=true">
                                                      <%@ include file="../include/displaytag.jsp"%>
                                                      <!-- Check versión -->
                                                      <display:column headerClass="headwidth5 sortable fixed" title="" media="html" autolink="false" >
                                                        <div class="dspIcons">                                                
                                                          <input value="${miListaId.OB_IAX_FACTURAS.NFACT}" onclick="javascript:f_seleccionar_indice('${miListaId.OB_IAX_FACTURAS.NFACT}','${miListaId.OB_IAX_FACTURAS.SFACT}','${miListaId.OB_IAX_FACTURAS.CAGENTE}')" type="radio" id="radioNVERSIO" name="radioNVERSIO" />
                                                        </div>
                                                      </display:column>                                              
                                                      <!-- Cobbancario -->                                                       
                                                      <axis:visible f="axisfis002" c="DMEDIADOR"> 
                                                          <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_FACTURAS.TNOMBRE" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                            <div class="dspText"><a href="javascript:f_seleccionar_factura('${miListaId.OB_IAX_FACTURAS.NFACT}','${miListaId.OB_IAX_FACTURAS.SFACT}','${miListaId.OB_IAX_FACTURAS.CAGENTE}');">${miListaId.OB_IAX_FACTURAS.CAGENTE}&nbsp;-&nbsp;${miListaId.OB_IAX_FACTURAS.TNOMBRE}</a></div>                                                            
                                                          </display:column>
                                                      </axis:visible>                                                        
                                                      <axis:visible f="axisfis002" c="DNIF"> 
                                                          <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_FACTURAS.NNUMIDE" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                              <div class="dspText"><a href="javascript:f_seleccionar_factura('${miListaId.OB_IAX_FACTURAS.NFACT}','${miListaId.OB_IAX_FACTURAS.SFACT}','${miListaId.OB_IAX_FACTURAS.CAGENTE}');">${miListaId.OB_IAX_FACTURAS.NNUMIDE}</a></div>
                                                          </display:column>
                                                      </axis:visible>                                                    
                                                      <axis:visible f="axisfis002" c="DNFACTURA"> 
                                                          <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_FACTURAS.NFACT" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText"><a href="javascript:f_seleccionar_factura('${miListaId.OB_IAX_FACTURAS.NFACT}','${miListaId.OB_IAX_FACTURAS.SFACT}','${miListaId.OB_IAX_FACTURAS.CAGENTE}');">${miListaId.OB_IAX_FACTURAS.NFACT}</a></div>                                           
                                                          </display:column>  
                                                      </axis:visible>   
                                                      <axis:visible f="axisfis002" c="DFFACTURA"> 
                                                          <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_FACTURAS.FFACT" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText"><a href="javascript:f_seleccionar_factura('${miListaId.OB_IAX_FACTURAS.NFACT}','${miListaId.OB_IAX_FACTURAS.SFACT}','${miListaId.OB_IAX_FACTURAS.CAGENTE}');"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.OB_IAX_FACTURAS.FFACT}"/></a></div>                                                                                
                                                          </display:column>  
                                                      </axis:visible>   
                                                      <axis:visible f="axisfis002" c="DIMPORTE"> 
                                                          <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_FACTURAS.IIMPORTE_TOTAL" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText"><a href="javascript:f_seleccionar_factura('${miListaId.OB_IAX_FACTURAS.NFACT}','${miListaId.OB_IAX_FACTURAS.SFACT}','${miListaId.OB_IAX_FACTURAS.CAGENTE}');"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${miListaId.OB_IAX_FACTURAS.IIMPORTE_TOTAL}'/></a></div>
                                                          </display:column>  
                                                      </axis:visible>  
                                                      <axis:visible f="axisfis002" c="DIRPF"> 
                                                          <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_FACTURAS.IIRPF_TOTAL" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText"><a href="javascript:f_seleccionar_factura('${miListaId.OB_IAX_FACTURAS.NFACT}','${miListaId.OB_IAX_FACTURAS.SFACT}','${miListaId.OB_IAX_FACTURAS.CAGENTE}');"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${miListaId.OB_IAX_FACTURAS.IIRPF_TOTAL}'/></a></div>
                                                          </display:column>  
                                                      </axis:visible>  
                                                      <axis:visible f="axisfis002" c="DIIMPCTA"> 
                                                          <display:column title="${title11}" sortable="true" sortProperty="OB_IAX_FACTURAS.IIMPCTA_TOTAL" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText"><a href="javascript:f_seleccionar_factura('${miListaId.OB_IAX_FACTURAS.NFACT}','${miListaId.OB_IAX_FACTURAS.SFACT}','${miListaId.OB_IAX_FACTURAS.CAGENTE}');"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${miListaId.OB_IAX_FACTURAS.IIMPCTA_TOTAL}'/></a></div>
                                                          </display:column>  
                                                      </axis:visible>
                                                      <axis:visible f="axisfis002" c="DIMPNETO"> 
                                                          <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_FACTURAS.IIMPNETO_TOTAL" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText"><a href="javascript:f_seleccionar_factura('${miListaId.OB_IAX_FACTURAS.NFACT}','${miListaId.OB_IAX_FACTURAS.SFACT}','${miListaId.OB_IAX_FACTURAS.CAGENTE}');"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${miListaId.OB_IAX_FACTURAS.IIMPNETO_TOTAL}'/></a></div>
                                                          </display:column>  
                                                      </axis:visible>  
                                                      <axis:visible f="axisfis002" c="DTIPIVA"> 
                                                          <display:column title="${title8}" sortable="true" sortProperty="OB_IAX_FACTURAS.TTIPIVA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText"><a href="javascript:f_seleccionar_factura('${miListaId.OB_IAX_FACTURAS.NFACT}','${miListaId.OB_IAX_FACTURAS.SFACT}','${miListaId.OB_IAX_FACTURAS.CAGENTE}');">${miListaId.OB_IAX_FACTURAS.TTIPIVA}</a></div>
                                                          </display:column>  
                                                      </axis:visible>  
                                                      <axis:visible f="axisfis002" c="DTESTADO"> 
                                                          <display:column title="${title10}" sortable="true" sortProperty="OB_IAX_FACTURAS.TESTADO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText"><a href="javascript:f_seleccionar_factura('${miListaId.OB_IAX_FACTURAS.NFACT}','${miListaId.OB_IAX_FACTURAS.SFACT}','${miListaId.OB_IAX_FACTURAS.CAGENTE}');">${miListaId.OB_IAX_FACTURAS.TESTADO}</a></div>
                                                          </display:column>  
                                                      </axis:visible>
                                                      <axis:visible f="axisfis002" c="DTFACTURA"> 
                                                          <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_FACTURAS.TTIPFACT" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText"><a href="javascript:f_seleccionar_factura('${miListaId.OB_IAX_FACTURAS.NFACT}','${miListaId.OB_IAX_FACTURAS.SFACT}','${miListaId.OB_IAX_FACTURAS.CAGENTE}');">${miListaId.OB_IAX_FACTURAS.TTIPFACT}</a></div>
                                                          </display:column>  
                                                      </axis:visible> 
                                                        <%i++;%>
                                                        <c:set var="pos"><%=i%></c:set>
                                                    </display:table>
                                                  </div>  
                                                <div class="separador">&nbsp;</div>
                                                </td>
                                                </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>    
                    </td>
                </tr>
            </table>					
            
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisfis002</c:param>        
                <c:param name="__botones">cancelar,buscar,nuevo,aceptar</c:param>
            </c:import>
            
            <script type="text/javascript">
                Calendar.setup({
                inputField     :    "FINICIO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FINICIO", 
                singleClick    :    true,
                firstDay       :    1
                });             
            </script>
            
            <script type="text/javascript">
                Calendar.setup({
                inputField     :    "FFIN",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FFIN", 
                singleClick    :    true,
                firstDay       :    1
                });             
            </script>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

