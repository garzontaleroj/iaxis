<%/*
*  Fichero: axisctr154.jsp
*/
%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
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
    
    <script language="Javascript">
    function f_but_cancelar() {
       parent.f_cerrar_axisctr154();
    }

    function f_onload() {
           objDependencias.modificarPropiedadesSegunModificableYVisible();
           f_cargar_valores_defecto();
           f_carga_dependencias();          
           revisarEstilos();
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

        function f_RecarregaMulti(){
                    objUtiles.ejecutarFormulario("modal_axisctr154.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);                    
                  
                }
        function f_RecarregaMulti2(entrada){
                    f_formatdate(entrada,'');
                    objUtiles.ejecutarFormulario("modal_axisctr154.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);                    
                  
                }                
                
    function f_but_aceptar() {
       if (objValidador.validaEntrada()) { 
        parent.f_aceptar_axisctr154(document.miForm.CINOUT.value,document.miForm.NUMFICH.value,document.miForm.FHASTA.value);
        null;
       } 
    } 

    function ValidaNum(valor) {
       if (!objValidador.validaEntrada()) document.miForm.NUMFICH.value = '';
    }     

    function f_seleccionarTras(valor,STRAS) {
             var parametres = '&STRAS='+STRAS;
             objAjax.invokeAsyncCGI('modal_axisctr154.do?SELECCIO='+valor, callbackAjaxSeleccionarTras, 'operation=ajaxseleccionarTras'+parametres, this);
             
        }         

   function f_seleccionar_todos(seleccionarTodos) {
                var inputs=document.getElementsByTagName("input"); // es getElementsByTagName o getElementsByName 
                    
                    for (icont=0;icont<inputs.length;icont++) 
                      {
                        
                        if (inputs[icont].name.indexOf('checkedpoliza_')>=0) 
                          {                 
                           var pos = inputs[icont].name.indexOf('_');
                           var paramNlinea = inputs[icont].name.substr(pos+1,inputs[icont].name.length-pos);
                            if (seleccionarTodos) {
                                inputs[icont].checked=true; // es checked o selected
                                f_seleccionarTras(1,eval('document.miForm.STRAS_'+paramNlinea+'.value'));
                                }
                            else {
                                inputs[icont].checked=false; // es checked o selected
                                f_seleccionarTras(0,eval('document.miForm.STRAS_'+paramNlinea+'.value'));                                
                                 } 
                                 
                          } 
                     }       
             }  

         function callbackAjaxSeleccionarTras(ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var operationOK = objAppMensajes.existenErroresEnAplicacion(doc);  
             
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }              
                
    </script>
  </head>
  <body onload="f_onload()">
  
  <c:import url="../include/precargador_ajax.jsp">
      <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
     <input type="hidden" name="operation" value=""/>
      <c:import url="../include/titulo_nt.jsp">
        <c:param name="modalidad">
          <fmt:message key="9901020"/>
        </c:param>
        <c:param name="formulario">
          <fmt:message key="9901020"/>
        </c:param>
        <c:param name="form">axisctr154</c:param>
      </c:import>
      <table id="tabla1" class="mainModalDimensions base" align="center"
             cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <!--campos-->
            <table class="seccion">
              <tr>
                <td>
                  <!-- Área 1 -->
                  <table class="area" align="center">
                    <tr>
                      <th style="width:20%;height:0px">
                        &nbsp;
                      </th>
                      <th style="width:5%;height:0px">
                        &nbsp;
                      </th>
                      <th style="width:75%;height:0px">
                        &nbsp;
                      </th>
                    </tr>
                    <tr>
                      <td class="titulocaja">
                        <b><fmt:message key="9900743"/></b>
                      </td>
                        <axis:ocultar f="axisctr154" c="NUMFICH">
                           <td class="titulocaja">
                              <b><axis:alt f="axisctr154" c="NUMFICH" lit="1000574"></axis:alt></b>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axisctr154" c="FHASTA">
                           <td class="titulocaja">
                              <b><axis:alt f="axisctr154" c="FHASTA" lit="103051"></axis:alt></b>
                            </td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                      <axis:ocultar f="axisctr154" c="CINOUT"
                                    dejarHueco="false">
                        <td class="campocaja">
                          <select name="CINOUT" id="CINOUT" style="width:95%"
                                  title="<fmt:message key='9900743' />" 
                                  <axis:atr f="axisctr154" c="CINOUT" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                  size="1" onchange="javascript:f_RecarregaMulti()" class="campowidthselect campo campotexto">
                            <option value="<%= Integer.MIN_VALUE %>">-<fmt:message key="108341"/>-</option>
                            <c:forEach items="${entradasalida}" var="item">
                                 <option value="${item.CATRIBU}"
                                 <c:if test="${item.CATRIBU == __formdata.CINOUT}">selected</c:if>>
                                 ${item.TATRIBU}
                                 </option>
                            </c:forEach>                            
                          </select>
                        </td>
                      </axis:ocultar>
                                <axis:ocultar f="axisctr154" c="NUMFICH"> 
                                    <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" name="NUMFICH" id="NUMFICH" title="<fmt:message key="1000574" />"
                                        <axis:atr f="axisctr154" c="NUMFICH" a="modificable=true&obligatorio=false&formato=decimal"/> size="15" onblur="javascript:ValidaNum(this)" maxlength="1" 
                                        value="<fmt:formatNumber pattern='#0' value='${__formdata.NUMFICH}'/>"/> 
                                    </td>
                                </axis:ocultar>
                                <axis:visible c="FHASTA" f="axisctr154">
                                <td class="campocaja">
                                                <input type="text" style="width:10%" class="campowidthinput campo campotexto"  id="FHASTA" name="FHASTA" size="15" onblur="javascript:f_RecarregaMulti2(this)"
                                                value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FHASTA}'/>" 
                                                <axis:atr f="axisctr154" c="FHASTA" a="formato=fecha"/> />
                                                <a id="icon_FHASTA" style="vertical-align:middle;" href="#">
                                                <img id="popup_calendario_FHASTA" border="0" alt="<fmt:message key="103051" />" 
                                                title="<fmt:message key="108341" />" src="images/calendar.gif"/></a>
                                            
                                        </td>   
                                </axis:visible>
                    </tr>
                    
                  </table>
                        <div class="separador">&nbsp;</div>
                    <div class="titulo"><b><fmt:message key="109232"/></b>
                    </div>                        
                            <!-- DisplayTag Pólizas -->
                            <c:set var="title1"><fmt:message key="800440"/></c:set>
                            <c:set var="title2"><fmt:message key="105940"/></c:set>
                            <c:set var="title3"><fmt:message key="9900744"/></c:set>
                            <c:set var="title4"><fmt:message key="100587"/></c:set>
                            <c:set var="title5"><fmt:message key="9001983"/></c:set>
                            <c:set var="title6"><fmt:message key="9900743"/></c:set>
                            <c:set var="title7"><fmt:message key="9002015"/></c:set>
                            <div class="seccion displayspaceGrande">
                            <%int contador = 0;%>
                            
                            <%-- ${sessionScope.axisctr_listaPolizas} --%>
                                <display:table name="${sessionScope.axisctr_listaPolizas}" id="miListaId" export="false" 
                                class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" 
                                requestURI="modal_axisctr154.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>                               
                                    <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="headwidth10 sortable"  media="html" autolink="false" >    
                                        <div class="dspText">
                                        ${miListaId.OB_IAX_TRASPASOS.NPOLIZA}
                                        <c:if test="${miListaId.MOSTRA_CERTIF == '1'}"> - ${miListaId.OB_IAX_TRASPASOS.NCERTIF}</c:if>
                                        </a>
                                        </div>
                                     <input type="hidden" id="STRAS_<%=contador%>" name="STRAS_<%=contador%>" value="${miListaId.OB_IAX_TRASPASOS.STRAS}"/>                                      
                                    </display:column>
                                    <%contador++;%>  
                                    <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">
                                        <a href="javascript:f_but_aceptar('${miListaId.OB_IAX_TRASPASOS.SSEGURO}','${miListaId.OB_IAX_TRASPASOS.STRAS}')">
                                        <c:if test="${miListaId.MOSTRA_CERTIF == '1'}"> - ${miListaId.OB_IAX_TRASPASOS.NCERTIF}</c:if>
                                        </a>
                                        </div>
                                        ${miListaId.OB_IAX_TRASPASOS.TNOMTOM}
                                    </display:column>
                                    <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">
                                        ${miListaId.OB_IAX_TRASPASOS.TCINOUT}
                                        </div>
                                    </display:column>
                                    <display:column title="${title4}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">
                                        ${miListaId.OB_IAX_TRASPASOS.TCESTADO}
                                        </div>
                                    </display:column>
                                    <display:column title="${title5}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                                         <div class="dspDate">
                                         <fmt:formatDate value='${miListaId.OB_IAX_TRASPASOS.FSOLICI}' pattern='dd/MM/yyyy'/>
                                         </div>
                                    </display:column>
                                    <display:column title="${title6}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">
                                        ${miListaId.OB_IAX_TRASPASOS.TCTIPTRAS}
                                        </div>
                                    </display:column>
                                    <display:column title="${title7}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">
                                        ${miListaId.OB_IAX_TRASPASOS.TCTIPTRASSOL}
                                        </div>
                                    </display:column>
                                </display:table>    
                                
                </td>
              </tr>               
            </table>
          </td>
        </tr>
      </table>
      <c:import url="../include/botonera_nt.jsp">
        <c:param name="__botones">cancelar,aceptar</c:param>
      </c:import>
     </form>
     <script type="text/javascript">
        <axis:visible c="FHASTA" f="axisctr154">
    Calendar.setup({
        inputField     :    "FHASTA",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "popup_calendario_FHASTA",  
        singleClick    :    true,
        firstDay       :    1
    });
    </axis:visible>
    </script>
    <c:import url="../include/mensajes.jsp"/></body>
</html>