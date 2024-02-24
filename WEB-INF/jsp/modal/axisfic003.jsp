<%/* Revision:# mc08EdjVrAxKfO37fYYy0w== # */%>
<%-- 
*  Fichero: axisfic003.jsp
*  @author <a href = "mailto:erhernandez@csi-ti.com">Edgar HernAndez</a>
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
      <!-- Idioma del calendario, en función del Locale -->
      <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
      <!-- Setup del calendario -->
      <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** --> 


    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload_axisfic003() {
        				
        	<c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisfic003');
			</c:if>
			revisarEstilos();
			var resultado = '${requestScope.resultado}';
			if (!objUtiles.estaVacio(resultado) && resultado == "0"){
			    parent.f_aceptar_axisfic003();  
			} 
        }
        
                
        function f_but_aceptar() {    
           if (objValidador.validaEntrada()) {
        	   formdataCMODO = '${__formdata.CMODO}';
	           if (!objUtiles.estaVacio(formdataCMODO) && formdataCMODO != "1"){
                 objUtiles.ejecutarFormulario("modal_axisfic003.do", "aceptar",  document.axisfic003Form, "_self", objJsMessages.jslit_cargando);
	           }else{
	            	f_but_cancelar();
	           }    
           }
        }
        
        function f_but_cancelar() {        
            revisarEstilos();
            parent.f_cerrar_axisfic003();
        }                
            
        function f_but_salir() {
        	revisarEstilos();
        	parent.f_cerrar_axisfic003();
        }
        
        
        function f_formatdate(entrada,title){
            var jDate = new JsFecha();
            if(entrada.value.length>0){
              entrada.value=jDate.formateaFecha(entrada.value);
                  
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt f="axisfic002" c="ALER_ERR" lit="1000421"/>");
                }
            }
        } 
        
        
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        
        

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
                
        
        
        
        
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
  <body onload="f_onload_axisfic003()">
    <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
      
    <form name="axisfic003Form" action="modal_axisfic003.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SFINANCI"  value="${__formdata.SFINANCI}"/>
        <input type="hidden" name="SPERSON"  value="${__formdata.SPERSON}"/>
        <input type="hidden" name="CMODO" value="${__formdata.CMODO}"> 
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisfic003" c="formulario" lit="9909072" /></c:param>
            <c:param name="producto"><axis:alt f="axisfic003" c="producto" lit="9909072" /></c:param>
            <c:param name="form">axisfic003</c:param>
        </c:import>


        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="width:95%;height:35%">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                    <table class="seccion">	
                       <tr>
			               <th style="width:100%;height:0px"></th>
                       </tr>
                       <tr>  
                           
                           <axis:visible f="axisfic003" c="FCORTE">
                             <td class="titulocaja" id="LIT_FCORTE" colspan="1">
                               <b><axis:alt f="axisfic003" c="FCORTE" lit="9909076"/></b>
                             </td>
                           </axis:visible>   
                       
                       </tr>
                       <tr> 
                           
                           <axis:visible f="axisfic003" c="FCORTE" >
                               <td class="campocaja" colspan="1">
                                <!-- POST-123 -->
                                  <input type="text" <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>
                                  		 onblur="javascript:f_formatdate(this,'')" formato="fecha" <axis:atr f="axisfic003" c="FCORTE" a="modificable=true&isInputText=true&obligatorio=true"/>  alt="<axis:alt f="axisfic003" c="FCORTE" lit="9909076"/>" title="<axis:alt f="axisfic003" c="FCORTE" lit="9909076"/>"
                                         name="FCORTE" id="FCORTE"  value="<fmt:formatDate value="${__formdata.FCORTE}" pattern="dd/MM/yyyy" />" style="width:35%;" class="campowidthinput campo campotexto_ob"/>
                                           <axis:visible c="ICO_FCORTE" f="axisfic003">
                                                <a id="icon_FCORTE" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisfic003" c="SELECT" lit="108341"/>" title="<axis:alt f="axisfic003" c="ICO_FCORTE" lit="9909076" />" src="images/calendar.gif"/></a>
                                  </axis:visible>
                               </td>
                           </axis:visible> 
                               
                       </tr>  
                       <tr>         
                       	     
                           <axis:visible f="axisfic003" c="CESVALOR">
                             <td class="titulocaja" id="LIT_CESVALOR" colspan="1">
                               <b><axis:alt f="axisfic003" c="CESVALOR" lit="9909073"/></b>
                             </td>
                           </axis:visible> 
                       
                       </tr>
                       <tr> 
                            
                           <axis:visible f="axisfic003" c="CESVALOR" >
                               <td class="campocaja" colspan="1">       
                           		<select name="CESVALOR" id="CESVALOR" size="1" class="campowidthselect campo campotexto" style="width:35%;"
                                        title="<axis:alt f="axisfic003" c="CESVALOR" lit="9909073"/>"
                                        <axis:atr f="axisfic003" c="CESVALOR" a="obligatorio=true"/>
                                        <%-- <c:if test="${__formdata.CMODO == '1'}"> disabled="disabled" </c:if> --%>>&nbsp; <!-- POST-123 -->
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfic003" c="C_CESVALOR" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstEsValores}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.CESVALOR}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>            
                               </td>
                           </axis:visible> 
                               
                       </tr> 
                       <tr>
                           
                           <axis:visible f="axisfic003" c="IPATRILIQ">
                             <td class="titulocaja" id="LIT_IPATRILIQ" colspan="1">
                               <b><axis:alt f="axisfic003" c="IPATRILIQ" lit="9909074"/></b>
                             </td>
                           </axis:visible> 
                           
                       </tr>
                       <tr> 
                           
                           <axis:visible f="axisfic003" c="IPATRILIQ" >
                              <td class="campocaja" colspan="1">
                               <!-- POST-123 -->
                                <input type="numeric" class="campowidthinput campo camponumerico" id="IPATRILIQ" name="IPATRILIQ" size="15"
                                 <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>   
                                 title="<axis:alt f="axisfic003" c="IPATRILIQ" lit="9909074"/>" style="width:35%" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${__formdata.IPATRILIQ}"/>"
                                 
                                  <axis:atr f="axisfic003" c="IPATRILIQ" a="obligatorio=true"/>/>
                              </td>                                                 
                           </axis:visible>
                           
                       </tr> 
                       <tr>    
                       
                           <axis:visible f="axisfic003" c="IRENTA">
                             <td class="titulocaja" id="LIT_IRENTA" colspan="1">
                               <b><axis:alt f="axisfic003" c="IRENTA" lit="9909075"/></b>
                             </td>
                           </axis:visible>
                       
                       </tr>
                       <tr> 
                           
                           <axis:visible f="axisfic003" c="IRENTA" >
                              <td class="campocaja" colspan="1">
                               <!-- POST-123 -->
                                <input type="numeric" class="campowidthinput campo camponumerico" id="IRENTA" name="IRENTA" size="15"
                                 <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>          
                                 title="<axis:alt f="axisfic003" c="IRENTA" lit="9909075"/>" style="width:35%" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${__formdata.IRENTA}"/>"
                                  <axis:atr f="axisfic003" c="IRENTA" a="obligatorio=true"/>/>
                              </td>                                                 
                           </axis:visible>
                                        
                        </tr> 
                    </table>
                </td>
            </tr>
        </table>			

<!-- POST-123 -->
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisfic003</c:param><c:param name="f">axisfic003</c:param>            
            <%-- <c:param name="__botones"><c:if test="${__formdata.CMODO != 1}"> cancelar,aceptar,</c:if><c:if test="${__formdata.CMODO == 1}">salir</c:if> </c:param>--%>
            <c:param name="__botones">cancelar,aceptar,salir</c:param>
        </c:import>
    </form>
	
	<%-- <c:if test="${__formdata.CMODO != '1'}"> --%> 
		<script type="text/javascript">
			Calendar.setup({
				inputField     :    "FCORTE",
				ifFormat       :    "%d/%m/%Y",
				button         :    "icon_FCORTE", 
				singleClick    :    true,
				firstDay       :    1
			});
			
		</script>
	<%-- </c:if> --%> <!-- POST-123 -->

        <c:import url="../include/mensajes.jsp" />
</div>
    </body>    

</html>