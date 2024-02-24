<%/*
*  Fichero: axisadm043.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a> 
*
*  Fecha: 12/01/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
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
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
          /*  var vcmotivo    = ${!empty __formdata.CMOTIVO};
            if (vcmotivo){
                objDom.setDisabledPorId("CMOTIVO",true); //CMOTIVO
            }
        */
         <c:if test="${RESULT==0}">
            parent.f_aceptar_axisadm043();
        </c:if>
        
            f_cargar_propiedades_pantalla();        
        
        }
                
        
            
        function f_but_buscar() {
           objUtiles.ejecutarFormulario("modal_axisadm034.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
          function f_but_aceptar () {
           if (objValidador.validaEntrada()) {
             objDom.setDisabledPorId("CMOTIVO",false); 
             objUtiles.ejecutarFormulario("modal_axisadm043.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
           }
            
        }
        
         function f_but_cancelar() {
            parent.f_cerrar_modal('axisadm043');
        }
        
    
    </script>
  </head>
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_aceptar() }" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
            
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SIDPRODP" value="${__formdata.SIDPRODP}"/>
           
            <input type="hidden" name="PMODO" value="${__formdata.PMODO}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisadm043" c="TIT_FORM" lit="9900936" /></c:param>
                <c:param name="producto"><axis:alt f="axisadm043" c="TIT_FORM" lit="9900936" /></c:param>
                <c:param name="form">axisadm043</c:param>
            </c:import>

                <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                       
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                            
                                            
                                        </tr>
                                        
                                        <tr>
                                            <axis:visible f="axisadm043" c="NIMPAGAD" ><!-- CARTA INMEDIATA -->
                                            
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm043" c="NIMPAGAD" lit="9901856" /></b>
                                                </td>
                                             
                                             </axis:visible>
                                             <axis:visible f="axisadm043" c="CMOTIVO" ><!-- NUM DIAS -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm043" c="CMOTIVO" lit="9001626" /></b>
                                                </td>
                                             </axis:visible>	
                                        </tr>
                                          <tr>
                                        
                                         <axis:visible f="axisadm043" c="NIMPAGAD"> <!-- NUM DIAS -->
                                                   
                                                     <td class="campocaja">
                                                       <input id="NIMPAGAD" name="NIMPAGAD" 
                                                       value="${__formdata.NIMPAGAD}" style="width:35%;" 
                                                       <c:if test="${__formdata.PMODO =='MODIF'}"> readonly </c:if>
                                                       class="campowidthinput campo campotexto" <axis:atr f="axisadm043" c="NIMPAGAD" a="obligatorio=true&modificable=true&formato=entero" /> title="<axis:alt f="axisadm043" c="NIMPAGAD" lit="9901856" />"> 
                                                     </td>     
                                                     
                                          </axis:visible> 
                                          <axis:visible f="axisadm043" c="CMOTIVO" >
                                                    <td class="campocaja">
                                                        <select name="CMOTIVO" id ="CMOTIVO" style="width:70%;"  size="1" <axis:atr f="axisadm043" c="CMOTIVO" a="obligatorio=true&modificable=true&isInputText=false"/>
                                                            title="<axis:alt f="axisadm043" c="CMOTIVO" lit="9001626" />"
                                                            class="campowidthselect campo campotexto" <c:if test="${__formdata.PMODO =='MODIF'}"> disabled </c:if>>&nbsp;
                                                            
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm043" c="SNV_COMBO" lit="108341"/> - </option> 
                                                            <c:forEach items="${__formdata.listvalores.motivos}" var="emp">
                                                                <option value = "${emp.CATRIBU}" <c:if test="${emp.CATRIBU  == __formdata.CMOTIVO}">selected</c:if>>${emp.TATRIBU}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                </axis:visible>
                                          </tr>
                                          
                                        <tr>
                                           <axis:visible f="axisadm043" c="CMODIMM" ><!-- CARTA INMEDIATA -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm043" c="CMODIMM" lit="9900959" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axisadm043" c="CACTIMM" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm043" c="CACTIMM" lit="9900960" /></b><!-- ACCION INMEDIATA -->
                                                </td>
                                             </axis:visible>	
                                        </tr>
                                      <tr>
                                                                              
                                          <axis:visible f="axisadm043" c="CMODIMM"><!-- CARTA INMEDIATA -->
                                                    
                                                     <td class="campocaja">
                                                            <select name = "CMODIMM" style="width:70%;" id ="CMODIMM" size="1" <axis:atr f="axisadm043" c="CMODIMM" a="obligatorio=false&modificable=true&isInputText=false"/>
                                                                title="<axis:alt f="axisadm043" c="CMODIMM" lit="9900959" />"
                                                                class="campowidthselect campo campotexto">&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm043" c="SNV_COMBO" lit="108341"/> - </option> 
                                                                <c:forEach items="${__formdata.listvalores.cartas}" var="emp">
                                                                    <option value = "${emp.CATRIBU}" <c:if test="${emp.CATRIBU  == __formdata.CMODIMM}">selected</c:if>>${emp.TATRIBU}</option>
                                                                </c:forEach>
                                                            </select>
                                                     </td>     
                                                     
                                          </axis:visible> 
                                          
                                          <axis:visible f="axisadm043" c="CACTIMM"><!-- ACCION INMEDIATA -->
                                                    
                                                     <td class="campocaja">
                                                            <select name = "CACTIMM"  style="width:70%;"  id ="CACTIMM" size="1" <axis:atr f="axisadm043" c="CACTIMM" a="obligatorio=false&modificable=true&isInputText=false"/>
                                                                title="<axis:alt f="axisadm043" c="CACTIMM" lit="9900960" />"
                                                                class="campowidthselect campo campotexto">&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm043" c="SNV_COMBO" lit="108341"/> - </option> 
                                                                <c:forEach items="${__formdata.listvalores.acciones}" var="emp">
                                                                    <option value = "${emp.CATRIBU}" <c:if test="${emp.CATRIBU  == __formdata.CACTIMM}">selected</c:if>>${emp.TATRIBU}</option>
                                                                </c:forEach>
                                                            </select>
                                                     </td>     
                                                     
                                          </axis:visible> 
                                            
                                         </tr>

                                          <tr>
                                          <axis:visible f="axisadm043" c="CDIAAVIS" ><!-- DIAS -->
                                                <td class="titulocaja">
                                               <b> <axis:alt f="axisadm043" c="TRAMO" lit="9901853" /></b>
                                                    
                                                </td>
                                             </axis:visible>
                                           <axis:visible f="axisadm043" c="NDIAAVIS" ><!-- NUM DIAS -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm043" c="NDIAAVIS" lit="9901854" /></b>
                                                </td>
                                             </axis:visible>	
                                           	
                                        </tr>
                                        <tr>
                                           <axis:visible f="axisadm043" c="CDIAAVIS"><!-- DIAS -->
                                            
                                             <td class="campocaja">
                                                    <select name = "CDIAAVIS" id ="CDIAAVIS" style="width:70%;"  size="1" <axis:atr f="axisadm043" c="CDIAAVIS" a="obligatorio=false&modificable=true&isInputText=false"/>
                                                        title="<axis:alt f="axisadm043" c="CDIAAVIS" lit="9901853" />"
                                                        class="campowidthselect campo campotexto">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm043" c="SNV_COMBO" lit="108341"/> - </option> 
                                                        <c:forEach items="${__formdata.listvalores.dias}" var="emp">
                                                            <option value = "${emp.CATRIBU}" <c:if test="${emp.CATRIBU  == __formdata.CDIAAVIS}">selected</c:if>>${emp.TATRIBU}</option>
                                                        </c:forEach>
                                                    </select>
                                             </td>     
                                             
                                          </axis:visible>                              
                                          <axis:visible f="axisadm043" c="NDIAAVIS"> <!-- NUM DIAS -->
                                                    
                                                     <td class="campocaja">
                                                       <input id="NDIAAVIS" name="NDIAAVIS" 
                                                       value="${__formdata.NDIAAVIS}" style="width:35%;" 
                                                       class="campowidthinput campo campotexto" formato="decimal" title="<axis:alt f="axisadm043" c="NDIAAVIS" lit="9901854" />"> 
                                                     </td>     
                                                     
                                          </axis:visible> 
                                            
                                         </tr>
                                         
                                          <tr>
                                           <axis:visible f="axisadm043" c="CMODELO" > <!-- CARTA -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm043" c="CMODELO" lit="9001210" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axisadm043" c="CACTIMP" > <!-- ACCION -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm043" c="CACTIMP" lit="9000844" /></b>
                                                </td>
                                             </axis:visible>	
                                        </tr>
                                        <tr>
                                                                              
                                          <axis:visible f="axisadm043" c="CMODELO"><!-- CARTA -->
                                                    
                                                     <td class="campocaja">
                                                            <select name = "CMODELO" id ="CMODELO" style="width:70%;"  size="1" <axis:atr f="axisadm043" c="CMODELO" a="obligatorio=false&modificable=true&isInputText=false"/>
                                                                title="<axis:alt f="axisadm043" c="CMODELO" lit="9001210" />"
                                                                class="campowidthselect campo campotexto">&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm043" c="SNV_COMBO" lit="108341"/> - </option> 
                                                                <c:forEach items="${__formdata.listvalores.cartas}" var="emp">
                                                                    <option value = "${emp.CATRIBU}" <c:if test="${emp.CATRIBU  == __formdata.CMODELO}">selected</c:if>>${emp.TATRIBU}</option>
                                                                </c:forEach>
                                                            </select>
                                                     </td>     
                                                     
                                          </axis:visible> 
                                          
                                          <axis:visible f="axisadm043" c="CACTIMP"><!-- ACCION -->
                                                    
                                                     <td class="campocaja">
                                                            <select name="CACTIMP" id ="CACTIMP" style="width:70%;"  size="1" <axis:atr f="axisadm043" c="CACTIMP" a="obligatorio=true&modificable=true&isInputText=false"/>
                                                                title="<axis:alt f="axisadm043" c="CACTIMP" lit="9000844" />"
                                                                class="campowidthselect campo campotexto">&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm043" c="SNV_COMBO" lit="108341"/> - </option> 
                                                                <c:forEach items="${__formdata.listvalores.acciones}" var="emp">
                                                                    <option value = "${emp.CATRIBU}" <c:if test="${emp.CATRIBU  == __formdata.CACTIMP}">selected</c:if>>${emp.TATRIBU}</option>
                                                                </c:forEach>
                                                            </select>
                                                     </td>     
                                                     
                                          </axis:visible> 
                                            
                                         </tr>
                                         
                                    </table>
                                </td>
                            </tr>
                        </table>
<div class="separador">&nbsp;</div>                       
                      
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm043</c:param><c:param name="f">axisadm043</c:param>
                <c:param name="f">axisadm034</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FINI",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FINI", 
        singleClick    :    true,
        firstDay       :    1
    });
    

    Calendar.setup({
        inputField     :    "FFIN",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FFIN",  
        singleClick    :    true,
        firstDay       :    1
    });

</script>    
    </body>
</html>