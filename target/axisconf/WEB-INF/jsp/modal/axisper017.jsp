<%/* Revision:# EccBWOBX85pNmVyK1lJKzw== # */%>
<%-- 
*  Fichero: axisper0010.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*
*  Fecha: 23/07/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
     <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
		
       var nav4 = window.Event ? true : false;
		function ValidNum(evt) {
		    // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57
		    	var key = nav4 ? evt.which : evt.keyCode;
			    return (key <= 13 || (key >= 48 && key <= 57));
		}
        
        function f_onload() {
 				  <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper017');
					</c:if>
         		
            var OK = "${requestScope.OK}"; 
            
            PSPERSONOUT = "${__formdata.SPERSON}";
            PCAGENTEOUT = "${__formdata.CAGENTE}";
            PCTIPPER    = "${__formdata.CTIPPER}";
            canvipersona    = "${requestScope.canvipersona}";
            if (!objUtiles.estaVacio(OK))
                parent.f_aceptar_axisper017( PSPERSONOUT,PCAGENTEOUT,canvipersona);
        
            f_cargar_propiedades_pantalla();
            //BUG ini 24780
              <axis:visible c="SWRUT" f="axisper017">   
                 var CTIPIDE=objDom.getValorPorId("CTIPIDE");
                 var NNUMIDE=f_stripInvalidChars(objDom.getValorPorId("NNUMIDE"));
                 var TDIGITOIDE=objDom.getValorPorId("TDIGITOIDE");
                 if ((CTIPIDE == 41 || CTIPIDE == 42)  && !objUtiles.estaVacio(CTIPIDE) && !objUtiles.estaVacio(NNUMIDE) && objUtiles.estaVacio(TDIGITOIDE)){
                        var qs="operation=ajax_getdigito";
                        qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                        objAjax.invokeAsyncCGI("modal_axisper017.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
                 }
                </axis:visible>
           //BUG FIN 24780
           
                   //BUG 32649 ini
             <axis:visible c="SWRUT_COLM" f="axisper017">   
              objDom.setValorPorId("SWRUT","1");              
             var TDIGITOIDE=objDom.getValorPorId("TDIGITOIDE");
             var SWRUT=objDom.getValorPorId("SWRUT");
             var NNUMIDE=f_stripInvalidChars(objDom.getValorPorId("NNUMIDE"));
             var SWRUT_COLM=objDom.getValorPorId("SWRUT_COLM");
             objDom.setValorPorId("TDIGITOIDE_COLM",TDIGITOIDE);
             objDom.setValorPorId("SWRUT_COLM",SWRUT);
             var CTIPIDE=objDom.getValorPorId("CTIPIDE");
             
            if ((CTIPIDE == 41 || CTIPIDE == 42)  && !objUtiles.estaVacio(CTIPIDE) && !objUtiles.estaVacio(NNUMIDE) && objUtiles.estaVacio(TDIGITOIDE)){
                         var qs="operation=ajax_getdigito";
                        qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                        objAjax.invokeAsyncCGI("modal_axisper017.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
                   }
              objDom.setValorPorId("SWRUT","1");
              objDom.setValorPorId("SWRUT_COLM","1");          
              objDom.setValorPorId("SWRUT_COLM_OCULTO","1");
            </axis:visible>
              //BUG 32649 FIN
           
        }
        function f_stripInvalidChars( str ){
                str =str.toUpperCase() + '';
                var rgx = /^[\060-\071]|[\101-\132]|[\141-\172]$/i;
                var out = '';
                for( var i = 0; i < str.length; i++ ){
                    if( rgx.test( str.charAt(i) ) ){
                        out += str.charAt(i);
                    }
                }
                return out;
         }        
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisper017.do", "grabarPersona", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
       

        
        function f_but_cancelar() {
        isNew ='${__formdata.isNew}';
        parent.f_cerrar_axisper017(isNew);
        }        
        
        function f_onchange_CTIPPER(CTIPPER) {
            formdataCTIPPER = '${__formdata.CTIPPER}';  
            if (CTIPPER != formdataCTIPPER ) {
                // Recargar formulario para esconder/mostrar campos en función de CTIPPER
                objUtiles.ejecutarFormulario("modal_axisper017.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
//BUG 32649 ini 
         function f_onchange_TDIGITOIDE_COLM(TDIGITOIDE_COLM) {
             var TDIGITOIDE=objDom.getValorPorId("TDIGITOIDE");                 
			 if (document.getElementById("TDIGITOIDE_COLM") != null ){
                document.getElementById("TDIGITOIDE_COLM").value =	 TDIGITOIDE_COLM.toUpperCase();
               }
            if ( TDIGITOIDE != TDIGITOIDE_COLM.toUpperCase() ) {
                 alert("<axis:alt f="axisper017." c="ALER_ERR" lit="9903982"/>"); //digito de control incorreco
                  document.getElementById("TDIGITOIDE_COLM").focus();
                  objDom.setValorPorId("TDIGITOIDE_COLM","");
                document.miForm.TDIGITOIDE_COLM.focus();
             }            
        }
           //BUG 32649 fin 
        
        function f_onchange_CTIPIDE(CTIPIDE) {
            formdataCTIPIDE = '${__formdata.CTIPIDE}';
            if (CTIPIDE != "<%= Integer.MIN_VALUE %>" && CTIPIDE != formdataCTIPIDE ) {
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objDom.setValorPorId("NNUMIDE", "");
                 <axis:visible c="SWRUT" f="axisper017">
                objDom.setValorPorId("TDIGITOIDE", "");
                objDom.setValorPorId("TDIGITOIDE_COLM", "");
                </axis:visible>
                objUtiles.ejecutarFormulario("modal_axisper017.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        } 
       function f_onclickCheckbox(thiss) {
           thiss.value =  ((thiss.checked)?1:0);
           objDom.setValorPorId(thiss.id, thiss.value);
          
            }
            
            
            function f_onclickCheckbox_SWRUT(thiss) {
           thiss.value =  ((thiss.checked)?1:0);
           objDom.setValorPorId(thiss.id, thiss.value);
            <axis:visible c="SWRUT" f="axisper017">
            if (thiss.value  == 1 ){
            	 
                    var CTIPIDE=objDom.getValorPorId("CTIPIDE");
                    var NNUMIDE=objDom.getValorPorId("NNUMIDE");
                    
                    var qs="operation=ajax_getdigito";
                    qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                    if (!objUtiles.estaVacio(CTIPIDE) && !objUtiles.estaVacio(NNUMIDE))
                    objAjax.invokeAsyncCGI("modal_axisper017.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
                    
               }else {
                objDom.setValorPorId("TDIGITOIDE",'');
               
               }
               </axis:visible>
            }
        
        function callbackajaxdigito (ajaxResponseText){
            try{ 

                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                
                  if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[0])) {
                    objDom.setValorPorId("TDIGITOIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0));
                  }else{
                      objDom.setValorPorId("TDIGITOIDE",'');
                       objDom.setValorPorId("TDIGITOIDE_COLM",'');
                      
                  }
                  f_cargar_propiedades_pantalla();
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        function f_changeNNUMIDE(){
         <axis:visible c="SWRUT" f="axisper017">
            var SWRUT=objDom.getValorPorId("SWRUT");
                if (SWRUT  == 1 ){
                    var CTIPIDE=objDom.getValorPorId("CTIPIDE");
                    var NNUMIDE=objDom.getValorPorId("NNUMIDE");
                    
                    var qs="operation=ajax_getdigito";
                    qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                    objAjax.invokeAsyncCGI("modal_axisper017.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
               }else {
                objDom.setValorPorId("TDIGITOIDE",'');
                objDom.setValorPorId("TDIGITOIDE_COLM",'');
               }
        </axis:visible>
        
  <axis:visible c="SWRUT_COLM" f="axisper017">   
              objDom.setValorPorId("SWRUT","1"); 
              var SWRUT=objDom.getValorPorId("SWRUT");
              var SWRUT_COLM=objDom.getValorPorId("SWRUT_COLM");
            objDom.setValorPorId("SWRUT_COLM",SWRUT);
                     
             if (SWRUT_COLM  == 1 ){
                    var CTIPIDE=objDom.getValorPorId("CTIPIDE");
                    var NNUMIDE=objDom.getValorPorId("NNUMIDE");
                    
                    var qs="operation=ajax_getdigito";
                    qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                    objAjax.invokeAsyncCGI("modal_axisper017.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
               }else {
                objDom.setValorPorId("TDIGITOIDE",'');
                objDom.setValorPorId("TDIGITOIDE_COLM",'');
               }
              objDom.setValorPorId("SWRUT","1"); 
              objDom.setValorPorId("SWRUT_COLM_OCULTO","1");          
            </axis:visible>
        }
        
    </script>
  </head>
    <body onload="f_onload()">
        <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
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
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" id="SWRUT_COLM_OCULTO" NAME="SWRUT_COLM_OCULTO" value="${__formdata.SWRUT_COLM_OCULTO}"/>    
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper017" c="formulario" lit="110275" /></c:param>
                <c:param name="producto"><axis:alt f="axisper017" c="producto" lit="110275" /></c:param>
                <c:param name="form">axisper017</c:param>
            </c:import>

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
           
                    <tr>
                        <td>
                        <div class="separador">&nbsp;</div>
                         <div class="titulo">
                            <img src="images/flecha.gif"/> 
                            <b><axis:alt f="axisper017" c="titulo" lit="110275"/></b>
                           
                        </div>
                        <%-- Datos persona --%>
                        <table class="seccion">
                            <tr>
                                <th style="width:4%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:16%;height:0px"></th>
                                <th style="width:16%;height:0px"></th>
                                <th style="width:11%;height:0px"></th>                                
                            <tr>
                            
                            <tr>
                                <td>
                                    &nbsp; 
                                </td>
                                <td class="titulocaja">
                                  <b><axis:alt f="axisper017" c="CTIPPER" lit="102844"/></b>
                                </td>
                                <td class="titulocaja">
                                  <b><axis:alt f="axisper017" c="CTIPIDE" lit="109774"/></b>
                                </td>
                                <td class="titulocaja">
                                  <b><axis:alt f="axisper017" c="NNUMIDE" lit="105330"/></b>
                                </td>
                                 <%--<c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}">--%>
                                <axis:ocultar c="CSEXPER" f="axisper017" dejarHueco="false" >
                                <td class="titulocaja" id="td_LTCSEXPER">
                                    <b><axis:alt f="axisper017" c="CSEXPER" lit="100962"/></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar c="FNACIMI" f="axisper017" dejarHueco="false" >
                                <td class="titulocaja" id="td_LTFNACIMI">
                                    <b id="label_FNACIMI"><axis:alt f="axisper017" c="FNACIMI" lit="1000064"/></b>
                                </td> 
                                </axis:ocultar>
                                <%--</c:if>--%>
                                <td class="titulocaja">
                                    <!-- 34989/209710 Ocultar el titulo de Public Person -->
                                    <axis:ocultar c="SWPUBLI" f="axisper017" dejarHueco="false">                                
                                    <b><axis:alt f="axisper017" c="SWPUBLI" lit="9000792"/></b>
                                    </axis:ocultar>
                                </td> 
                                <axis:ocultar c="CPREAVISO" f="axisper017" dejarHueco="false" >
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisper017" c="CPREAVISO" lit="9903597"/></b>
                                    </td>
                                 </axis:ocultar>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp; 
                                </td>
                                <td class="campocaja"> <!-- ** LCF ** NOMBRE CAMPO -->
                                    <select name="CTIPPER" id="CTIPPER" size="1" title="<axis:alt f="axisper017" c="CTIPPER" lit="102844"/>" onchange="f_onchange_CTIPPER(this.value)" class="campowidthselect campo campotexto_ob" 
                                    style="width:100%;" <axis:atr f="axisper017" c="CTIPPER" a="isInputText=false&obligatorio=true"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper017" c="blanco" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipPerson}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CTIPPER}"> selected </c:if> /> <!-- ** LCF ** -->
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja">
                                    <select name="CTIPIDE" id="CTIPIDE" size="1" onchange="f_onchange_CTIPIDE(this.value)"  title="<axis:alt f="axisper017" c="CTIPIDE" lit="109774"/>"
                                    class="campowidthselect campo campotexto_ob" style="width:100%;" <axis:atr f="axisper017" c="CTIPIDE" a="isInputText=false&obligatorio=true"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper017" c="blanco" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipDocum}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja" >
                                    <input type="text" onchange="f_changeNNUMIDE();" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.NNUMIDE}" title="<axis:alt f="axisper017" c="NNUMIDE" lit="105330"/>" <axis:atr f="axisper017" c="NNUMIDE" a="modificable=true&obligatorio=true"/>
                                    name="NNUMIDE" id="NNUMIDE" <c:if test="${!empty __formdata.CTIPIDE && __formdata.CTIPIDE == 0}" > disabled </c:if> style="width:50%;" onkeypress="return ValidNum(event);" />
                                    <c:if test="${!empty __formdata.NNUMIDE && __formdata.CTIPIDE == 0 }"> 
                                      <input type="hidden" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" style="width:50%;">
                                      </c:if>
                                 </td>
                                 <%--<c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}">--%>
                                 
                                 <axis:visible c="CSEXPER" f="axisper017" >
                                 <td class="campocaja" id="td_CSEXPER">
                                    <select name="CSEXPER" id="CSEXPER" size="1" class="campowidthselect campo campotexto" style="width:90%;" title="<axis:alt f="axisper017" c="CSEXPER" lit="100962"/>" <axis:atr f="axisper017" c="CSEXPER" a="modificable=true&obligatorio=false"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper017" c="blanco" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipSexo}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CSEXPER}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                
                                <axis:ocultar c="FNACIMI" f="axisper017" dejarHueco="false" >
                                 <td class="campocaja" id="td_FNACIMI">
                                    <input onmousemove="this.title=document.getElementById('label_FNACIMI').innerText" type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNACIMI}"/>" name="FNACIMI" id="FNACIMI"  style="width:85%;"
                                    title= "<axis:alt f="axisper017" c="FNACIMI" lit="1000064"/>"  <axis:atr f="axisper017" c="FNACIMI" a="modificable=true&obligatorio=true&formato=fecha"/>  />
                                    <a style="vertical-align:middle;"><img id="popup_calendario_FNACIMI" alt="<axis:alt f="axisper017" c="FNACIMI4" lit="108341"/>"  src="images/calendar.gif" onmousemove="this.title=document.getElementById('label_FNACIMI').innerText"/></a>
                                </td>
                                </axis:ocultar>
                                <%--</c:if>--%>
                                 <td class="campocaja">
                                    <!-- 34989/209710 Ocultar el titulo de Public Person -->
                                    <axis:ocultar c="SWPUBLI" f="axisper017" dejarHueco="false">    
                                            <input onClick="f_onclickCheckbox(this);" type="checkbox" id="SWPUBLI" name="SWPUBLI"
                                            <c:if test="${__formdata.SWPUBLI == 1}">checked="true"</c:if>  value="${__formdata.SWPUBLI}"/>
                                    </axis:ocultar>
                                 </td>
                                 
                                 <axis:ocultar c="CPREAVISO" f="axisper017" dejarHueco="false" >
                                    <td class="campocaja" id="td_CPREAVISO">
                                        <select name="CPREAVISO" id="CPREAVISO" size="1" class="campowidthselect campo campotexto" style="width:90%;" title="<axis:alt f="axisper017" c="CPREAVISO" lit="9903597"/>" <axis:atr f="axisper017" c="CPREAVISO" a="modificable=true&obligatorio=false"/>>
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper017" c="blanco" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.tipPreaviso}">
                                                <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CPREAVISO}"> selected </c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                 </axis:ocultar>
                            </tr>
                                        
                           <tr>
                            <td></td>
                             <axis:ocultar c="SWRUT" f="axisper017"  dejarHueco="false">
                             <td class="titulocaja" colspan="2" id="tit_SWRUT">
                               <table>
                               <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                
                                            <td class="titulocaja" >
                                                <b id="label_SWRUT"><axis:alt f="axisper017" c="SWRUT" lit="9903067"/></b>
                                            </td>
                                            <td class="titulocaja" id="tit_TDIGITOIDE">
                                                <b id="label_TDIGITOIDE"><axis:alt f="axisper017" c="TDIGITOIDE" lit="9903068"/></b>
                                            </td>
                                   </tr>
                                   </table>
                                   </td>
                                </axis:ocultar>
                                 <%--BUG 32649 ini--%>
                                  <axis:ocultar c="SWRUT_COLM" f="axisper017"  dejarHueco="false">
                             <td class="titulocaja" colspan="2" id="tit_SWRUT">
                               <table>
                               <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                
                                            <td class="titulocaja" >
                                                <b id="label_SWRUT_COLM"><axis:alt f="axisper017" c="SWRUT_COLM" lit="9904620"/></b>
                                            </td>
                                            <td class="titulocaja" id="tit_TDIGITOIDE_COLM">
                                                <b id="label_TDIGITOIDE_COLM"><axis:alt f="axisper017" c="TDIGITOIDE_COLM" lit="9903068"/></b>
                                            </td>
                                   </tr>
                                   </table>
                                   </td>
                                </axis:ocultar>
                                <%-- BUG 32649 fin--%>
                            </tr>
                            <tr>
                            <td></td>
                             <axis:ocultar c="SWRUT" f="axisper017"  dejarHueco="false">
                                <td class="campocaja" id="td_SWRUT" colspan="2">
                                <table>
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                <td class="campocaja">
                              
                                      <input onClick="f_onclickCheckbox_SWRUT(this)" type="checkbox" id="SWRUT" name="SWRUT"  <axis:atr f="axisper017" c="SWRUT" a="isInputText=false"/> 
                                      <c:if test="${__formdata.SWRUT == 1}">checked="true"</c:if>  value="${__formdata.SWRUT}"/>
                                </td>
                                <td class="campocaja" id="td_TDIGITOIDE">
                                   <input type="text" class="campowidthinput campo campotexto" size="50" onkeypress="return ValidNum(event);"
                                    value="${__formdata.TDIGITOIDE}" name="TDIGITOIDE" id="TDIGITOIDE"  style="width:25%;"
                                    <axis:atr f="axisper017" c="TDIGITOIDE" a="modificable=false"/>>
                                            
                                </td>
                                </tr>
                                </table>
                                </td>
                                </axis:ocultar>
                                 
                                  <%-- BUG 32649 INI --%>
                            <axis:ocultar c="SWRUT_COLM" f="axisper017"  dejarHueco="false">
                                <td class="campocaja" id="td_SWRUT_COLM" colspan="2">
                                <table>                                
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                <td class="campocaja" >                                	
                                    <input onClick="f_onclickCheckbox(this)" type="checkbox" id="SWRUT_COLM" name="SWRUT_COLM"  <axis:atr f="axisper017" c="SWRUT_COLM" a="modificable=false&isInputText=false"/> 
                                      <c:if test="${__formdata.SWRUT_COLM == 1}">checked="true"</c:if>  value="${__formdata.SWRUT}"/>                                                                                                               
                                </td>
                                <td class="campocaja" id="td_TDIGITOIDE_COLM">
                                   <input type="text" class="campowidthinput campo campotexto" size="50" onkeypress="return ValidNum(event);"
                                    title='<axis:alt f="axisper017" c="TDIGITOIDE_COLM" lit="9903068"/>' 
                                    	<axis:atr f="axisper017" c="TDIGITOIDE_COLM" a="modificable=true"/>
                                    value="${__formdata.TDIGITOIDE_COLM}" name="TDIGITOIDE_COLM" id="TDIGITOIDE_COLM" onchange="f_onchange_TDIGITOIDE_COLM(this.value)"  style="width:25%;"
                                    <%--  <c:if test="${empty __formdata.isNew}"> <axis:atr f="axisper017" c="TDIGITOIDE_COLM" a="modificable=false"/> </c:if>   --%>
                                       <axis:atr f="axisper017" c="TDIGITOIDE_COLM" /> >
                                            
                                </td>
                                </tr>
                                </table>
                                </td>
                            </axis:ocultar>
                                <%-- BUG 32649 fin --%>
                            </tr>
                        </table>

                       
            
            <div class="separador">&nbsp;</div>
            <div class="separador">&nbsp;</div>
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper017</c:param><c:param name="f">axisper017</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
         <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FNACIMI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FNACIMI", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
     
        
        <c:import url="../include/mensajes.jsp" />
		</div>
    </body>
</html>

