<%/*
*  Fichero: axisprf015.jsp
*
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
            parent.f_cerrar_modal('axisprf015');                      
        }
        
        function f_onload() {
             f_cargar_propiedades_pantalla();
             
            var isUpload = "${isUpload}";
            try{
                if (!objUtiles.estaVacio(isUpload) && objUtiles.utilEquals(isUpload, 'ok'))  {     
                    parent.f_aceptar_modal("axisprf015");
                }
            }catch(e){}
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

    
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
            document.miForm.submit();
            
        }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) { 
            
                if( objUtiles.estaVacio(objDom.getValorPorId("IDDOCGEDOX"))) 
                    f_enviar_datos();
                else
                    objUtiles.ejecutarFormulario("modal_axisprf015.do", "actualizardoc", document.miForm030, "_self", objJsMessages.jslit_cargando);      
                   
            }
        }
            
    </script>
  </head>
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
       
       <c:choose>
       
       <c:when test="${empty __formdata.IDDOCGEDOX}">
    <form name="miForm" enctype='multipart/form-data' action="Axisprf015Servlet" method="POST" accept-charset='UTF-8'>         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisprf015" c="TITULO" lit="1000431"/></c:param>
            <c:param name="formulario"><axis:alt f="axisprf015" c="TITFORM" lit="1000614"/></c:param>
            <c:param name="form">axisprf015</c:param>
        </c:import>
        <input type="hidden" id="TDESC" name="TDESC" value=""/>
        <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
        <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
        <input type="hidden" id="SPROFES" name="SPROFES" value="${__formdata.SPROFES}"/>
        <input type="hidden" id="IDDOCGEDOX" name="IDDOCGEDOX" value="${__formdata.IDDOCGEDOX}"/>
        <input type="hidden" id="NDOCUME" name="NDOCUME" value="${__formdata.NDOCUME}"/>
        <input type="hidden" id="NTRAMIT" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
        <input type="hidden" id="ORIGEN" name="ORIGEN" value="${__formdata.ORIGEN}"/>
        <input type="hidden" id="IDCAT" name="IDCAT" value=""/>
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
                                <b><axis:alt f="axisprf015" c="FITXER" lit="1000574"/></b> <%-- FITXER --%>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <c:if test="${empty __formdata.IDDOCGEDOX}">
                            <td class="campocaja" colspan="3">   
                                <input type="file" size="70" class="campowidthinput campo campotexto"  name="TFILE" id="TFILE" title="<axis:alt f="axisprf015" c="TFILE" lit="1000574"/>" obligatorio="true"/>                                
                                <div class="separador">&nbsp;</div>                                                        
                            </td>
                            </c:if>
                            
                   
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        
                            <axis:ocultar c="TDESC" f="axisprf015" dejarHueco="false">
                            <td class="titulocaja">
                                <b id="label_TDESC"><axis:alt f="axisprf015" c="myTDESC" lit="100588"/></b>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                             <axis:ocultar c="TDESC" f="axisprf015" dejarHueco="false">
                            <td class="campocaja" colspan="3" >                             
                                <input type="text" name="myTDESC" id="myTDESC" class="campowidthinput campo campotexto" 
                                title="<axis:alt f="axisprf015" c="myTDESC" lit="100588"/>"  value="${__formdata.myTDESC}"
                                <c:if test="${!empty __formdata.IDDOCGEDOX}"><axis:atr f="axisprf015" c="myTDESC" a="modificable=false&obligatorio=true"/></c:if>/>                                
                                <div class="separador">&nbsp;</div>                               
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisprf015" c="myIDCAT" lit="1000612"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="campocaja"  colspan="3">                             
                                <select name = "myIDCAT" id ="myIDCAT" size="1" obligatorio="true" title="<axis:alt f="axisprf015" c="myIDCAT" lit="1000612"/>" 
                                    class="campowidthselect campo campotexto_ob" style="width:50%;"
                                    <c:if test="${!empty __formdata.IDDOCGEDOX}">disabled="disabled"</c:if>>&nbsp;
                                        <option value="null"> - <axis:alt f="axisprf015" c="SNV_COMBO" lit="108341"/> - </option> 
                                    <c:forEach items="${__formdata.LSTCATEGOR}" var="LSTCATEGOR">
                                        <option value = "${LSTCATEGOR.CDOCUME}" <c:if test="${LSTCATEGOR.CDOCUME  == __formdata.myIDCAT}">selected</c:if>>${LSTCATEGOR.TTITDOC}</option>
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
                                <b><axis:alt f="axisprf015" c="TOBSERVACIONES" lit="101162"/></b>
                            </td>    
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td colspan="3" style="width:100%;"  class="campocaja"> 
                                 <axis:ocultar c="OBSERVACIONES" f="axisprf015" dejarHueco="false">
                                     <textarea rows="" cols="" class="campowidthinput campo campotexto" style="width:100%;"  name="OBSERVACIONES" id="OBSERVACIONES">${__formdata.OBSERVACIONES}</textarea>
                                 </axis:ocultar>
                            </td>
                        </tr>
                       <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisprf015" c="FCADUCIDAD" lit="9001356"/></b>
                            </td> 
                            <td class="titulocaja">
                                <b><axis:alt f="axisprf015" c="FALTA" lit="105887"/></b>
                            </td> 
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:ocultar c="FCADUCIDAD" f="axisprf015" dejarHueco="false" >
                                 <td class="campocaja" >
                                    <input  type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCADUCIDAD}"/>" name="FCADUCIDAD" id="FCADUCIDAD"  style="width:50%;"
                                    title= "<axis:alt f="axisprf015" c="FCADUCIDAD" lit="9001356"/>"  <axis:atr f="axisprf015" c="FCADUCIDAD" a="modificable=true&obligatorio=false&formato=fecha"/>  />
                                    <a style="vertical-align:middle;"><img id="popup_calendario_FCADUCIDAD" alt="<axis:alt f="axisprf015" c="FCADUCIDAD" lit="9001356"/>"  src="images/calendar.gif" </a>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar c="FALTA" f="axisprf015" dejarHueco="false" >
                                 <td class="campocaja" >
                                    <input  type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FALTA}"/>" name="FALTA" id="FALTA"  style="width:50%;"
                                    title= "<axis:alt f="axisprf015" c="FALTA" lit="105887"/>"  
                                    <axis:atr f="axisprf015" c="FALTA" a="modificable=false&obligatorio=false&formato=fecha"/> />
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
            <c:param name="formulario"><axis:alt f="axisprf015" c="TITFORM" lit="1000614"/></c:param>
            <c:param name="form">axisprf015</c:param>
        </c:import>
        
        <input type="hidden" id="SPERSON" name="SPERSON" value="${param.SPERSON}"/>
        <input type="hidden" id="CAGENTE" name="CAGENTE" value="${param.CAGENTE}"/>
        <input type="hidden" id="SPROFES" name="SPROFES" value="${param.SPROFES}"/>
        <input type="hidden" id="IDDOCGEDOX" name="IDDOCGEDOX" value="${__formdata.IDDOCGEDOX}"/>
        <input type="hidden" id="NDOCUME" name="NDOCUME" value="${__formdata.NDOCUME}"/>
        <input type="hidden" id="ORIGEN" name="ORIGEN" value="${__formdata.ORIGEN}"/>
        <input type="hidden" id="IDCAT" name="IDCAT" value="${__formdata.myIDCAT}"/>
               
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
                                <b><axis:alt f="axisprf015" c="FITXER" lit="1000574"/></b> <%-- FITXER --%>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            
                            <c:if test="${!empty __formdata.IDDOCGEDOX}">
                            <td class="campocaja" colspan="3">   
                                <input type="text" size="70" class="campowidthinput campo campotexto"  name="TFILE" id="TFILE" value="${__formdata.TFILE}" 
                                        title="<axis:alt f="axisprf015" c="TFILE" lit="1000574"/>"
                                        <axis:atr f="axisprf015" c="TFILE" a="modificable=false&obligatorio=true"/>/>                                
                                <div class="separador">&nbsp;</div>                                                        
                            </td>
                            </c:if>
                   
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                              <axis:ocultar c="TDESC" f="axisprf015" dejarHueco="false">
                            <td class="titulocaja">
                                <b  id="label_TDESC"><axis:alt f="axisprf015" c="myTDESC" lit="100588"/></b>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                              <axis:ocultar c="TDESC" f="axisprf015" dejarHueco="false">
                            <td class="campocaja" colspan="3" >                             
                                <input type="text" name="myTDESC" id="myTDESC" class="campowidthinput campo campotexto" 
                                title="<axis:alt f="axisprf015" c="myTDESC" lit="100588"/>" value="${__formdata.myTDESC}"
                                <c:if test="${!empty __formdata.IDDOCGEDOX}"><axis:atr f="axisprf015" c="myTDESC" a="modificable=false&obligatorio=true"/></c:if>/>                                
                                <div class="separador">&nbsp;</div>                               
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisprf015" c="myIDCAT" lit="1000612"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="campocaja"  colspan="3">      
                                <select name = "myIDCAT" id ="myIDCAT" size="1" obligatorio="true" title="<axis:alt f="axisprf015" c="myIDCAT" lit="1000612"/>" 
                                    class="campowidthselect campo campotexto_ob" style="width:50%;"
                                    <c:if test="${!empty __formdata.IDDOCGEDOX}">disabled="disabled"</c:if>>&nbsp;
                                        <option value="null"> - <axis:alt f="axisprf015" c="SNV_COMBO" lit="108341"/> - </option> 
                                    <c:forEach items="${__formdata.LSTCATEGOR}" var="LSTCATEGOR">
                                        <option value = "${LSTCATEGOR.CDOCUME}" <c:if test="${LSTCATEGOR.CDOCUME  == __formdata.myIDCAT}">selected</c:if>>${LSTCATEGOR.TTITDOC}</option>
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
                                <b><axis:alt f="axisprf015" c="TOBSERVACIONES" lit="101162"/></b>
                            </td>    
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td colspan="3" style="width:100%;"  class="campocaja"> <!-- colspan="5" -->
                                 <axis:ocultar c="OBSERVACIONES" f="axisprf015" dejarHueco="false">
                                     <textarea rows="" cols="" class="campowidthinput campo campotexto" style="width:100%;"  name="OBSERVACIONES" id="OBSERVACIONES">${__formdata.OBSERVACIONES}</textarea>
                                 </axis:ocultar>
                            </td>
                        </tr>
                       <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisprf015" c="FCADUCIDAD" lit="9001356"/></b>
                            </td> 
                            <td class="titulocaja">
                                <b><axis:alt f="axisprf015" c="FALTA" lit="105887"/></b>
                            </td> 
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:ocultar c="FCADUCIDAD" f="axisprf015" dejarHueco="false" >
                                 <td class="campocaja" >
                                    <input  type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCADUCIDAD}"/>" name="FCADUCIDAD" id="FCADUCIDAD"  style="width:50%;"
                                    title= "<axis:alt f="axisprf015" c="FCADUCIDAD" lit="9001356"/>"  <axis:atr f="axisprf015" c="FCADUCIDAD" a="modificable=true&obligatorio=false&formato=fecha"/>  />
                                    <a style="vertical-align:middle;"><img id="popup_calendario_FCADUCIDAD" alt="<axis:alt f="axisprf015" c="FCADUCIDAD" lit="9001356"/>"  src="images/calendar.gif" </a>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar c="FALTA" f="axisprf015" dejarHueco="false" >
                                 <td class="campocaja" >
                                    <input  type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FALTA}"/>" name="FALTA" id="FALTA"  style="width:50%;"
                                    title= "<axis:alt f="axisprf015" c="FALTA" lit="105887"/>"  
                                    <axis:atr f="axisprf015" c="FALTA" a="modificable=false&obligatorio=false&formato=fecha"/> />
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
         
         
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf015</c:param><c:param name="f">axisprf015</c:param><c:param name="__botones">salir,aceptar</c:param></c:import>
        
   
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FCADUCIDAD",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FCADUCIDAD", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
        
    <c:import url="../include/mensajes.jsp" />
</body>
</html>