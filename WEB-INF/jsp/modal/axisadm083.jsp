<%/**
    *  Fichero: axisadm083.jsp
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
    
    <title><axis:alt f="axisadm083" c="TITULO" lit="102089"/></title> <%-- LITERAL --%>
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
            //document.miForm.SPROCES.focus();
            
            var OK_acceptar = "${requestScope.OK_acceptar}"; 
            
            //alert(OK_acceptar);
            
            if (!objUtiles.estaVacio(OK_acceptar)==1){     
                //alert("<axis:alt f='axisadm083' c='OK_ACCEPTAR' lit='111313'/>");
                parent.f_cerrar_axisadm083();
            }
            
          
        }
                
        function f_but_cancelar() {
            parent.f_cerrar_axisadm083();
        }        
        
        function f_but_aceptar() {
            if (objValidador.validaEntrada()){
                objUtiles.ejecutarFormulario ("modal_axisadm083.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                
            
                
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
                <c:param name="titulo"><axis:alt f="axisadm083" c="TITULOMODAL" lit="9001219"/></c:param>     <%-- Buscador de Procesos --%>
                <c:param name="formulario"><axis:alt f="axisadm083" c="SUBTITULOMODAL" lit="9001219"/></c:param> <%-- Buscador de Procesos --%>
                <c:param name="form">axisadm083</c:param>
        </c:import>
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SINTERF" value="${__formdata.SINTERF}"/>
        <input type="hidden" name="TTIPPAG" value="${__formdata.TTIPPAG}"/>
        <input type="hidden" name="IDPAGO" value="${__formdata.IDPAGO}"/>
        <input type="hidden" name="FCONTA" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTA}"/>"/>
        <input type="hidden" name="NLINEA" value="${__formdata.NLINEA}"/>
        <input type="hidden" name="NASIENT" value="${__formdata.NASIENT}"/>
        <input type="hidden" name="CPAIS" value="${__formdata.CPAIS}"/>
        <input type="hidden" name="CPROCES" value="${__formdata.CPROCES}"/>
        <input type="hidden" name="OTROS" value="${__formdata.OTROS}"/>
        
        <input type="hidden" name="FTRASPASO" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FTRASPASO}"/>"/>
        <input type="hidden" name="CLAVEASI" value="${__formdata.CLAVEASI}"/>
        <input type="hidden" name="TIPODIARIO" value="${__formdata.TIPODIARIO}"/>
        <input type="hidden" name="FASIENTO" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FASIENTO}"/>"/>
       
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
                                        <th style="width:12%;height:0%;"/>
                                        <th style="width:12%;height:0%;"/>
                                        <th style="width:24%;height:0%;"/>
                                        <th style="width:24%;height:0%;"/>
                                        <th style="width:15%;height:0%;"/>
                                    </tr>
                                    

         <tr>
         <axis:ocultar f="axisadm083" c="TASIENT" dejarHueco="false">
                                         <td class="titulocaja" colspan="3">
                                            <b><axis:alt f="axisadm083" c="TASIENT" lit="105417"/></b>
                                        </td>
                                        </axis:ocultar>
                                        
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>           
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>               
                                    <axis:ocultar f="axisadm083" c="TASIENT" dejarHueco="false">
                                        <td class="campocaja" colspan="3">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.TASIENT}" name="TASIENT" id="TASIENT" 
                                            <axis:atr f="axisadm083" c="TASIENT" a="modificable=false&obligatorio=false"/>
                                            title="<axis:alt f="axisadm083" c="TASIENT" lit="105417"/>"
                                            />
                                        </td>
                                        </axis:ocultar>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>    
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>    
                                    </tr>                     
                                    <tr>
                                    <axis:ocultar f="axisadm083" c="CCUENTA" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisadm083" c="CCUENTA" lit="9000533"/></b> <%-- CUENTA --%>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm083" c="CCOLETILLA" dejarHueco="false">
                                        <td class="titulocaja">                                            
                                            <b><axis:alt f="axisadm083" c="CCOLETILLA" lit="9905496"/></b> <%-- COLETILLA --%>                                          
                                        </td>
                                        </axis:ocultar>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>            
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                    <axis:ocultar f="axisadm083" c="CCUENTA" dejarHueco="false">
                                         <td class="campocaja" colspan="2">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.CCUENTA}" name="CCUENTA" id="CCUENTA" 
                                            title="<axis:alt f="axisadm083" c="CCUENTA" lit="9000533"/>"
                                            />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm083" c="CCOLETILLA" dejarHueco="false">
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="20" 
                                            value="${__formdata.CCOLETILLA}" name="CCOLETILLA" id="CCOLETILLA" maxlength="20"
                                            title="<axis:alt f="axisadm083" c="CCOLETILLA" lit="9905496"/>"
                                             />
                                        </td>
                                        </axis:ocultar>
                                       <td class="titulocaja">
                                            &nbsp;
                                        </td>             
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                    <axis:ocultar f="axisadm083" c="TAPUNTE" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisadm083" c="TAPUNTE" lit="9001328"/></b> <%-- TAPUNTE --%>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm083" c="IAPUNTE" dejarHueco="false">
                                        <td class="titulocaja">                                            
                                            <b><axis:alt f="axisadm083" c="IAPUNTE" lit="9904351"/></b> <%-- IAPUNTE --%>                                          
                                        </td>                                  
                                        </axis:ocultar>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>         
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>    
                                    </tr>
                                    <tr>
                                    <axis:ocultar f="axisadm083" c="TAPUNTE" dejarHueco="false">
                                         <td class="campocaja">                 
                                        <input  value="D" type="RADIO" id="TAPUNTE" name="TAPUNTE" <c:if test="${__formdata.TAPUNTE == 'D'}"> checked </c:if> onclick="f_actualitzarCheck(this.value);"/>
                                        <b><axis:alt f="axisadm083" c="TAPUNTE_DEBE" lit="101003"/></b>  
                                                                                                                            
                                        </td>
                                        <td class="campocaja">                             
                                        <input  value="H" type="RADIO" id="TAPUNTE" name="TAPUNTE" <c:if test="${__formdata.TAPUNTE == 'H'}"> checked </c:if> onclick="f_actualitzarCheck(this.value);"/>
                                        <b><axis:alt f="axisadm083" c="TAPUNTE_HABER" lit="101004"/></b>  
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm083" c="IAPUNTE" dejarHueco="false">
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="20" 
                                            value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IAPUNTE}"/>" name="IAPUNTE" id="IAPUNTE" maxlength="20"
                                            title="<axis:alt f="axisadm083" c="IAPUNTE" lit="100563"/>"
                                            <axis:atr f="axisadm083" c="IAPUNTE" a="formato=decimal"/>  />
                                        </td>
                                        </axis:ocultar>
         
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>     
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>    
                                    </tr>  
                                     <tr>
                                     <axis:ocultar f="axisadm083" c="TDESCRI" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisadm083" c="TDESCRI" lit="100588"/></b> <%-- TDESCRI --%>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm083" c="FEFEADM" dejarHueco="false">
                                        <td class="titulocaja">                                            
                                            <b><axis:alt f="axisadm083" c="FEFEADM" lit="1000596"/></b> <%-- FEFEADM --%>                                          
                                        </td>
                                        </axis:ocultar>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>            
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                    <axis:ocultar f="axisadm083" c="TDESCRI" dejarHueco="false">
                                         <td class="campocaja" colspan="2">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.TDESCRI}" name="TDESCRI" id="TDESCRI" 
                                            title="<axis:alt f="axisadm083" c="TDESCRI" lit="100588"/>"
                                            />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm083" c="FEFEADM" dejarHueco="false">
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="20" 
                                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFEADM}"/>" name="FEFEADM" id="FEFEADM" maxlength="20" style="width:67%;"
                                            title="<axis:alt f="axisadm083" c="FEFEADM" lit="1000596"/>"
                                            <axis:atr f="axisadm083" c="FEFEADM" a="formato=fecha"/> /> <a style="vertical-align:middle;"><img                                            
                                            id="icon_FEFEADM" border=0 alt="<axis:alt f="axisadm083" c="FEFEADM" lit="1000596"/>" title="<axis:alt f="axisadm083" c="FEFEADM" lit="1000596"/>" src="images/calendar.gif"/></a>
                                        </td>
                                        </axis:ocultar>
                                       <td class="titulocaja">
                                            &nbsp;
                                        </td>             
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>       
                                    
                                     <tr>
                                     <axis:ocultar f="axisadm083" c="CENLACE" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisadm083" c="CENLACE" lit="9903796"/></b> <%-- CENLACE --%>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm083" c="CPROCES" dejarHueco="false">
                                        <td class="titulocaja">                                            
                                            <b><axis:alt f="axisadm083" c="CPROCES" lit="1000576"/></b> <%-- CPROCES --%>                                          
                                        </td>
                                        </axis:ocultar>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>            
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>                                        
                                    </tr>
                                    <tr>
                                    <axis:ocultar f="axisadm083" c="CENLACE" dejarHueco="false">
                                         <td class="campocaja" colspan="2">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="${__formdata.CENLACE}" name="CENLACE" id="CENLACE" 
                                            <axis:atr f="axisadm083" c="CENLACE" a="modificable=false&obligatorio=false"/>
                                            title="<axis:alt f="axisadm083" c="CENLACE" lit="9903796"/>"
                                            />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisadm083" c="CPROCES" dejarHueco="false">
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="20" 
                                            value="<c:if test="${!empty __formdata.CPROCES}">${__formdata.CPROCES}</c:if><c:if test="${empty __formdata.CPROCES}">${__formdata.OTROS}</c:if>" name="TPROCES" id="TPROCES" maxlength="20"
                                            <axis:atr f="axisadm083" c="TPROCES" a="modificable=false&obligatorio=false"/>
                                            title="<axis:alt f="axisadm083" c="TPROCES" lit="1000576"/>"
                                            />
                                        </td>
                                        </axis:ocultar>
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
              <c:param name="f">axisadm083</c:param>
              <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FEFEADM",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFEADM", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>

</body>
</html>