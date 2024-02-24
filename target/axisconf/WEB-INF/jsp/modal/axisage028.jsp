<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%--
  Fichero: axisage028.jsp
  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>

  Fecha: 20/12/2007
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>        
         <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 230px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />

        <script type="text/javascript">
           
            function f_onload(){                
                
                 f_cargar_propiedades_pantalla();
            }
            
            ///////////////////////////////////////////////////
            function f_but_cancelar() {
                parent.f_cerrar_axisage028();
            }        

            

            function f_but_aceptar () {
                //Si ha habido mensajes de error anteriormente, los eliminamos
                objUtiles.ejecutarFormulario ("modal_axisage028.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                parent.f_cerrar_axisage028();
             }
        function f_cambiar_ramo (CRAMO, CAGENTE) {
                //Si ha habido mensajes de error anteriormente, los eliminamos                
                objUtiles.ejecutarFormulario ("modal_axisage028.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
            
        
        function f_but_marcar(thiss,SPRODUC){
        marcado = thiss.checked?1:0;
            var strURL="modal_axisage028.do?operation=marcar_json&MARCAR="+marcado+"&SPRODUC="+SPRODUC;
            var ajaxTexto=objJsMessages.jslit_cargando;
            objAjax.invokeAsyncCGI_JSON(strURL, callbackselected, ajaxTexto);
        
        }
        
        function f_but_marcar_emitir(thiss,SPRODUC){
            var strURL="modal_axisage028.do?operation=marcar_json_emitir&MARCAR="+thiss+"&SPRODUC="+SPRODUC;
            var ajaxTexto=objJsMessages.jslit_cargando;
            objAjax.invokeAsyncCGI_JSON(strURL, callbackselected, ajaxTexto);
        
        }
        
        function f_but_marcar_accesible(thiss,SPRODUC){
            var strURL="modal_axisage028.do?operation=marcar_json_accesible&MARCAR="+thiss+"&SPRODUC="+SPRODUC;
            var ajaxTexto=objJsMessages.jslit_cargando;
            objAjax.invokeAsyncCGI_JSON(strURL, callbackselected, ajaxTexto);
        
        }
        
        function callbackselected(p) {    	
            
	    objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");                                                        
                    	                       	    
	  }
        
        </script>
    </head>
    <body onload="f_onload()" ><!--  -->
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

    <form name="miForm" action="modal_axisage028.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata['CAGENTE']}"/>
        <input type="hidden" name="SPRODUC" id="SPRODUC" value=""/> <!-- DEJAR VACIO -->
        
            
            <c:import url="../include/titulo_nt.jsp"> 
                <c:param name="modalidad"> </c:param> 
                <c:param name="titulo"> </c:param>
                <c:param name="formulario"><axis:alt f="axisage028" c="TITULO" lit="9904454" /></c:param>
                <c:param name="producto"></c:param>
                <c:param name="form">axisage028</c:param>
            </c:import>     
        
          

    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">        
                                <tr>
                     
           <axis:ocultar f="axisage028" c="CRAMO" dejarHueco="false">
                                <td class="titulocaja" id="tit_CRAMO" >
                                    <b id="label_CRAMO"><axis:alt f="axisage028" c="CRAMO" lit="100784"/></b>
                                </td>
                                </axis:ocultar>
                                </tr>
                                <tr>
                                <axis:ocultar f="axisage028" c="CRAMO" dejarHueco="false">
                                <td class="campocaja" id="td_CRAMO" > 
                                    <select name="CRAMO" id="CRAMO" size="1" class="campowidthselect campo campotexto" style="width:45%;" 
                                    	<axis:atr f="axisage028" c="CRAMO" a="obligatorio=false&isInputText=false"/>
                                        title="<axis:alt f='axisage028' c='CRAMO' lit='100784'/>" onchange="f_cambiar_ramo(this.value,'${__formdata.CAGENTE}')" >&nbsp;
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage028" c="SELECC" lit="108341"/> - </option>
                                        <%--<c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage023" c="CRAMO_SELECC" lit="1000348"/> - </option></c:if>--%>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTRAMO}">
                                            <option value = "${element.CRAMO}"
                                            <c:if test="${__formdata.CRAMO == element.CRAMO}"> selected = "selected"</c:if> >
                                            ${element.TRAMO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                         </tr>
                       <tr>
          <td>      
            <!-- DisplayTag Polizas -->
            <div class="seccion displayspaceGrande">
            <c:set var="title1"><axis:alt f="axisage028" c="TRAMO" lit="100784" /></c:set>                
            <c:set var="title2"><axis:alt f="axisage028" c="TTITULO" lit="100829" /></c:set>                
            <c:set var="title3"><axis:alt f="axisage028" c="EMITIR" lit="100590" /></c:set>                
            <c:set var="title4"><axis:alt f="axisage028" c="ACCESIBLE" lit="9904453"/></c:set>                
            <display:table name="${Prod_usu}" id="miListaId" export="false" style="width:98%" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" requestURI="axis_axisage028.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
            
                    <%@ include file="../include/displaytag.jsp"%>
                    <axis:visible c="SELECCIONADO" f="axisage028">
                        <display:column title="" sortable="false" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >    
                        <div class="dspIcons"><a name="${miListaId.OB_IAX_PROD_USU['SELECCIONADO']}"/>
                             <input type="checkbox" id="checked_marcar_${miListaId.OB_IAX_PROD_USU['SELECCIONADO']}"
                              <axis:atr f="axisage028" c="SELECCIONADO" a="obligatorio=false&isInputText=false"/>
                             name="checked_marcar_${miListaId.OB_IAX_PROD_USU['SELECCIONADO']}" 
                             <c:if test="${miListaId.OB_IAX_PROD_USU['SELECCIONADO'] == 1}"> checked </c:if>  value="" 
                             onclick="f_but_marcar(this,'${miListaId.OB_IAX_PROD_USU['SPRODUC']}')" />                        
                        </div>
                        </display:column>
                    </axis:visible>
                        <display:column title="${title1}" sortable="false" sortProperty="OB_IAX_PROD_USU.TRAMO" headerClass=" sortable fixed"  media="html" autolink="false" >    
                        <div class="dspText">${miListaId.OB_IAX_PROD_USU.TRAMO}</div>
                        </display:column>
                        <display:column title="${title2}" sortable="false" sortProperty="OB_IAX_PROD_USU.TTITULO" headerClass=" sortable fixed"  media="html" autolink="false" >    
                        <div class="dspText">${miListaId.OB_IAX_PROD_USU.TTITULO}</div>
                        </display:column>
                        <axis:ocultar f="axisage028" c="EMITIR" dejarHueco="false">
                        <display:column title="${title3}" sortable="false" sortProperty="OB_IAX_PROD_USU.EMITIR" headerClass="headwidth10 sortable fixed"  media="html" autolink="false" >    
                         <select name="EMITIR" id="EMITIR" size="1" class="campowidthselect campo campotexto" 
                                                    	 title="<axis:alt f="axisage028" c="EMITIR" lit="100590"/>" onchange="f_but_marcar_emitir(this.value,'${miListaId.OB_IAX_PROD_USU['SPRODUC']}')"
                                                    <axis:atr f="axisage028" c="EMITIR" a="obligatorio=false&isInputText=false"/>>&nbsp;                                                       
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.lstsino}">
                                                            <option value = "${element.CATRIBU}"
                                                            <c:if test="${miListaId.OB_IAX_PROD_USU.EMITIR == element.CATRIBU}"> selected = "selected"</c:if>>
                                                            ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                        </display:column>
                        
                        </axis:ocultar>                        
			<axis:visible c="ACCESIBLE" f="axisage028">
                        <display:column title="${title4}" sortable="false" headerClass="headwidth10 sortable fixed"  media="html" autolink="false" >                                
                              <select name="ACCESIBLE" id="ACCESIBLE" size="1" class="campowidthselect campo campotexto"
                                                    	 title="<axis:alt f="axisage028" c="ACCESIBLE" lit="9904453"/>" onchange="f_but_marcar_accesible(this.value,'${miListaId.OB_IAX_PROD_USU['SPRODUC']}')"
                                                    <axis:atr f="axisage028" c="ACCESIBLE" a="obligatorio=false&isInputText=false"/>>&nbsp;                                                       
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.lstsino}">
                                                            <option value = "${element.CATRIBU}"
                                                            <c:if test="${miListaId.OB_IAX_PROD_USU.ACCESIBLE == element.CATRIBU}"> selected = "selected"</c:if>>
                                                            ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                        </display:column>
            </axis:visible>
                </display:table>
            </div>
	   
        </td>
    </tr>
    </table>  <!-- Table area campos --> <!-- Ahora incluye a los dos forms -->

    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisage028</c:param>
        <c:param name="__botones">
            cancelar<c:if test="${!empty sessionScope.Prod_usu}"><axis:visible f="axisage028" c="BT_ACEPTAR" >,aceptar</axis:visible></c:if>
        </c:param>
    </c:import>

    </form>
    
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

