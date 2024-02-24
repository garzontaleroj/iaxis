<%/* Revision:# OiqHrvyweQTeu6LJdpFiCg== # */%>
<%-- 
*  Fichero: axisfic004.jsp
*  @author <a href = "mailto:erhernandez@csi-ti.com">Edgar Hernndez</a>
*
*  Fecha: 14/06/2016
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
     <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />

    <!--********** CALENDARIO ************************* -->
      <!-- Hoja de estilo del Calendario -->
      <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
      <!-- Script principal del calendario -->
      <script type="text/javascript" src="scripts/calendar.js"></script>
      <!-- Idioma del calendario, en funcin del Locale -->
      <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
      <!-- Setup del calendario -->
      <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** --> 


    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload_axisfic004() {
            <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
                        retocarPAGE_CSS('axisfic004');
            </c:if>
            f_cargar_propiedades_pantalla();
            revisarEstilos();
            var resultado = '${requestScope.resultado}';
            if (!objUtiles.estaVacio(resultado) && resultado == "0"){
                parent.f_aceptar_axisfic004();  
            }     
        }
        
                
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
                formdataCMODO = '${__formdata.CMODO}';
                if (!objUtiles.estaVacio(formdataCMODO) && formdataCMODO != "1"){
                  objUtiles.ejecutarFormulario("modal_axisfic004.do", "aceptar",  document.axisfic004Form, "_self", objJsMessages.jslit_cargando);
                }else{
                    f_but_cancelar();
               }    
            }
        }
        
        function f_but_cancelar() {        
            revisarEstilos();
            parent.f_cerrar_axisfic004();
        }                
            
        function f_but_salir() {
            revisarEstilos();
            parent.f_cerrar_axisfic004();
        }
        
        
        function f_but_9909413(){
            if (objValidador.validaEntrada()) {
                //if(validarCampos_9909413()){
                    formdataCMODO = '${__formdata.CMODO}';
                    if (!objUtiles.estaVacio(formdataCMODO) && formdataCMODO != "1"){
                      objUtiles.ejecutarFormulario("modal_axisfic004.do", "centralRiesgo",  document.axisfic004Form, "_self", objJsMessages.jslit_cargando);
                    }
                //} 
            }
        }
        
        function f_but_9909412(){
            if (objValidador.validaEntrada()) {
                formdataCMODO = '${__formdata.CMODO}';
                if (!objUtiles.estaVacio(formdataCMODO) && formdataCMODO != "1"){
                  objUtiles.ejecutarFormulario("modal_axisfic004.do", "calcular",  document.axisfic004Form, "_self", objJsMessages.jslit_cargando);
                }
            }
        }
        
        
        function f_formatdate(entrada,title){
            var jDate = new JsFecha();
            if(entrada.value.length>0){
              entrada.value=jDate.formateaFecha(entrada.value);
                  
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt f="axisfic004" c="ALER_ERR" lit="1000421"/>");
                }
            }
        } 
        
        function validarCampos_9909413(){
            
            var ok;
            
            var mensajeAlert = "";
            
            
            var formdataCFUENTE  = document.getElementById("CFUENTE");
            if (objUtiles.estaVacio(formdataCFUENTE) || formdataCFUENTE == null){
                var title9909082 =  "<axis:alt f="axisfic004" c="ALER1_ERR" lit="9909082"/>"; 
                var mensajeCFUENTE = "- " + objJsMessages.jslit_campo_validador + " '" + title9909082  + "' : " + objJsMessages.jslit_campo_obligatorio + "."
                mensajeAlert = mensajeAlert + mensajeCFUENTE + "\n";
                //ok = false;
            }
            
            
            formdataIMINIMO  = 'formdata.IMINIMO';
       //   if (objUtiles.estaVacio(formdataIMINIMO) || formdataIMINIMO == null){
                var title9909097 =  "<axis:alt f="axisfic004" c="ALER2_ERR" lit="9909097"/>"; 
                var mensajeIMINIMO = "- " + objJsMessages.jslit_campo_validador + " '" + title9909097  + "' : " + objJsMessages.jslit_campo_obligatorio + "."
                mensajeAlert = mensajeAlert + mensajeIMINIMO + "\n";
                //ok = false;
       //   }
                
        //  if(!ok)
            alert(mensajeAlert);
                
            return Boolean(ok); 
        }
        
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        
        

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
                
        /****************************************************************************************/
        /*********************************** axisfic007 ********************************/
        /****************************************************************************************/    
         function f_abrir_axisfic007(NCAMPO,NNOMCAMP){
             var TCAMPO=objDom.getValorPorId(NCAMPO);
             // Inicio IAXIS-3674 10/06/2019
             var CFUENTE  = "${__formdata.CFUENTE}";
             var SFINANCI ="${__formdata.SFINANCI}";
             var FCONSULTA = objDom.getValorPorId("FCONSULTA");
             TCAMPO = "";
             // Fin IAXIS-3674 10/06/2019
             itemc=NCAMPO;  
             // Inicio IAXIS-3674 10/06/2019
             objUtiles.abrirModal("axisfic007", "src", "modal_axisfic007.do?operation=form&NCAMPO="+NCAMPO+"&NNOMCAMP="+NNOMCAMP+"&TCAMPO="+TCAMPO+"&SFINANCI="+SFINANCI+"&CFUENTE="+CFUENTE+"&FCONSULTA="+FCONSULTA);
             // Fin IAXIS-3674 10/06/2019
            // objDom.setValorPorId(itemc, "");
         }  
                 
         function f_aceptar_axisfic007(CODIGO, TEXTO){
             f_cerrar_axisfic007();
             if (!objUtiles.estaVacio(TEXTO)){
                objDom.setValorPorId(itemc,TEXTO);
             }else{   
                 limpiaCampos(itemc);
             }
         }   
        
         function f_cerrar_axisfic007(){
             objUtiles.cerrarModal("axisfic007"); 
         } 
        
        
        
        /****************************************************************************************/
        /************************************** UTILES *******************************************/
        /****************************************************************************************/
        function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
        }
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
    </script>  

  </head>
  <body onload="f_onload_axisfic004()">
    <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
      
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
         <axis:alt f="axisfic004" c="LIT_1000573" lit="1000573" />
       </c:param>
       <c:param name="nid" value="axisfic007" />
    </c:import>   
      
    <form name="axisfic004Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SPERSON"   value="${__formdata.SPERSON}"/>
        <input type="hidden" name="SFINANCI"  value="${__formdata.SFINANCI}"/>
        <input type="hidden" name="NMOVIMI"  value="${__formdata.NMOVIMI}"/>
        <input type="hidden" name="CMODO" value="${__formdata.CMODO}"/> 
        <input type="hidden" name="CAGENTE"  value="${__formdata.CAGENTE}"/>
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisfic004" c="formulario" lit="9909077" /></c:param>
            <c:param name="producto"><axis:alt f="axisfic004" c="producto" lit="9909077" /></c:param>
            <c:param name="form">axisfic004</c:param>
        </c:import>


        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                    <table class="seccion">
                       <tr>
                           <th style="width:100%;height:0px"></th>
                       </tr> 
                       <tr>         
                             
                           <axis:visible f="axisfic004" c="CFUENTE">
                             <td class="titulocaja" id="LIT_CFUENTE" colspan="1">
                               <b><axis:alt f="axisfic004" c="CFUENTE" lit="9909082"/></b>
                             </td>
                           </axis:visible> 
                       
                       </tr> 
                       <tr>
                           
                           <axis:visible f="axisfic004" c="CFUENTE" >
                              <td class="campocaja" colspan="1">       
                                <select name="CFUENTE" id="CFUENTE" size="1" class="campowidthselect campo campotexto" style="width:45%;"
                                        title="<axis:alt f="axisfic004" c="CFUENTE" lit="9909082"/>"  
                                         <axis:atr f="axisfic004" c="CESVALOR" a="obligatorio=true"/>           
                                    <%-- <c:if test="${__formdata.CMODO == '1'}"> disabled="disabled" </c:if> --%>>&nbsp;   <!-- POST-123 -->
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfic004" c="C_CFUENTE" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstFuenteInformacion}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.CFUENTE}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>            
                              </td>
                           </axis:visible>
                        
                       </tr> 
                       <tr>    
                           
                           <axis:visible f="axisfic004" c="FCONSULTA">
                             <td class="titulocaja" id="LIT_FCONSULTA" colspan="1">
                               <b><axis:alt f="axisfic004" c="FCONSULTA" lit="9909096"/></b>
                             </td>
                           </axis:visible> 
                           
                       </tr> 
                       <tr>
                            <!-- Cambio para bug/IAXIS-15952 : Start -->
                           <axis:visible f="axisfic004" c="FCONSULTA" >
                               <td class="campocaja" colspan="1">
                                  <jsp:useBean id="todayFCONSULTA" class="java.util.Date" />
                                  <c:set var="FCONSULTA">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONSULTA}"/>
                                  </c:set>  <!-- POST-123 --> 
                                  <!-- EDSS POST-213 AJUSTE FCONSULTA -->
                                  <input type="text" <axis:atr f="axisfic004" c="FCONSULTA" a="modificable=true"/> <%-- <c:if test="${__formdata.CMODO == '1'}"> disabled="disabled" </c:if> --%>                                        
                                         onblur="javascript:f_formatdate(this,'')"
                                         formato="fecha" 
                                         alt="<axis:alt f="axisfic004" c="FCONSULTA" lit="9909096"/>" 
                                         title="<axis:alt f="axisfic004" c="FCONSULTA" lit="9909096"/>"
                                         name="FCONSULTA" 
                                         id="FCONSULTA"   
                                         value="${FCONSULTA}<c:if test="${empty FCONSULTA}">
                                          <fmt:formatDate pattern="dd/MM/yyyy" value="${todayFCONSULTA}"/>
                                         </c:if>"
                                         style="width:45%;" 
                                         class="campowidthinput campo campotexto_ob"/>
                                           <axis:visible c="ICO_FCONSULTA" f="axisfic004">
                                                <a id="icon_FCONSULTA" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisfic004" c="SELECT" lit="108341"/>" title="<axis:alt f="axisfic004" c="ICO_FCONSULTA" lit="9909096" />" src="images/calendar.gif"/></a>
                                  </axis:visible>
                               </td>
                           </axis:visible> 
                           <!-- Cambio para bug/IAXIS-15952 : End -->
                           
                       </tr> 
                       <tr>         
                           
                           <axis:visible f="axisfic004" c="IMINIMO">
                             <td class="titulocaja" id="LIT_IMINIMO" colspan="1">
                               <b><axis:alt f="axisfic004" c="IMINIMO" lit="9909097"/></b>
                             </td>
                           </axis:visible> 
                                         
                        </tr> 
                        <tr>
                            
                           <axis:visible f="axisfic004" c="IMINIMO" >
                              <td class="campocaja" colspan="1">
<!-- POST-123 -->                                <input type="numeric" class="campowidthinput campo camponumerico" id="IMINIMO" name="IMINIMO" size="15"
                                 <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>
                                 title="<axis:alt f="axisfic004" c="IMINIMO" lit="9909097"/>" style="width:45%" value="${__formdata.IMINIMO}" />
                              </td>                                                 
                           </axis:visible>
                           
                           
                        </tr>
                        <tr>         
                             
                           <axis:visible f="axisfic004" c="ICAPPAG">
                             <td class="titulocaja" id="LIT_ICAPPAG" colspan="1">
                               <b><axis:alt f="axisfic004" c="ICAPPAG" lit="9909098"/></b>
                             </td>
                           </axis:visible>
                           
                        </tr> 
                        <tr> 
                            
                           <axis:visible f="axisfic004" c="ICAPPAG" >
                              <td class="campocaja" colspan="1">
                                        <!-- POST-123 -->                            <input type="numeric" class="campowidthinput campo camponumerico"  
                                        <axis:atr f="axisfic004" c="ICAPPAG" a="modificable=true"/>id="ICAPPAG" name="ICAPPAG" size="15"
                                <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>
                                 title="<axis:alt f="axisfic004" c="ICAPPAG" lit="9909098"/>" style="width:45%" value="${__formdata.ICAPPAG}"/>
                              </td>                                                 
                           </axis:visible>
                           
                        </tr> 
                        <tr>     
                           
                           <axis:visible f="axisfic004" c="NMORA">
                             <td class="titulocaja" id="LIT_NMORA" colspan="1">
                               <b><axis:alt f="axisfic004" c="NMORA" lit="9909107"/></b>
                             </td>
                           </axis:visible>
                        
                        </tr>
                        <tr>
                           
                           <axis:visible f="axisfic004" c="NMORA" >
                              <td class="campocaja" colspan="1">
  <!-- POST-123 -->                          <input type="numeric" class="campowidthinput campo camponumerico" id="NMORA" name="NMORA" size="15"
                            <%--  <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>
                                 title="<axis:alt f="axisfic004" c="NMORA" lit="9909107"/>" style="width:45%" value="${__formdata.NMORA}" />
                              </td>                                                 
                           </axis:visible>
                           
                        </tr>
                        <tr>      
                           
                           <axis:visible f="axisfic004" c="NCONSUL">
                             <td class="titulocaja" id="LIT_NCONSUL" colspan="1">
                               <b><axis:alt f="axisfic004" c="NCONSUL" lit="9909080"/></b>
                             </td>
                           </axis:visible> 
                                         
                        </tr>
                        <tr>
                         
                           <axis:visible f="axisfic004" c="NCONSUL" >
                              <td class="campocaja" colspan="1"><!-- POST-123 -->
                                <input type="numeric" class="campowidthinput campo camponumerico" id="NCONSUL" name="NCONSUL" size="15"
                                <%--  <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>
                                 title="<axis:alt f="axisfic004" c="NCONSUL" lit="9909080"/>" style="width:45%" value="${__formdata.NCONSUL}"/>
                              </td>                                                 
                           </axis:visible>
                            
                        </tr>
                        <tr>     
                           
                           <axis:visible f="axisfic004" c="IENDTOT">
                             <td class="titulocaja" id="LIT_IENDTOT" colspan="1">
                               <b><axis:alt f="axisfic004" c="IENDTOT" lit="9909078"/></b>
                             </td>
                           </axis:visible> 
                                         
                        </tr> 
                        <tr>
                         
                           <axis:visible f="axisfic004" c="IENDTOT" >
                              <td class="campocaja" colspan="1">
    <!-- POST-123 --> <input type="numeric" class="campowidthinput campo camponumerico" id="IENDTOT" name="IENDTOT" size="15"
                            <%--     <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if>--%>
                                 title="<axis:alt f="axisfic004" c="IENDTOT" lit="9909078"/>" style="width:45%" value="${__formdata.IENDTOT}" />
                              </td>                                                 
                           </axis:visible>
                            
                        </tr> 
                        <tr>         
                             
                           <axis:visible f="axisfic004" c="NCALIFA">
                             <td class="titulocaja" id="LIT_NCALIFA" colspan="1">
                               <b><axis:alt f="axisfic004" c="NCALIFA" lit="9909100"/></b>
                             </td>
                           </axis:visible>
                        
                        </tr> 
                        <tr>
                            
                            <axis:visible f="axisfic004" c="NCALIFA" >
                              <td class="campocaja" colspan="1"><!-- POST-123 -->
                                <input type="numeric" class="campowidthinput campo camponumerico" id="NCALIFA" name="NCALIFA" size="15"
                              <%--    <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if>--%>
                                 title="<axis:alt f="axisfic004" c="NCALIFA" lit="9909100"/>" style="width:45%" value="${__formdata.NCALIFA}" 
                                  />
                              </td>                                                 
                           </axis:visible>   
                           
                        </tr> 
                        <tr>    
                           
                           <axis:visible f="axisfic004" c="NCALIFB">
                             <td class="titulocaja" id="LIT_NCALIFB" colspan="1">
                               <b><axis:alt f="axisfic004" c="NCALIFB" lit="9909101"/></b>
                             </td>
                           </axis:visible>
                        
                        </tr>  
                        <tr>
                            
                           <axis:visible f="axisfic004" c="NCALIFB" >
                              <td class="campocaja" colspan="1">
 <!-- POST-123 -->                               <input type="numeric" class="campowidthinput campo camponumerico" id="NCALIFB" name="NCALIFB" size="15"
                                <%--     <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if>--%>
                                 title="<axis:alt f="axisfic004" c="NCALIFB" lit="9909101"/>" style="width:45%" value="${__formdata.NCALIFB}" />
                              </td>                                                 
                           </axis:visible>
                                                    
                        </tr>   
                        <tr>      
                           
                           <axis:visible f="axisfic004" c="NCALIFC">
                             <td class="titulocaja" id="LIT_NCALIFC" colspan="1">
                               <b><axis:alt f="axisfic004" c="NCALIFC" lit="9909102"/></b>
                             </td>
                           </axis:visible> 
                                         
                        </tr>
                        <tr>
                         
                           <axis:visible f="axisfic004" c="NCALIFC" >
                              <td class="campocaja" colspan="1">    <!-- POST-123 -->
                                                             <input type="numeric" class="campowidthinput campo camponumerico" id="NCALIFC" name="NCALIFC" size="15"
                                <%--  <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>
                                 title="<axis:alt f="axisfic004" c="NCALIFC" lit="9909102"/>" style="width:45%" value="${__formdata.NCALIFC}" />                            
                                 </td>                                                 
                           </axis:visible>
                            
                        </tr>
                        <tr>         
                             
                           <axis:visible f="axisfic004" c="NCALIFD">
                             <td class="titulocaja" id="LIT_NCALIFD" colspan="1">
                               <b><axis:alt f="axisfic004" c="NCALIFD" lit="9909104"/></b>
                             </td>
                           </axis:visible> 
                           
                        </tr>
                        <tr>
                            
                           <axis:visible f="axisfic004" c="NCALIFD" >
                              <td class="campocaja" colspan="1">    <!-- POST-123 -->
                                <input type="numeric" class="campowidthinput campo camponumerico" id="NCALIFD" name="NCALIFD" size="15"
                                <%--   <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if>--%>
                                 title="<axis:alt f="axisfic004" c="NCALIFD" lit="9909104"/>" style="width:45%" value="${__formdata.NCALIFD}"
                                  />
                              </td>                                                 
                           </axis:visible>
                        
                        </tr>
                        <tr>   
                           
                           <axis:visible f="axisfic004" c="NCALIFE">
                             <td class="titulocaja" id="LIT_NCALIFE" colspan="1">
                               <b><axis:alt f="axisfic004" c="NCALIFE" lit="9909105"/></b>
                             </td>
                           </axis:visible>
                           
                        </tr>
                        <tr>
                           
                           <axis:visible f="axisfic004" c="NCALIFE" >
                              <td class="campocaja" colspan="1">
 <!-- POST-123 -->                               <input type="numeric" class="campowidthinput campo camponumerico" id="NCALIFE" name="NCALIFE" size="15"
                              <%--   <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if>--%>
                                 title="<axis:alt f="axisfic004" c="NCALIFE" lit="9909105"/>" style="width:45%" value="${__formdata.NCALIFE}"
                                  />
                              </td>                                                 
                           </axis:visible>
                        
                        </tr>
                        <tr>         
                             
                           <axis:visible f="axisfic004" c="NSCORE">
                             <td class="titulocaja" id="LIT_NSCORE" colspan="1">
                               <b><axis:alt f="axisfic004" c="NSCORE" lit="9909106"/></b>
                             </td>
                           </axis:visible>
                           
                        </tr>
                        <tr>   
                           
                           <axis:visible f="axisfic004" c="NSCORE" >
                              <td class="campocaja" colspan="1">
        <!-- POST-123 -->                   <input type="numeric" class="campowidthinput campo camponumerico"   <axis:atr f="axisfic004" c="NSCORE" a="modificable=true"/> id="NSCORE" name="NSCORE" size="15"
                                <%--   <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if>--%>
                                 title="<axis:alt f="axisfic004" c="NSCORE" lit="9909106"/>" style="width:45%" value="${__formdata.NSCORE}" 
                                  />
                              </td>                                                 
                           </axis:visible>
                           
                        </tr>
                        <tr>   
                           
                           <axis:visible f="axisfic004" c="ICAPEND">
                             <td class="titulocaja" id="LIT_ICAPEND" colspan="1">
                               <b><axis:alt f="axisfic004" c="ICAPEND" lit="9909099"/></b>
                             </td>
                           </axis:visible>
                           
                        </tr>  
                        <tr>
                            
                            <axis:visible f="axisfic004" c="ICAPEND" >
                              <td class="campocaja" colspan="1"> <!-- POST-123 -->                   <input type="numeric" class="campowidthinput campo camponumerico" id="ICAPEND" name="ICAPEND" size="15"
                                <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if>--%>
                                 title="<axis:alt f="axisfic004" c="ICAPEND" lit="9909099"/>" style="width:45%" value="${__formdata.ICAPEND}"
                                  />
                              </td>                                                 
                           </axis:visible>
                        
                        </tr>
                        <tr>      
                           
                           <axis:visible f="axisfic004" c="CRESTRIC">
                             <td class="titulocaja" id="LIT_CRESTRIC" colspan="1">
                               <b><axis:alt f="axisfic004" c="CRESTRIC" lit="9909112"/></b>
                             </td>
                           </axis:visible> 
                                         
                        </tr>
                        <tr>
                         
                           <axis:visible f="axisfic004" c="CRESTRIC" >
                              <td class="campocaja" colspan="1">       
                                <select name="CRESTRIC" id="CRESTRIC" size="1" class="campowidthselect campo campotexto" style="width:45%;"
                                        title="<axis:alt f="axisfic004" c="CRESTRIC" lit="9909112"/>"
<%-- <c:if test="${__formdata.CMODO == '1'}"> disabled="disabled" </c:if> --%>>>&nbsp;
                                            <!-- POST-123 -->
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfic004" c="C_CRESTRIC" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstClienteRestringido}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.CRESTRIC}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>            
                              </td>
                           </axis:visible>  
                            
                        </tr>
                        <tr>    
                           
                           <axis:visible f="axisfic004" c="FCUPO">
                             <td class="titulocaja" id="LIT_FCUPO" colspan="1">
                               <b><axis:alt f="axisfic004" c="FCUPO" lit="9909110"/></b>
                             </td>
                           </axis:visible>
                           
                        </tr>
                        <tr>
                           
                           <axis:visible f="axisfic004" c="FCUPO" >
                               <td class="campocaja" colspan="1">   <!-- POST-123 -->

                                  <input type="text" 
                                         onblur="javascript:f_formatdate(this,'')" 
                                         formato="fecha"  
                                         alt="<axis:alt f="axisfic004" c="FCUPO" lit="9909110"/>" 
                                         title="<axis:alt f="axisfic004" c="FCUPO" lit="9909110"/>"
                                         name="FCUPO" id="FCUPO"  
                                         value="<fmt:formatDate value="${__formdata.FCUPO}" pattern="dd/MM/yyyy" />" 
                                         style="width:45%;" 
                                         class="campowidthinput campo campotexto_ob"
                                         <axis:atr f="axisfic004" c="FCUPO" a="modificable=true"/> />   
                                        <axis:visible c="ICO_FCUPO" f="axisfic004">
                                                <a id="icon_FCUPO" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisfic004" c="SELECT" lit="108341"/>" title="<axis:alt f="axisfic004" c="ICO_FCUPO" lit="9909109" />" src="images/calendar.gif"/></a>
                                  </axis:visible>
                               </td>
                           </axis:visible> 
                           
                        </tr>
                        <tr>         
                             
                           <axis:visible f="axisfic004" c="ICUPOS">
                             <td class="titulocaja" id="LIT_ICUPOS" colspan="1">
                               <b><axis:alt f="axisfic004" c="ICUPOS" lit="9909109"/></b>
                             </td>
                           </axis:visible>
                           
                        </tr>
                        <tr>
                           
                           <axis:visible f="axisfic004" c="ICUPOS" >
                              <td class="campocaja" colspan="1">    <!-- POST-123 -->                                
                              <input type="numeric" class="campowidthinput campo camponumerico" <axis:atr f="axisfic004" c="ICUPOS"  a="modificable=true"/> id="ICUPOS" name="ICUPOS" size="15" 
                                <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%> 
                                 title="<axis:alt f="axisfic004" c="ICUPOS" lit="9909109"/>" style="width:45%" value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.ICUPOS}'/>"/>
                              </td>                                                 
                           </axis:visible>
                           
                        </tr>
                        <tr>       
                           
                           <axis:visible f="axisfic004" c="ICUPOG">
                             <td class="titulocaja" id="LIT_ICUPOG" colspan="1">
                               <b><axis:alt f="axisfic004" c="ICUPOG" lit="9909108"/></b>
                             </td>
                           </axis:visible> 
                                         
                        </tr>
                        <tr>
                         
                           <axis:visible f="axisfic004" c="ICUPOG" >
                              <td class="campocaja" colspan="1">
    <!-- POST-123 -->           <input type="numeric" class="campowidthinput campo camponumerico"   <axis:atr f="axisfic004" c="ICUPOG" a="modificable=true"/> id="ICUPOG" name="ICUPOG" size="15"
                              <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if>--%>
                                 title="<axis:alt f="axisfic004" c="ICUPOG" lit="9909108"/>" style="width:45%" value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.ICUPOG}'/>"/>
                              </td>                                                 
                           </axis:visible>
                            
                        </tr>
                        <%-- INI - IAXIS-4146 - JLTS - 20/05/2019. Se incluye columna NCALRIES --%>
                        <tr>         
                             
                           <axis:visible f="axisfic004" c="TNCALRIES">
                             <td class="titulocaja" id="LIT_TNCALRIES" colspan="1">
                               <b><axis:alt f="axisfic004" c="TNCALRIES" lit="2000094"/></b>
                             </td>
                           </axis:visible>
                           
                        </tr>
                        <tr>   
                                                      
                           <axis:visible f="axisfic004" c="TNCALRIES" >
                              <td class="campocaja" colspan="1">
                                <input type="text" class="campowidthinput campo campotexto" readonly="readonly" size="15"                                                       
                                      value="${__formdata.TNCALRIES}" name="TNCALRIES" id="TNCALRIES" style="width:10%;"
                                      title="<axis:alt f="axisfic004" c="lit_2000094" lit="2000094"/>"/>                                          
                              </td>
                           </axis:visible>   
                           
                           
                        </tr>
                        <%-- FIN - IAXIS-4146 - JLTS - 20/05/2019. Se incluye columna NCALRIES --%>
                        <tr>         
                             
                           <axis:visible f="axisfic004" c="TCONCEPC">
                             <td class="titulocaja" id="LIT_TCONCEPC" colspan="1">
                               <b><axis:alt f="axisfic004" c="TCONCEPC" lit="9909113"/></b>
                             </td>
                           </axis:visible>
                           
                        </tr>
                        <tr>   

                           <axis:visible f="axisfic004" c="TCONCEPC" > 
                             <td class="campocaja" colspan="1">
                               <textarea cols="" rows="1" class="campo campotexto" id="TCONCEPC" name="TCONCEPC" size="15" title="<axis:alt f="axisfic004" c="lit_9909113" lit="9909113"/>"
                                  readonly="readonly" style="width:50%;resize:none;overflow:hidden" <axis:atr f="axisfic004" c="TCONCEPC" a="obligatorio=true&isInputText=false" />
                                  >${__formdata.TCONCEPC}</textarea>
                                        <!-- POST-123 -->
                              <%-- <c:if test="${__formdata.CMODO != '1'}">--%>         
                                   &nbsp;
                                   <axis:visible f="axisfic004" c="FINDTCPC" > <!-- IAXIS-4854 -->
                                    <img id="findTcpc" border="0" src="images/lapiz.gif" onclick="f_abrir_axisfic007('TCONCEPC','9909113')" style="cursor:pointer"/>
                                    </axis:visible> <!-- IAXIS-4854 -->
                              <%--      </c:if>--%> 
                               &nbsp;<c:if test="${__formdata.TCONCEPC!=null}"><span id="TCONCEPC_span"><b><axis:alt f="axisfic004" c="formulario" lit="9910983" /></b></span></c:if> 
                               <c:if test="${__formdata.TCONCEPC==null}"><span id="TCONCEPC_span"><b><axis:alt f="axisfic004" c="formulario" lit="9910984" /></b></span></c:if>  
                             </td>
                           </axis:visible>
                           
                        </tr>
                        <tr>
                           
                           <axis:visible f="axisfic004" c="TCONCEPS">
                             <td class="titulocaja" id="LIT_TCONCEPS" colspan="1">
                               <b><axis:alt f="axisfic004" c="TCONCEPS" lit="9909114"/></b>
                             </td>
                           </axis:visible>
                           
                        </tr>
                        <tr>   
                            
                            <axis:visible f="axisfic004" c="TCONCEPS" > 
                              <td class="campocaja" colspan="1">
                                <textarea cols="" rows="1" class="campo campotexto" id="TCONCEPS" name="TCONCEPS" size="15" title="<axis:alt f="axisfic004" c="lit_9909114" lit="9909114"/>"
                                  readonly="readonly" style="width:50%;resize:none;overflow:hidden" <axis:atr f="axisfic004" c="TCONCEPS" a="obligatorio=true&isInputText=false" />
                                  >${__formdata.TCONCEPS}</textarea>
                                <%-- <c:if test="${__formdata.CMODO != '1'}">--%> <!-- POST-123 -->    
    <axis:visible   f="axisfic004" c="FINDTCPC"><!-- POST-134 -->                                                       &nbsp;<img id="findTcpc" border="0" src="images/lapiz.gif" onclick="f_abrir_axisfic007('TCONCEPS','9909114')" style="cursor:pointer"/><%--</c:if>--%>                   </axis:visible> <!-- POST-134 --> 
         &nbsp;<c:if test="${__formdata.TCONCEPS!=null}"><span id="TCONCEPS_span"><b><axis:alt f="axisfic004" c="formulario" lit="9910983" /></b></span></c:if> 
                                <c:if test="${__formdata.TCONCEPS==null}"><span id="TCONCEPS_span"><b><axis:alt f="axisfic004" c="formulario" lit="9910984" /></b></span></c:if>  
                              </td>
                             </axis:visible>       
                                          
                        </tr>
                        <tr>      
                           
                           <axis:visible f="axisfic004" c="TCBUREA">
                             <td class="titulocaja" id="LIT_TCBUREA" colspan="1">
                               <b><axis:alt f="axisfic004" c="TCBUREA" lit="9909115"/></b>
                             </td>
                           </axis:visible> 
                                         
                        </tr>
                        <tr>
                                                                               <axis:visible f="axisfic004" c="TCBUREA" > 
                             <td class="campocaja" colspan="1">
                               <textarea cols="" rows="1" class="campo campotexto" id="TCBUREA" name="TCBUREA" size="15" title="<axis:alt f="axisfic004" c="lit_9909115" lit="9909115"/>"
                                 readonly="readonly" style="width:50%;resize:none;overflow:hidden" <axis:atr f="axisfic004" c="TCBUREA" a="obligatorio=true&isInputText=false" />
                                 >${__formdata.TCBUREA}</textarea>
                            <%--  <c:if test="${__formdata.CMODO != '1'}"> --%> <!-- POST-123 -->
                            <axis:visible                   f="axisfic004" c="FINDTCPC">                                            <!-- POST-134 -->                              &nbsp;<img id="FINDTCPCB" border="0" src="images/lapiz.gif" onclick="f_abrir_axisfic007('TCBUREA','9909115')" style="cursor:pointer"/>   <%-- </c:if> --%>
</axis:visible> <!-- POST-134 --> &nbsp;<c:if test="${__formdata.TCBUREA!=null}"><span id="TCBUREA_span"><b><axis:alt f="axisfic004" c="formulario" lit="9910983" /></b></span></c:if> 
                               <c:if test="${__formdata.TCBUREA==null}"><span id="TCBUREA_span"><b><axis:alt f="axisfic004" c="formulario" lit="9910984" /></b></span></c:if>  
                             </td>
                           </axis:visible>
                            
                        </tr>
                        <tr>         
                             
                           <axis:visible f="axisfic004" c="TCOTROS">
                             <td class="titulocaja" id="LIT_TCOTROS" colspan="1">
                               <b><axis:alt f="axisfic004" c="TCOTROS" lit="9909116"/></b>
                             </td>
                           </axis:visible> 
                           
                        </tr>
                        <tr>

                        <axis:visible f="axisfic004" c="TCOTROS" > 
                          <td class="campocaja" colspan="1">
                            <textarea cols="" rows="1" class="campo campotexto" id="TCOTROS" name="TCOTROS" size="15" title="<axis:alt f="axisfic004" c="lit_9909116" lit="9909116"/>"
                              readonly="readonly" style="width:50%;resize:none;overflow:hidden" <axis:atr f="axisfic004" c="TCOTROS" a="obligatorio=true&isInputText=false" />
                              >${__formdata.TCOTROS}</textarea>
                            <%--   <c:if test="${__formdata.CMODO != '1'}">  --%>   <axis:visible
                                            f="axisfic004" c="FINDTCPC">
                                             <!-- POST-134 -->        
                            &nbsp;<img id="findTcpc" border="0" src="images/lapiz.gif" onclick="f_abrir_axisfic007('TCOTROS','9909116')" style="cursor:pointer"/>   <%-- </c:if> --%>
                            &nbsp;</axis:visible> <!-- POST-134 --> <c:if test="${__formdata.TCOTROS!=null}"><span id="TCOTROS_span"><b><axis:alt f="axisfic004" c="formulario" lit="9910983" /></b></span></c:if> 
                            <c:if test="${__formdata.TCOTROS==null}"><span id="TCOTROS_span"><b><axis:alt f="axisfic004" c="formulario" lit="9910984" /></b></span></c:if>  
                          </td>
                         </axis:visible>
                            
                        </tr>
                    </table>
                </td>
            </tr>
        </table>            
    <!-- POST-123 -->
            <c:import url="../include/botonera_nt.jsp"> <c:param name="f">axisfic004</c:param><c:param name="f">axisfic004</c:param>
                <%-- <c:param name="__botones"><c:if test="${__formdata.CMODO != 1}"> cancelar,9909412,9909413,aceptar,</c:if><c:if test="${__formdata.CMODO == 1}">salir</c:if> </c:param>
             <%-- <c:param name="__botones">cancelar,9909412,9909413,aceptar,salir</c:param>--%>
                <%-- POST-134 --%>
                <c:param name="__botones">
                    <axis:visible f="axisfic004" c="but_9909412">,9909412</axis:visible><axis:visible f="axisfic004" c="but_9909413">,9909413</axis:visible>,cancelar,<axis:visible f="axisfic004" c="but_aceptar">,aceptar</axis:visible>,salir</c:param>
                <%--POST-134 --%>
            </c:import>
        </form>
        <%-- <c:if test="${__formdata.CMODO != '1'}">  --%>
                <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FCONSULTA",
                ifFormat       :    "%d/%m/%Y",
                button         :    "icon_FCONSULTA", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField     :    "FCUPO",
                ifFormat       :    "%d/%m/%Y",
                button         :    "icon_FCUPO", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
    <%-- </c:if> --%>
        <!-- POST-123 -->
        <c:import url="../include/mensajes.jsp" />
</div>
    </body>    

</html>