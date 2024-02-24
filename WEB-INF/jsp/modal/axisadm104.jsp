<%-- 
*  Fichero: axisadm104.jsp
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

        function f_onload_axisadm104() {
        				
        	<c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisadm104');
			</c:if>
			revisarEstilos();
			var resultado = '${requestScope.resultado}';
			if (!objUtiles.estaVacio(resultado) && resultado == "0"){
			    parent.f_aceptar_axisadm104();  
			} 
        }
        
                
        function f_but_aceptar() {    
           if (objValidador.validaEntrada()) {
        	  INDICAD = "${__formdata.INDICAD}";
         	//  alert(" INDICAD "+INDICAD); 
              objUtiles.ejecutarFormulario("modal_axisadm104.do?operation=aceptar&INDICAD="+INDICAD, "aceptar",  document.axisadm104Form, "_self", objJsMessages.jslit_cargando);  
             // parent.f_aceptar_axisadm104();
           }
        }
        
        function f_but_cancelar() {        
            revisarEstilos();
            parent.f_cerrar_axisadm104();
        }                
            
        function f_but_salir() {
        	revisarEstilos();
        	parent.f_cerrar_axisadm104();
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
  <body onload="f_onload_axisadm104()">
    <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
      
    <form name="axisadm104Form" action="modal_axisadm104.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CMODO" value="${__formdata.CMODO}"> 
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisadm104" c="formulario" lit="9910612" /></c:param>
            <c:param name="producto"><axis:alt f="axisadm104" c="producto" lit="9910612" /></c:param>
            <c:param name="form">axisadm104</c:param>
        </c:import>


        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="width:95%;height:35%">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                    <table class="seccion">	
                       <tr>
			               <th style="width:33%;height:0px"></th>
			               <th style="width:33%;height:0px"></th>
			               <th style="width:33%;height:0px"></th>
                       </tr>
                       <tr>  
                           
                           <axis:visible f="axisadm104" c="CESVALOR">
                             <td class="titulocaja" id="LIT_CESVALOR" colspan="1">
                               <b><axis:alt f="axisadm104" c="CESVALOR" lit="9910608"/></b>
                             </td>
                           </axis:visible>
                           
                           <axis:visible f="axisadm104" c="NDESDE">
                             <td class="titulocaja" id="LIT_NDESDE" colspan="1">
                               <b><axis:alt f="axisadm104" c="NDESDE" lit="104095"/></b>
                             </td>
                           </axis:visible>  
                           
                           <axis:visible f="axisadm104" c="NHASTA">
                             <td class="titulocaja" id="LIT_NHASTA" colspan="1">
                               <b><axis:alt f="axisadm104" c="NHASTA" lit="103051"/></b>
                             </td>
                           </axis:visible>
                       
                       </tr>
                       <tr> 
                                                      
                           <axis:visible f="axisadm104" c="CESVALOR" >
                               <td class="campocaja" colspan="1">       
                           		<select name="CESVALOR" id="CESVALOR" size="1" class="campowidthselect campo campotexto" style="width:35%;"
                                        title="<axis:alt f="axisadm104" c="CESVALOR" lit="9910608"/>"
                                        <axis:atr f="axisadm104" c="CESVALOR" a="obligatorio=true"/>>&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm104" c="C_CESVALOR" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstEscalaDeRiesgo}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.CESVALOR}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>            
                               </td>
                           </axis:visible> 
                           
                           <axis:visible f="axisadm104" c="NDESDE" >
                              <td class="campocaja" colspan="1">
                                <input type="numeric" class="campowidthinput campo camponumerico" id="NDESDE" name="NDESDE" size="15" 
                                 onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisadm104" c="NDESDE" lit="104095"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>100){alert('<axis:alt f="axisadm104" c="NDESDE" lit="9907684"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}" 
                                 title="<axis:alt f="axisadm104" c="NDESDE" lit="104095"/>" style="width:35%" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${__formdata.NDESDE}"/>"                                 
                                  <axis:atr f="axisadm104" c="NDESDE" a="obligatorio=true"/>/>
                              </td>                                                 
                           </axis:visible>
                           
                           <axis:visible f="axisadm104" c="NHASTA" >
                              <td class="campocaja" colspan="1">
                                <input type="numeric" class="campowidthinput campo camponumerico" id="NHASTA" name="NHASTA" size="15"  
                                 onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico(this.value, true, -1,'<axis:alt f="axisadm104" c="NHASTA" lit="103051"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric(this.value))); if(num>100){alert('<axis:alt f="axisadm104" c="NHASTA" lit="9907684"/>');this.value='';this.focus()}else{this.value=num.toFixed(2).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"        
                                 title="<axis:alt f="axisadm104" c="NHASTA" lit="103051"/>" style="width:35%" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${__formdata.NHASTA}"/>"
                                  <axis:atr f="axisadm104" c="NHASTA" a="obligatorio=true"/>/>
                              </td>                                                 
                           </axis:visible>
                               
                       </tr>  
                    </table>
                </td>
            </tr>
        </table>			

        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm104</c:param><c:param name="f">axisadm104</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
	
        <c:import url="../include/mensajes.jsp" />
</div>
    </body>    

</html>