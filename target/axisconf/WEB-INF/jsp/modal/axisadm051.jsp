<%/*
*  Fichero: axisadm051.jsp
*
*  
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisadm051" c="TITTULO" lit="9901134" /></title> <%-- Buscador de contabilidad diaria --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
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
   
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {   
            f_cargar_propiedades_pantalla();             
            document.miForm.traspaso_check.value=0;                
        }
        
        function thiss(thiss){
        thiss.value = f_formatdate(thiss);
        }
        
        function f_formatdate(entrada){
         var jDate = new JsFecha();

            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    entrada.value = '';//alert('Formato fecha incorrecto para el campo '+ title);
                }
        }
         return entrada.value;
        }
        
      function f_but_cancelar() {
            parent.f_cerrar_modal('axisadm051');
        }
       
      function f_but_buscar() {
            if (objValidador.validaEntrada()) {
                var traspaso_check = objDom.getValorPorId("traspaso_check");
                var CEMPRES = objDom.getValorPorId("CEMPRES");
                var FCONTABINI = objDom.getValorPorId("FCONTABINI");      
                var FCONTABFIN = objDom.getValorPorId("FCONTABFIN");   
                var FTRASPASINI = objDom.getValorPorId("FTRASPASINI");      
                var FTRASPASFIN = objDom.getValorPorId("FTRASPASFIN");
                var FADMININI = objDom.getValorPorId("FADMININI");
                var FADMINFIN = objDom.getValorPorId("FADMINFIN");
                parent.f_aceptar_axisamd051(traspaso_check,CEMPRES,FCONTABINI,FCONTABFIN,FTRASPASINI,FTRASPASFIN,FADMININI,FADMINFIN);
             }
             
        }    
      function actualizarSeguro(SSEGURO){
            objDom.setValorPorId("SSEGURO", SSEGURO);
        }
        
        
      function f_actualizar_valor(){
        if(document.miForm.CHECKTRASPAS.checked){
           document.miForm.traspaso_check.value=1;  
        }else{
          document.miForm.traspaso_check.value=0;                
            }
      }
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm051" c="TITTULO" lit="9901134" /></c:param>     <%-- Buscador de contabilidad diaria--%>
                <c:param name="formulario"><axis:alt f="axisadm051" c="TITTULO" lit="9901134" /></c:param> <%-- Buscador de contabilidad diaria--%>
                <c:param name="form">axisadm051</c:param>
        </c:import>
            
        <input type="hidden" name="operation" value=""/>        
        <input type="hidden" name="traspaso_check" id="traspaso_check" value="${__formdata.traspaso_check}"/> <!--0:no traspasado --><!--1:traspasado --> 
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisadm051" c="CEMPRES" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_CEMPRES"><axis:alt f="axisadm051" c="LIT_EMPRESA" lit="101619" /></b> <%-- Empresa --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm051" c="CHECKTRASPAS" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_CHECKTRASPAS"><axis:alt f="axisadm051" c="LIT_CHECKTRASPAS" lit="9901128"/></b>   <%-- Check traspasados --%>
                                            </td>            
                                        </axis:ocultar>                                    
                                    </tr>
                                    <tr>
                                        <%-- Empresa --%>
                                        <axis:ocultar f="axisadm051" c="CEMPRES" dejarHueco="false">
                                            <td class="campocaja">
                                            <select name="CEMPRES" id="CEMPRES" size="1" class="campowidthselect campo campotexto"  <axis:atr f="axisdm051" c="CEMPRES" a="modificable=true&obligatorio=false"/>
                                             >>&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm051" c="LIT_CHECK" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                                    <option value = "${element.CEMPRES}"
                                                    <c:if test="${__formdata.CEMPRES == element.CEMPRES || fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1}"> selected = "selected"</c:if>>
                                                        ${element.TEMPRES} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            </td>
                                        </axis:ocultar>
                                        <%-- Check traspasados --%>
                                        <axis:ocultar f="axisadm051" c="CHECKTRASPAS" dejarHueco="false">
                                            <td class="campocaja" >            
                                             <input type="checkbox" onclick="javascript:f_actualizar_valor()" name="CHECKTRASPAS" id="CHECKTRASPAS" <c:if test="${requestScope.CHECKTRASPAS == '1'}">checked</c:if>
                                                <axis:atr f="axisdm051" c="CHECKTRASPAS" a="modificable=true&obligatorio=false"/> alt="<axis:alt f="axisadm051" c="CHECKTRASPAS" lit="9901128"/>" title="<axis:alt f="axisadm051" c="CHECKTRASPAS" lit="9901128"/>"/>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                
                                    <tr>
                                        <axis:ocultar f="axisadm051" c="FCONTABINI" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FCONTABINI"><axis:alt f="axisadm051" c="FCONTABINI" lit="9901129"/></b> <%-- Data inicial contable --%>
                                            </td>            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm051" c="FCONTABFIN" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FCONTABFIN"><axis:alt f="axisadm051" c="FCONTABFIN" lit="9901130"/></b> <%-- Data fin contable --%>
                                            </td>            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm051" c="FTRASPASINI" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FTRASPASINI"><axis:alt f="axisadm051" c="FTRASPASINI" lit="9901131"/></b> <%-- Data inicial traspaso --%>
                                            </td>            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm051" c="FTRASPASFIN" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FTRASPASFIN"><axis:alt f="axisadm051" c="FTRASPASFIN" lit="9901132"/></b> <%-- Data final traspaso --%>
                                            </td>            
                                        </axis:ocultar>
                                    </tr>
                                    <tr>                                 
                                     
                                        <axis:ocultar f="axisadm051" c="FCONTABINI" dejarHueco="false">
                                          <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FCONTABINI" name="FCONTABINI" size="15" onchange="thiss(this);"
                                                <axis:atr f="axisdm051" c="FCONTABINI" a="formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTABINI}"/>" style="width:35%"
                                                title="<axis:alt f="axisadm051" c="FCONTABINI_TIT" lit="9000716"/>"/><a style="vertical-align:middle;"><img
                                                id="icon_FCONTABINI" alt="<axis:alt f="axisadm051" c="ICON_FCONTABINI" lit="108341"/>" title="<axis:alt f="axisadm051" c="ICON_FCONTABINI" lit="108341"/>" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm051" c="FCONTABFIN" dejarHueco="false">
                                             <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FCONTABFIN" name="FCONTABFIN" size="15" onchange="thiss(this);"
                                                <axis:atr f="axisdm051" c="FCONTABFIN" a="formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTABFIN}"/>" style="width:35%"
                                                title="<axis:alt f="axisadm051" c="FCONTABFIN_TIT" lit="9000716"/>"/><a style="vertical-align:middle;"><img
                                                id="icon_FCONTABFIN" alt="<axis:alt f="axisadm051" c="ICON_FCONTABFIN" lit="108341"/>" title="<axis:alt f="axisadm051" c="ICON_FCONTABFIN" lit="108341"/>" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm051" c="FTRASPASINI" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FTRASPASINI" name="FTRASPASINI" size="15" onchange="thiss(this);"
                                                <axis:atr f="axisdm051" c="FTRASPASINI" a="formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FTRASPASINI}"/>" style="width:35%"
                                                title="<axis:alt f="axisadm051" c="FTRASPASINI_TIT" lit="9000716"/>"/><a style="vertical-align:middle;"><img
                                                id="icon_FTRASPASINI" alt="<axis:alt f="axisadm051" c="ICON_FTRASPASINI" lit="108341"/>" title="<axis:alt f="axisadm051" c="ICON_FTRASPASINI" lit="108341"/>" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>
                                         <axis:ocultar f="axisadm051" c="FTRASPASFIN" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FTRASPASFIN" name="FTRASPASFIN" size="15" onchange="thiss(this);"
                                                <axis:atr f="axisdm051" c="FTRASPASFIN" a="formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FTRASPASFIN}"/>" style="width:35%"
                                                title="<axis:alt f="axisadm051" c="FTRASPASFIN_TIT" lit="9000716"/>"/><a style="vertical-align:middle;"><img
                                                id="icon_FTRASPASFIN" alt="<axis:alt f="axisadm051" c="ICON_FTRASPASFIN" lit="108341"/>" title="<axis:alt f="axisadm051" c="ICON_FTRASPASFIN" lit="108341"/>" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                     <tr>
                                        <axis:ocultar f="axisadm051" c="FADMININI" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FADMININI"><axis:alt f="axisadm051" c="FADMININI" lit="9904221"/></b> <%-- Data inicial contabilidad diaria --%>
                                            </td>            
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm051" c="FADMINFIN" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FADMINFIN"><axis:alt f="axisadm051" c="FADMINFIN" lit="9904222"/></b> <%-- Data fin contabilidad diaria --%>
                                            </td>            
                                        </axis:ocultar>                                        
                                    </tr>
                                    <tr>                                 
                                     
                                        <axis:ocultar f="axisadm051" c="FADMININI" dejarHueco="false">
                                          <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FADMININI" name="FADMININI" size="15" onchange="thiss(this);"
                                                <axis:atr f="axisdm051" c="FADMININI" a="formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FADMININI}"/>" style="width:35%"
                                                title="<axis:alt f="axisadm051" c="FADMININI_TIT" lit="9000716"/>"/><a style="vertical-align:middle;"><img
                                                id="icon_FADMININI" alt="<axis:alt f="axisadm051" c="ICON_FADMININI" lit="108341"/>" title="<axis:alt f="axisadm051" c="ICON_FADMININI" lit="108341"/>" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm051" c="FADMINFIN" dejarHueco="false">
                                             <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FADMINFIN" name="FADMINFIN" size="15" onchange="thiss(this);"
                                                <axis:atr f="axisdm051" c="FADMINFIN" a="formato=fecha"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FADMINFIN}"/>" style="width:35%"
                                                title="<axis:alt f="axisadm051" c="FADMINFIN_TIT" lit="9000716"/>"/><a style="vertical-align:middle;"><img
                                                id="icon_FADMINFIN" alt="<axis:alt f="axisadm051" c="ICON_FADMINFIN" lit="108341"/>" title="<axis:alt f="axisadm051" c="ICON_FADMINFIN" lit="108341"/>" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>                                        
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
                
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisadm051</c:param>  
            <c:param name="__botones">cancelar,buscar<c:if test="${!empty requestScope.LST_CUAFACUL}">,aceptar</c:if></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    
    <script type="text/javascript">
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
            Calendar.setup({
            inputField     :    "FTRASPASINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FTRASPASINI", 
            singleClick    :    true,
            firstDay       :    1
        });
            Calendar.setup({
            inputField     :    "FTRASPASFIN",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FTRASPASFIN", 
            singleClick    :    true,
            firstDay       :    1
        });
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
    </script>

</body>
</html>