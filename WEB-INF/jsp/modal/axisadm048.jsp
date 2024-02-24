<%/**
    *  Fichero: axisadm048.jsp
    *  @author <a href = "mailto:jdelrio@csi-ti.com">Javier del Rio</a>
    *  
    *    Comentarios
    *
    *
    *  Fecha: 22/02/10
    */
    %>
<%@ page contentType="text/html;charset=iso-8859-15"%>
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
    
    <title><axis:alt f="axisadm048" c="TITULO" lit="102089"/></title> <%-- LITERAL --%>
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
            revisarEstilos();
            f_cargar_propiedades_pantalla();
            document.miForm.SPROCES.focus();
        }
                
        function f_but_cancelar() {
            parent.f_cerrar_axisadm048();
        }        
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()){
                var params = '';
                if (!objUtiles.estaVacio(objDom.getValorPorId("SPROCES"))){
                    params += "&SPROCES="+objDom.getValorPorId("SPROCES");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("FPROINI"))){
                    params += "&FPROINI="+objDom.getValorPorId("FPROINI");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("NERROR"))){
                    params += "&NERROR="+objDom.getValorPorId("NERROR");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("EMPRESA"))){
                    params += "&EMPRESA="+objDom.getValorPorId("EMPRESA");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("CUSUARI"))){
                    params += "&CUSUARI="+objDom.getValorPorId("CUSUARI");
                }
                if (!objUtiles.estaVacio(objDom.getValorPorId("CPROCES"))){
                    params += "&CPROCES="+objDom.getValorPorId("CPROCES");
                }
                parent.f_aceptar_axisadm048(params);
            }
        }

    </script>    
</head> 
        
         <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
                 
<form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm048" c="TITULOMODAL" lit="9901036"/></c:param>     <%-- Buscador de Procesos --%>
                <c:param name="formulario"><axis:alt f="axisadm048" c="SUBTITULOMODAL" lit="9901036"/></c:param> <%-- Buscador de Procesos --%>
                <c:param name="form">axisadm048</c:param>
        </c:import>
        
        <input type="hidden" name="operation" value=""/>
       
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0"> 
        <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                    </div>

                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <table class="area" align="center">
                                    <tr>                                      
                                        <th style="width:23.3%;height:0%;"/>
                                        <th style="width:23.3%;height:0%;"/>
                                        <th style="width:23.3%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                    </tr>
                                    

         <tr>
                                        <!-- Empresa -->                                      
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm048" c="EMPRESA" lit="101619"/></b>
                                        </td>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisadm048" c="PROCESO" lit="1000576"/></b>  <%-- Proceso --%>
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <select name="EMPRESA" obligatorio="true" id ="EMPRESA" size="1" class="campowidthselect campo campotexto_ob" style="width:250px">
                                                <option value="null"> - <axis:alt f="axisadm048" c="COMBONULL" lit="1000348"/> - </option>
                                                <c:forEach var="EMPRESA" items="${EMPRESAS}">
                                                    <option value="${EMPRESA.CEMPRES}"
                                                    <c:if test="${__formdata.EMPRESA != null && EMPRESA.CEMPRES == __formdata.EMPRESA}"> selected </c:if>>
                                                    ${EMPRESA.TEMPRES}</option>
                                                </c:forEach>
                                            </select>
                                        </td> 
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.SPROCES}" name="SPROCES" id="SPROCES" 
                                            style="width:67%;" title="<axis:alt f="axisadm048" c="PROCESO" lit="1000576"/>"
                                            <axis:atr f="axisctr033" c="SPROCES" a="formato=entero"/> />
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>    
                                    </tr>                     
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm048" c="FINICIO" lit="9000526"/></b> <%-- F. Inicio --%>
                                        </td>
                                        <td class="titulocaja">                                            
                                            <b><axis:alt f="axisadm048" c="CPROCES" lit="1000109"/></b> <%-- Codi proces --%>                                          
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm048" c="ERROR" lit="9000464"/></b> <%-- Error --%>
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="<fmt:formatDate value='${__formdata.FPROINI}' pattern='dd/MM/yyyy'/>" name="FPROINI" id="FPROINI"
                                            style="width:60%;" <axis:atr f="axisadm048" c="FPROINI" a="formato=fecha"/>
                                            title="<axis:alt f="axisadm048" c="FPROINI" lit="9000526"/>"/><a id="icon_FPROINI" style="vertical-align:middle;"><img 
                                            alt="<axis:alt f="axisadm048" c="FPROINI" lit="108341"/>" title="<axis:alt f="axisadm048" c="FPROINI" lit="9000526" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="20" 
                                            value="${__formdata.CPROCES}" name="CPROCES" id="CPROCES" maxlength="20"
                                            style="width:67%;" title="<axis:alt f="axisadm048" c="CPORCES" lit="1000109"/>"
                                             />
                                        </td>
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.NERROR}" name="NERROR" id="NERROR" 
                                            style="width:67%;" title="<axis:alt f="axisadm048" c="CPROCES" lit="9000464"/>"
                                            <axis:atr f="axisadm048" c="NERROR" a="formato=entero"/> />
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisadm048" c="USUARI" lit="100894"/></b> <%-- USUARI --%>
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                       <td class="titulocaja">
                                            &nbsp;
                                        </td>                 
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>                              
                                        <td class="campocaja" colspan="2">                                
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.CUSUARI}" name="CUSUARI" id="CUSUARI" 
                                            style="width:67%;" title="<axis:alt f="axisadm048" c="USUARI" lit="100894"/>"
                                            <axis:atr f="axisadm048" c="CUSUARI" /> />
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>     
                                        <td class="titulocaja">
                                            &nbsp;
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
              <c:param name="f">axisadm048</c:param>
              <c:param name="__botones">cancelar,buscar</c:param>
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FPROINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FPROINI", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>

</body>
</html>