<%/* Revision:# yllN01ZY3PRrqNN0CI73iA== # */%>
<%-- 
*  Fichero: axisfic007.jsp
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

        function f_onload_axisfic007() {
        				
        	<c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisfic007');
			</c:if>
			revisarEstilos();
			var resultado = '${requestScope.resultado}';
			if (!objUtiles.estaVacio(resultado) && resultado == "0"){
			    parent.f_aceptar_axisfic007(null, null, null);  
			} 
        }
        
                
        function f_but_aceptar() { 
           if (objValidador.validaEntrada()) {
        	   	   	
	        	  // objUtiles.ejecutarFormulario("modal_axisfic007.do", "aceptar",  document.axisfic007Form, "_self", objJsMessages.jslit_cargando);
         	   NCAMPO = '${__formdata.NCAMPO}';
         	   TCAMPO=objDom.getValorPorId("TCAMPO");
         	   parent.f_aceptar_axisfic007(NCAMPO, TCAMPO);
	           }else{
	            	f_but_cancelar();          
               }
        }
        
        function f_but_cancelar() {        
            revisarEstilos();
            parent.f_cerrar_axisfic007();
        }                
            
        function f_but_salir() {
        	revisarEstilos();
        	parent.f_cerrar_axisfic007();
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
  <body onload="f_onload_axisfic007()">
    <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
      
    <form name="axisfic007Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="NCAMPO"  value="${__formdata.NCAMPO}"/>
        <input type="hidden" name="NNOMCAMP"  value="${__formdata.NNOMCAMP}"/>
        <input type="hidden" name="TCAMPO"  value="${__formdata.TCAMPO}"/>

        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisfic007" c="formulario" lit="" /></c:param>
            <c:param name="producto"><axis:alt f="axisfic007" c="producto" lit="" /></c:param>
            <c:param name="form">axisfic007</c:param>
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
                          <c:if test="${!empty __formdata.NNOMCAMP}">
                             <axis:visible f="axisfic007" c="NNOMCAMP">
							     <td class="titulocaja" id="LIT_NNOMCAMP" colspan="1">
							       <b><axis:alt f="axisfic007" c="NNOMCAMP" lit="${__formdata.NNOMCAMP}"/></b>
							     </td>
							 </axis:visible> 
                          </c:if> 
                       </tr>
                       <tr> 
                          <axis:visible f="axisfic007" c="TCAMPO"> 
                          	 <td class="titulocaja" id="LIT_TCAMPO" colspan="1">
                               <textarea rows="25" cols="50" class="campo campotexto" style="width:100%;"  
                                 <c:if test="${__formdata.NCAMPO == 'TCUPOR'}"> readonly="readonly" </c:if> 
                                <axis:atr f="axisfic007" c="TCAMPO" a="modificable=true"/> name="TCAMPO" id="TCAMPO">${__formdata.TCAMPO}</textarea>
                             </td>  
                          </axis:visible>              
                               
                       </tr>   
                    </table>
                </td>
            </tr>
        </table>			
		<!-- IAXIS-4854 -->
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisfic007</c:param><c:param name="f">axisfic007</c:param>
            <c:param name="__botones"><c:if test="${__formdata.NCAMPO != 'TCUPOR'}">cancelar</c:if><axis:visible f="axisfic007" c="BT_ACEPTAR">,aceptar</axis:visible><c:if test="${__formdata.NCAMPO == 'TCUPOR'}">salir</c:if></c:param>
        </c:import>
    </form>
	
        <c:import url="../include/mensajes.jsp" />
</div>
    </body>    

</html>
