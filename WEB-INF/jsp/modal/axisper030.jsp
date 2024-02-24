<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%/*
*  Fichero: axisper030.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 07/07/2008
*/
%>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">

    <c:import url="../include/carga_framework_js.jsp" />    
          <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
          <script type="text/javascript" src="scripts/calendar.js"></script>
          <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
          <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
    
        function f_but_salir() {
            parent.f_cerrar_modal('axisper030');                      
        }
        
        function f_onload() {
             f_cargar_propiedades_pantalla();
             document.getElementById("myTDESC").focus();
        }
        
        function f_enviar_datos() {
            var userAgent = "${header['User-agent']}";
            
            // En FF, no se recogen bien los acentos en el Fileupload Servlet. 
            // Por eso, pasamos el nombre de fichero como un campo hidden.
            // En IE, se recoge de forma normal, con item.getName().
            if (userAgent.indexOf("Firefox") > 0)
                objDom.setValorPorId("TFILENAME", objDom.getValorPorId("TFILE"));
            
            objDom.setValorPorId("TDESC", objDom.getValorPorId("myTDESC"));
            objDom.setValorPorId("IDCAT", objDom.getValorPorId("myIDCAT"));
            
            objDom.setValorPorId("TIPDOCUMENTO", objDom.getValorPorId("myTIPDOCUMENTO"));
            objDom.setValorPorId("EDODOCUMENTO", objDom.getValorPorId("myEDODOCUMENTO"));
            
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
            document.miForm.submit();
            
        }
        
        function f_but_aceptar(){
         if (objValidador.validaEntrada()) { 
        	 
        	var SPERSON=document.miForm.SPERSON.value;
          	var CAGENTE=document.miForm.CAGENTE.value;
          	var IDDOCGEDOX=document.miForm.IDDOCGEDOX.value;
          	
          	var campos = "&SPERSON="+SPERSON+"&CAGENTE="+CAGENTE+"&IDDOCGEDOX="+IDDOCGEDOX;
        	 
             if( objUtiles.estaVacio(objDom.getValorPorId("IDDOCGEDOX"))){
            	 f_enviar_datos();
             }else{
            	 objUtiles.ejecutarFormulario("modal_axisper030.do", "actualizardoc", document.miForm, "_0.self", objJsMessages.jslit_cargando);
             }
                      
                
                // Para test:
                // Comentar los if y demas y dejar solo la invocacion al formulario de esta manera:: objUtiles.ejecutarFormulario("modal_axisper030.do", "actualizardoc",  document.miForm, "_self", objJsMessages.jslit_cargando);
                // Colocar el form de esta manera: <form name="miForm"  action="" method="POST">
         }
        }
        
        
           function f_cambiar (valor) {
                 
                var documento=valor.value;  
                var fedo=objDom.getValorPorId("FEDO");
                
                objAjax.invokeAsyncCGI("modal_axisper030.do?", callbackAjaxCargarFecha, "operation=ajax_f_cambiarcaducidad&documento="+documento+"&fedo="+fedo, this, objJsMessages.jslit_cargando);
           }
           
           function callbackAjaxCargarFecha(ajaxResponseText){
           
                 var doc=objAjax.domParse(ajaxResponseText);
                 var fcadu = doc.getElementsByTagName("FECHACADUCIDAD");
               
                 objDom.setValorPorId("FCADUCIDAD", objDom.getValorNodoDelComponente(doc.getElementsByTagName("FECHACADUCIDAD"), 0, 0));
          }

   </script>
  </head>
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
       
       <c:choose>
       
       <c:when test="${empty __formdata.IDDOCGEDOX}">
      <form name="miForm" enctype='multipart/form-data' action="Axisper030Servlet" method="POST" accept-charset='UTF-8'> 
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisper030" c="TITULO" lit="1000431"/></c:param>
            <c:param name="formulario"><axis:alt f="axisper030" c="TITFORM" lit="1000614"/></c:param>
            <c:param name="form">axisper030</c:param>
        </c:import>
        <input type="hidden" id="TDESC" name="TDESC" value=""/>
        <input type="hidden" id="SPERSON" name="SPERSON" value="${param.SPERSON}"/>
        <input type="hidden" id="CAGENTE" name="CAGENTE" value="${param.CAGENTE}"/>
        <input type="hidden" id="IDDOCGEDOX" name="IDDOCGEDOX" value="${__formdata.IDDOCGEDOX}"/>
        <input type="hidden" id="NDOCUME" name="NDOCUME" value="${__formdata.NDOCUME}"/>
        <input type="hidden" id="NTRAMIT" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
        <input type="hidden" id="ORIGEN" name="ORIGEN" value="${__formdata.ORIGEN}"/>
        <input type="hidden" id="IDCAT" name="IDCAT" value=""/>
        <input type="hidden" id="TIPDOCUMENTO" name="TIPDOCUMENTO" value=""/>
        <input type="hidden" id="EDODOCUMENTO" name="EDODOCUMENTO" value=""/>
        <input type="hidden" id="TFILENAME" name="TFILENAME" value=""/>        
        <input type="hidden" id="operation" name="operation" value=""/> 
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">
            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>                                            
                    
                    <table class="seccion">                                            
                        <tr>
                            <th style="width:5%;height:0%">&nbsp;</th>
                            <th style="width:20%;height:0%">&nbsp;</th>
                            <th style="width:20%;height:0%">&nbsp;</th>
                            <th style="width:25%;height:0%">&nbsp;</th>
                            <th style="width:30%;height:0%">&nbsp;</th>
                            
                        </tr>
                        <tr>
                            <td> 
                                &nbsp;
                            </td>                            
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="FITXER" lit="1000574"/></b> <%-- FITXER --%>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <c:if test="${empty __formdata.IDDOCGEDOX}">
                            <td class="campocaja" colspan="3">   
                                <input type="file" size="70" class="campowidthinput campo campotexto"  name="TFILE" id="TFILE" title="<axis:alt f="axisper030" c="TFILE" lit="1000574"/>" obligatorio="true"/>                                
                                <div class="separador">&nbsp;</div>                                                        
                            </td>
                            </c:if>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        
                            <axis:ocultar c="TDESC" f="axisper030" dejarHueco="false">
                            <td class="titulocaja">
                                <b id="label_TDESC"><axis:alt f="axisper030" c="myTDESC" lit="100588"/></b>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                             <axis:ocultar c="TDESC" f="axisper030" dejarHueco="false">
                            <td class="campocaja" colspan="3" >                             
                                <input type="text" name="myTDESC" id="myTDESC" class="campowidthinput campo campotexto" 
                                title="<axis:alt f="axisper030" c="myTDESC" lit="100588"/>"  value="${__formdata.myTDESC}"
                                <c:if test="${!empty __formdata.IDDOCGEDOX}"><axis:atr f="axisper030" c="myTDESC" a="modificable=false&obligatorio=true"/></c:if>/>                                
                                <div class="separador">&nbsp;</div>                               
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="myIDCAT" lit="1000612"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="campocaja"  colspan="3">                             
                                <select name = "myIDCAT" id ="myIDCAT" size="1" obligatorio="true" title="<axis:alt f="axisper030" c="myIDCAT" lit="1000612"/>" 
                                    class="campowidthselect campo campotexto_ob" style="width:50%;"
                                    <c:if test="${!empty __formdata.IDDOCGEDOX}">disabled="disabled"</c:if>>&nbsp;
                                        <option value="null"> - <axis:alt f="axisper030" c="SNV_COMBO" lit="108341"/> - </option> 
                                    <c:forEach items="${__formdata.LSTCATEGOR}" var="LSTCATEGOR">
                                        <option value = "${LSTCATEGOR.IDCAT}" <c:if test="${LSTCATEGOR.IDCAT  == __formdata.myIDCAT}">selected</c:if>>${LSTCATEGOR.TDESCRIP}</option>
                                    </c:forEach>
                                </select>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>          
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="TOBSERVACIONES" lit="101162"/></b>
                            </td>    
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td colspan="3" style="width:100%;"  class="campocaja"> <!-- colspan="5" -->
                                 <axis:ocultar c="OBSERVACIONES" f="axisper030" dejarHueco="false">
                                     <textarea class="campowidthinput campo campotexto" style="width:100%;"  name="OBSERVACIONES" id="OBSERVACIONES">${__formdata.OBSERVACIONES}</textarea>
                                 </axis:ocultar>
                            </td>
                        </tr>
                       <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="FCADUCIDAD" lit="9001356"/></b>
                            </td> 
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="FALTA" lit="105887"/></b>
                            </td> 
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:ocultar c="FCADUCIDAD" f="axisper030" dejarHueco="false" >
                                 <td class="campocaja" >
                                    <input  type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCADUCIDAD}"/>" name="FCADUCIDAD" id="FCADUCIDAD"  style="width:50%;"
                                    title= "<axis:alt f="axisper030" c="FCADUCIDAD" lit="9001356"/>" <axis:atr f="axisper030" c="FCADUCIDAD" a="modificable=true&obligatorio=false&formato=fecha"/>  />
                                    <a style="vertical-align:middle;"><img id="popup_calendario_FCADUCIDAD" alt="<axis:alt f="axisper030" c="FCADUCIDAD" lit="9001356"/>"  src="images/calendar.gif" </a>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar c="FALTA" f="axisper030" dejarHueco="false" >
                                 <td class="campocaja" >
                                    <input  type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FALTA}"/>" name="FALTA" id="FALTA"  style="width:50%;"
                                    title= "<axis:alt f="axisper030" c="FALTA" lit="105887"/>"  
                                    <axis:atr f="axisper030" c="FALTA" a="modificable=false&obligatorio=false&formato=fecha"/> />
                                 </td>
                            </axis:ocultar>
                        </tr>
                        
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:ocultar c="myTIPDOCUMENTO" f="axisper030" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="myTIPDOCUMENTO" lit="105330"/></b>
                            </td> 
                            </axis:ocultar>
                            <axis:ocultar c="myEDODOCUMENTO" f="axisper030" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="myEDODOCUMENTO" lit="100587"/></b>
                            </td> 
                            </axis:ocultar>
                            <axis:ocultar c="FEDO" f="axisper030" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="FEDO" lit="9900983"/></b>
                            </td> 
                            </axis:ocultar>
                       </tr>
                       <tr>
                           <td>
                                &nbsp;
                            </td>
                            <axis:ocultar c="myTIPDOCUMENTO" f="axisper030" dejarHueco="false" >
                            <td class="campocaja" >                             
                                <select name = "myTIPDOCUMENTO" id ="myTIPDOCUMENTO" size="1" obligatorio="true" title="<axis:alt f="axisper030" c="myTIPDOCUMENTO" lit="105330"/>" onchange="f_cambiar(this);"  
                                 dir="<axis:alt f='axisper030' c='myTIPDOCUMENTO' lit='105330' />" class="campowidthselect campo campotexto_ob" style="width:50%;" 
                                    <c:if test="${!empty __formdata.IDDOCGEDOX}">disabled="disabled"</c:if>>&nbsp;
                                        <option value="null"> - <axis:alt f="axisper030" c="SNV_COMBO" lit="108341"/> - </option> 
                                    <c:forEach var="documents" items="${requestScope.documents}"  varStatus="cont">
                                        <option value = "${documents.CATRIBU}"
                                          <c:if test="${__formdata.myTIPDOCUMENTO == documents.CATRIBU}">selected</c:if>
                                            >
                                            ${documents.TATRIBU}
                                      </option>
                                    </c:forEach>
                                </select>
                                <div class="separador">&nbsp;</div>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar c="myEDODOCUMENTO" f="axisper030" dejarHueco="false" >
                            <td class="campocaja">                             
                                <select name = "myEDODOCUMENTO" id ="myEDODOCUMENTO" size="1" obligatorio="true" title="<axis:alt f="axisper030" c="myEDODOCUMENTO" lit="100587"/>" alt="<axis:alt f='axisper030' c='myEDODOCUMENTO' lit='100587' />" 
                                    class="campowidthselect campo campotexto_ob" style="width:50%;" 
                                    <c:if test="${!empty __formdata.IDDOCGEDOX}">disabled="disabled"</c:if>>&nbsp;
                                        <option value="null"> - <axis:alt f="axisper030" c="SNV_COMBO" lit="108341"/> - </option> 
                                    <c:forEach var="estados" items="${requestScope.estados}"  varStatus="cont">
                                        <option value = "${estados.CATRIBU}"
                                          <c:if test="${__formdata.myEDODOCUMENTO == estados.CATRIBU}">selected</c:if>
                                            >
                                            ${estados.TATRIBU}
                                      </option>
                                    </c:forEach>
                                </select>
                                <div class="separador">&nbsp;</div>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar c="FEDO" f="axisper030" dejarHueco="false" >
                            <td class="campocaja" >
                                    <input  type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEDO}"/>" name="FEDO" id="FEDO"  style="width:50%;"
                                    title= "<axis:alt f="axisper030" c="FEDO" lit="9900983"/>"  <axis:atr f="axisper030" c="FEDO" a="modificable=true&obligatorio=false&formato=fecha"/>  />
                                    <a style="vertical-align:middle;"><img id="popup_calendario_FEDO" alt="<axis:alt f="axisper030" c="FEDO" lit="9900983"/>"  src="images/calendar.gif" </a>
                           </td>
                           </axis:ocultar>
                       </tr>    
                    </table>
                </td>
            </tr>
        </table>
         </form> 
         </c:when>
         <c:otherwise>
          <form name="miForm030" action="" method="POST">
           <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisper030" c="TITFORM" lit="1000614"/></c:param>
            <c:param name="form">axisper030</c:param>
        </c:import>
        
        <input type="hidden" id="SPERSON" name="SPERSON" value="${param.SPERSON}"/>
        <input type="hidden" id="CAGENTE" name="CAGENTE" value="${param.CAGENTE}"/>
        <input type="hidden" id="IDDOCGEDOX" name="IDDOCGEDOX" value="${__formdata.IDDOCGEDOX}"/>
        <input type="hidden" id="NDOCUME" name="NDOCUME" value="${__formdata.NDOCUME}"/>
        <input type="hidden" id="ORIGEN" name="ORIGEN" value="${__formdata.ORIGEN}"/>
        <input type="hidden" id="IDCAT" name="IDCAT" value="${__formdata.myIDCAT}"/>
        <input type="hidden" id="TIPDOCUMENTO" name="TIPDOCUMENTO" value="${__formdata.myTIPDOCUMENTO}"/>
        <input type="hidden" id="EDODOCUMENTO" name="EDODOCUMENTO" value="${__formdata.myEDODOCUMENTO}"/>
               
        <input type="hidden" id="operation" name="operation" value=""/> 
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">
            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>                                            
                    
                    <table class="seccion">                                            
                        <tr>
                            <th style="width:5%;height:0%">&nbsp;</th>
                            <th style="width:20%;height:0%">&nbsp;</th>
                            <th style="width:20%;height:0%">&nbsp;</th>
                            <th style="width:25%;height:0%">&nbsp;</th>
                            <th style="width:30%;height:0%">&nbsp;</th>
                            
                        </tr>
                        <tr>
                            <td> 
                                &nbsp;
                            </td>                            
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="FITXER" lit="1000574"/></b> <%-- FITXER --%>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            
                            <c:if test="${!empty __formdata.IDDOCGEDOX}">
                           <td class="campocaja" colspan="3">   
                                <input type="text" size="70" class="campowidthinput campo campotexto"  name="TFILE" id="TFILE" value="${__formdata.TFILE}" 
                                        title="<axis:alt f="axisper030" c="TFILE" lit="1000574"/>"
                                        <axis:atr f="axisper030" c="TFILE" a="modificable=false&obligatorio=true"/>/>                                
                                <div class="separador">&nbsp;</div>                                                        
                            </td>
                           </c:if>
                   
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                              <axis:ocultar c="TDESC" f="axisper030" dejarHueco="false">
                            <td class="titulocaja">
                                <b  id="label_TDESC"><axis:alt f="axisper030" c="myTDESC" lit="100588"/></b>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                              <axis:ocultar c="TDESC" f="axisper030" dejarHueco="false">
                            <td class="campocaja" colspan="3" >                             
                                <input type="text" name="myTDESC" id="myTDESC" class="campowidthinput campo campotexto" 
                                title="<axis:alt f="axisper030" c="myTDESC" lit="100588"/>" value="${__formdata.myTDESC}"
                                <c:if test="${!empty __formdata.IDDOCGEDOX}"><axis:atr f="axisper030" c="myTDESC" a="modificable=false&obligatorio=true"/></c:if>/>                                
                                <div class="separador">&nbsp;</div>                               
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="myIDCAT" lit="1000612"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="campocaja"  colspan="3">                             
                                <select name = "myIDCAT" id ="myIDCAT" size="1" obligatorio="true" title="<axis:alt f="axisper030" c="myIDCAT" lit="1000612"/>" 
                                    class="campowidthselect campo campotexto_ob" style="width:50%;"
                                    <c:if test="${!empty __formdata.IDDOCGEDOX}">disabled="disabled"</c:if>>&nbsp;
                                        <option value="null"> - <axis:alt f="axisper030" c="SNV_COMBO" lit="108341"/> - </option> 
                                    <c:forEach items="${__formdata.LSTCATEGOR}" var="LSTCATEGOR">
                                        <option value = "${LSTCATEGOR.IDCAT}" <c:if test="${LSTCATEGOR.IDCAT  == __formdata.myIDCAT}">selected</c:if>>${LSTCATEGOR.TDESCRIP}</option>
                                    </c:forEach>
                                </select>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>          
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="TOBSERVACIONES" lit="101162"/></b>
                            </td>    
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td colspan="3" style="width:100%;"  class="campocaja"> <!-- colspan="5" -->
                                 <axis:ocultar c="OBSERVACIONES" f="axisper030" dejarHueco="false">
                                     <textarea class="campowidthinput campo campotexto" style="width:100%;"  name="OBSERVACIONES" id="OBSERVACIONES">${__formdata.OBSERVACIONES}</textarea>
                                 </axis:ocultar>
                            </td>
                        </tr>
                       <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="FCADUCIDAD" lit="9001356"/></b>
                            </td> 
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="FALTA" lit="105887"/></b>
                            </td> 
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:ocultar c="FCADUCIDAD" f="axisper030" dejarHueco="false" >
                                 <td class="campocaja" >
                                    <input  type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCADUCIDAD}"/>" name="FCADUCIDAD" id="FCADUCIDAD"  style="width:50%;"
                                    title= "<axis:alt f="axisper030" c="FCADUCIDAD" lit="9001356"/>"  <axis:atr f="axisper030" c="FCADUCIDAD" a="modificable=true&obligatorio=false&formato=fecha"/>  />
                                    <a style="vertical-align:middle;"><img id="popup_calendario_FCADUCIDAD" alt="<axis:alt f="axisper030" c="FCADUCIDAD" lit="9001356"/>"  src="images/calendar.gif" </a>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar c="FALTA" f="axisper030" dejarHueco="false" >
                                 <td class="campocaja" >
                                    <input  type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FALTA}"/>" name="FALTA" id="FALTA"  style="width:50%;"
                                    title= "<axis:alt f="axisper030" c="FALTA" lit="105887"/>"  
                                    <axis:atr f="axisper030" c="FALTA" a="modificable=false&obligatorio=false&formato=fecha"/> />
                                 </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                           <axis:ocultar c="myTIPDOCUMENTO" f="axisper030" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="myTIPDOCUMENTO" lit="105330"/></b>
                            </td> 
                            </axis:ocultar>
                            <axis:ocultar c="myEDODOCUMENTO" f="axisper030" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="myEDODOCUMENTO" lit="100587"/></b>
                            </td> 
                            </axis:ocultar>
                            <axis:ocultar c="FEDO" f="axisper030" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisper030" c="FEDO" lit="9900983"/></b>
                            </td> 
                            </axis:ocultar>
                        </tr>
                         <tr>
                           <td>
                                &nbsp;
                            </td>
                        <axis:ocultar c="myTIPDOCUMENTO" f="axisper030" dejarHueco="false" >
                            <td class="campocaja" >                             
                                <select name = "myTIPDOCUMENTO" id ="myTIPDOCUMENTO" size="1" obligatorio="true" title="<axis:alt f="axisper030" c="myTIPDOCUMENTO" lit="105330"/>" onchange="f_cambiar(this);" 
                                alt="<axis:alt f='axisper030' c='myTIPDOCUMENTO' lit='105330' />"  class="campowidthselect campo campotexto_ob" style="width:50%;"&nbsp;
                                        <option value="null"> - <axis:alt f="axisper030" c="SNV_COMBO" lit="108341"/> - </option> 
                                    <c:forEach var="documents" items="${requestScope.documents}" varStatus="cont">
                                        <option value = "${documents.CATRIBU}"
                                          <c:if test="${__formdata.myTIPDOCUMENTO == documents.CATRIBU}">selected</c:if>
                                            >
                                            ${documents.TATRIBU}
                                      </option>
                                    </c:forEach>
                                </select>
                                <div class="separador">&nbsp;</div>
                            </td>
                             </axis:ocultar>
                             <axis:ocultar c="myEDODOCUMENTO" f="axisper030" dejarHueco="false" >
                            <td class="campocaja">                             
                                <select name = "myEDODOCUMENTO" id ="myEDODOCUMENTO" size="1" obligatorio="true" title="<axis:alt f="axisper030" c="myEDODOCUMENTO" lit="100587"/>"  alt="<axis:alt f='axisper030' c='myEDODOCUMENTO' lit='100587'/>" 
                                    class="campowidthselect campo campotexto_ob" style="width:50%;">&nbsp;
                                        <option value="null"> - <axis:alt f="axisper030" c="SNV_COMBO" lit="108341"/> - </option> 
                                    <c:forEach var="estados" items="${requestScope.estados}"  varStatus="cont">
                                        <option value = "${estados.CATRIBU}"
                                          <c:if test="${__formdata.myEDODOCUMENTO == estados.CATRIBU}">selected</c:if>
                                            >
                                            ${estados.TATRIBU}
                                      </option>
                                    </c:forEach>
                                </select>
                                <div class="separador">&nbsp;</div>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar c="FEDO" f="axisper030" dejarHueco="false" >
                            <td class="campocaja" >
                                    <input  type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEDO}"/>" name="FEDO" id="FEDO"  style="width:50%;"
                                    title= "<axis:alt f="axisper030" c="FEDO" lit="9900983"/>"  <axis:atr f="axisper030" c="FEDO" a="modificable=true&obligatorio=false&formato=fecha"/>  />
                                    <a style="vertical-align:middle;"><img id="popup_calendario_FEDO" alt="<axis:alt f="axisper030" c="FEDO" lit="9900983"/>"  src="images/calendar.gif" </a>
                            </td>
                            </axis:ocultar>
                       </tr>    
                    </table>
                </td>
            </tr>
        </table>
         </form> 
         </c:otherwise>
         
         </c:choose>
         
         
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper030</c:param><c:param name="f">axisper030</c:param><c:param name="__botones">salir,aceptar</c:param></c:import>
        
   
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FCADUCIDAD",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FCADUCIDAD", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
        
        
           
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FEDO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FEDO", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
        
    <c:import url="../include/mensajes.jsp" />
</body>
</html>