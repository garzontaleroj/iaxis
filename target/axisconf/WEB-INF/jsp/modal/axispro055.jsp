<%/* Revision:# 03ie4nU2pkofOdC1HtXFKw== # */%>
<%-- 
*  Fichero: axispro055.jsp
*  @author <a href = "mailto:erhernandez@csi-ti.com">Edgar Hernandez</a>
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="axis.util.Constantes" %>

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

        function f_onload_axispro055() {
        				
        	f_cargar_propiedades_pantalla(); 
        }
        
                
        function f_but_aceptar() {    
           if (objValidador.validaEntrada()) {
        	   objUtiles.ejecutarFormulario("modal_axispro055.do", "aceptar",  document.axispro055Form, "_self", objJsMessages.jslit_cargando);    
           }
        }
                
        function f_but_cancelar() {        
            revisarEstilos();
            parent.f_cerrar_axispro055();
        }                
            
        function f_but_salir() {
        	revisarEstilos();
        	parent.f_cerrar_axispro055();
        }
        
        
        function f_formatdate(entrada,title){
            var jDate = new JsFecha();
            if(entrada.value.length>0){
              entrada.value=jDate.formateaFecha(entrada.value);
                  
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt f="axispro055" c="ALER_ERR" lit="1000421"/>");
                }
            }
        } 
        
        function f_validar_poliza_recibo(){
        	
        	objUtiles.ejecutarFormulario ("modal_axispro055.do?&NPOLIZA="+selectedNPOLIZA+"&NRECIBO="+selectedNRECIBO, "existePolizaRecibo", document.axispro055Form, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_gedox() {
        		var fecha = <%=new java.util.Date().getTime()%>;
        		// INI - IAXIS - 3951 - ML - 07/05/2019 - El tipo debe ser EXC
                objUtiles.abrirModal("axisgedox", "src","modal_axisgedox.do?dt="+fecha+"&operation=form&SEGURO="+document.axispro055Form.SSEGURO.value + "&NMOVIMI=" + document.axispro055Form.NMOVIMI.value+"&TIPO=EXC");
             	// FIN - IAXIS - 3951 - ML - 07/05/2019 - El tipo debe ser EXC
            }   
        
       function f_cerrar_axisgedox() {
                objUtiles.cerrarModal("axisgedox");
       }

    </script>  

  </head>
  <body onload="f_onload_axispro055()">
    <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
    
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisper030" c="MOD_DOCUM" lit="1000431"/></c:param>
                <c:param name="nid" value="axisper030" />
    </c:import> 
      
    <form name="axispro055Form" action="modal_axispro055.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <!-- INI - IAXIS - 3951 - ML - 07/05/2019 - El modo no debe ser hidden -->
        <%-- <input type="hidden" name="CMODO" value="${__formdata.CMODO}"> --%>
        <!-- INI - IAXIS - 3951 - ML - 07/05/2019 - El modo no debe ser hidden --> 
        <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}">
        <input type="hidden" name="NMOVIMI" value="${__formdata.NMOVIMI}">
        <input type="hidden" name="SSEGURO" value="${__formdata.SSEGURO}">
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axispro055" c="formulario" lit="9909976" /></c:param>
            <c:param name="producto"><axis:alt f="axispro055" c="producto" lit="9909976" /></c:param>
            <c:param name="form">axispro055</c:param>
        </c:import>
		
		<c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr019|<axis:alt f="axisctr020" c="MOD_PANT_AXICTR019" lit="1000188"/>#axisimprimir|<axis:alt f="axisctr020" c="MOD_PANT_IMPRIMIR" lit="1000205"/>|true#axisgedox|<axis:alt f="${pantalla}" c="LIT_GEDOX" lit="1000201"></axis:alt>#axisctr023|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR023" lit="1000191"/>#axisctr025|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR025" lit="140360"/>#axisctr029|<axis:alt f="${pantalla}" c="LIT_PANTALLA_DETASE" lit="1000195"/>#axisctr148|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR148" lit="1000199"/>#axisctr030|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR030" lit="1000196"/>#axisctr039|Suplementos#axisadm028|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISADM028" lit="1000568"/>#axisopenurl||<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISOPENURL" lit="1000568"/></c:param>
        </c:import>


        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="width:95%;height:35%">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                    <table class="seccion">	
                       <tr>
			               <th style="width:25%;height:0px"></th>
			               <th style="width:25%;height:0px"></th>
			               <th style="width:25%;height:0px"></th>
			               <th style="width:25%;height:0px"></th>
                       </tr>
                       <tr>  
                           
                           <axis:visible f="axispro055" c="NPOLIZA">
                             <td class="titulocaja" id="LIT_NPOLIZA" colspan="1">
                               <b><axis:alt f="axispro055" c="NPOLIZA" lit="9903659"/></b>
                             </td>
                            </axis:visible> 
                            
                            <axis:visible f="axispro055" c="NRECIBO">
                             <td class="titulocaja" id="LIT_NRECIBO" colspan="1">
                               <b><axis:alt f="axispro055" c="NRECIBO" lit="100895"/></b>
                             </td>
                            </axis:visible> 
                            
                            <axis:visible f="axispro055" c="COBSERVEXC">
                             <td class="titulocaja" id="LIT_COBSERVEXC" colspan="2">
                               <b><axis:alt f="axispro055" c="COBSERVEXC" lit="9909972"/></b>
                             </td>
                            </axis:visible>  
                           
                           
                           
                       </tr>
                       <tr> 
                           
                            <axis:visible f="axispro055" c="NPOLIZA" >
                           		<td class="campocaja" colspan="1">
                                 <input type="text" class="campowidthinput campo campotexto" 
                                 		value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" style="width:90%;"
                                        title="<axis:alt f="axispro055" c="lit_100895" lit="100895"/>"
                                         <axis:atr f="axispro055" c="NPOLIZA" a="obligatorio=true"/>/>        
                               </td>
                            </axis:visible> 
                            
                            <axis:visible f="axispro055" c="NRECIBO" >
                           		<td class="campocaja" colspan="1">
                                 <input type="text" class="campowidthinput campo campotexto"  
                                 		value="${__formdata.NRECIBO}" name="NRECIBO" id="NRECIBO" style="width:90%;"
                                        title="<axis:alt f="axispro055" c="lit_9903659" lit="9903659"/>"
                                        <axis:atr f="axispro055" c="NRECIBO" a="obligatorio=true"/>/>        
                               </td>
                            </axis:visible>
                            
                            <axis:visible f="axispro055" c="COBSERVEXC" >
                           		<td class="campocaja" colspan="2">
                                 <input type="text" class="campowidthinput campo campotexto" 
                                 		value="${__formdata.COBSERVEXC}" name="COBSERVEXC" id="COBSERVEXC" style="width:90%;"
                                        title="<axis:alt f="axispro055" c="lit_9909972" lit="9909972"/>"/>        
                               </td>
                            </axis:visible>
                               
                       </tr>  
                       <tr>         
                       	    
                       	    <axis:visible f="axispro055" c="CPROVISI">
                             <td class="titulocaja" id="LIT_CPROVISI" colspan="1">
                               <b><axis:alt f="axispro055" c="CPROVISI" lit="9909973"/></b>
                             </td>
                            </axis:visible> 
                           
                           <axis:visible f="axispro055" c="COBSERVP">
                             <td class="titulocaja" id="LIT_COBSERVP" colspan="2">
                               <b><axis:alt f="axispro055" c="COBSERVP" lit="9909975"/></b>
                             </td>
                           </axis:visible>      
                          
                       
                       </tr>
                       <tr> 
                           
                           <axis:visible f="axispro055" c="CPROVISI" >
                               <td class="campocaja" colspan="1">       
                           		<select name="CPROVISI" id="CPROVISI" size="1" class="campowidthselect campo campotexto" style="width:35%;"
                                        title="<axis:alt f="axispro055" c="CPROVISI" lit="9909973"/>">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro055" c="C_CPROVISI" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstSeProvisiona}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.CPROVISI}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>            
                               </td>
                           </axis:visible> 
                           
                           <axis:visible f="axispro055" c="COBSERVP" >
                           		<td class="campocaja" colspan="2">
                                 <input type="text" class="campowidthinput campo campotexto" 
                                 		value="${__formdata.COBSERVP}" name="COBSERVP" id="COBSERVP" style="width:90%;"
                                        title="<axis:alt f="axispro055" c="lit_9909975" lit="9909975"/>"/>        
                               </td>
                           </axis:visible>  
                           
                           <axis:visible f="axispro055" c="CANIADIROP"> 
								<td class="campocaja" colspan="1">
				                    <input type="button" class="boton" id="CANIADIROP" 
				                         value="<axis:alt f="axispro055" c="BT_ANIADIROP" 
				                         lit="9902032"></axis:alt>" onclick="f_but_gedox()" />
				                <td>
				            </axis:visible>
                          
                               
                       </tr> 
                       <tr>
                       
                       		<axis:visible f="axispro055" c="CNPROVISI">
                             <td class="titulocaja" id="LIT_CNPROVISI" colspan="1">
                               <b><axis:alt f="axispro055" c="CNPROVISI" lit="9909974"/></b>
                             </td>
                           </axis:visible> 
                           
                           <axis:visible f="axispro055" c="COBSERVNP">
                             <td class="titulocaja" id="LIT_COBSERVNP" colspan="2">
                               <b><axis:alt f="axispro055" c="COBSERVNP" lit="9909975"/></b>
                             </td>
                           </axis:visible>     
                          
                           
                       </tr>
                       <tr> 
                           
                           <axis:visible f="axispro055" c="CNPROVISI" >
                               <td class="campocaja" colspan="1">       
                           		<select name="CNPROVISI" id="CNPROVISI" size="1" class="campowidthselect campo campotexto" style="width:35%;"
                                        title="<axis:alt f="axispro055" c="CNPROVISI" lit="9909974"/>">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispro055" c="C_CNPROVISI" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstNoSeProvisiona}">
                                    	<!--INI - IAXIS - 3951 - ML - 07/05/2019 - Validacion ternaria para establecer otros por defecto-->
                                        <option value = "${element.CATRIBU}" 
                                        ${__formdata.CNPROVISI == null ? (element.CATRIBU == 4 ? " selected": "") : (element.CATRIBU == __formdata.CNPROVISI ? " selected":"")} />                                        	
                                            ${element.TATRIBU} 
                                        </option>
                                        <!--INI - IAXIS - 3951 - ML - 07/05/2019 - Validacion ternaria para establecer otros por defecto-->
                                    </c:forEach>
                                </select>            
                               </td>
                           </axis:visible> 
                           
                           <axis:visible f="axispro055" c="COBSERVNP" >
                           		<td class="campocaja" colspan="2">
                                 <input type="text" class="campowidthinput campo campotexto" 
                                 		value="${__formdata.COBSERVNP}" name="COBSERVNP" id="COBSERVNP" style="width:90%;"
                                        title="<axis:alt f="axispro055" c="lit_9909975" lit="9909975"/>"/>        
                               </td>
                           </axis:visible> 
                           
                           <axis:visible f="axispro055" c="CANIADIRONP"> 
								<td class="campocaja" colspan="1">
				                    <input type="button" class="boton" id="CANIADIRONP" 
				                         value="<axis:alt f="axispro055" c="BT_ANIADIRONP" 
				                         lit="9902032"></axis:alt>" onclick="f_but_gedox()" />
				                <td>
				            </axis:visible>
                           
                       </tr> 
                       <tr>    
                       
                           <axis:visible f="axispro055" c="FALTA">
                             <td class="titulocaja" id="LIT_FALTA" colspan="1">
                               <b><axis:alt f="axispro055" c="FALTA" lit="9001192"/></b>
                             </td>
                           </axis:visible>  
                           
                           <axis:visible f="axispro055" c="FBAJA">
                             <td class="titulocaja" id="LIT_FBAJA" colspan="1">
                               <b><axis:alt f="axispro055" c="FBAJA" lit="9001510"/></b>
                             </td>
                           </axis:visible> 
                           
                        </tr>
                        <tr>
                            
                           <axis:visible f="axispro055" c="FALTA" >
                               <td class="campocaja" colspan="1">
                                  <input type="text" 
                                  		 onblur="javascript:f_formatdate(this,'')" formato="fecha"   
                                  		 alt="<axis:alt f="axispro055" c="FALTA" lit="9001192"/>" title="<axis:alt f="axispro055" c="FALTA" lit="9001192"/>"
                                         name="FALTA" id="FALTA"  value="<fmt:formatDate value="${__formdata.FALTA}" pattern="dd/MM/yyyy" />" style="width:35%;" class="campowidthinput campo campotexto_ob"/>
                                           <axis:visible c="ICO_FALTA" f="axispro055">
                                                <a id="icon_FALTA" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axispro055" c="SELECT" lit="108341"/>" title="<axis:alt f="axispro055" c="ICO_FALTA" lit="9001192" />" src="images/calendar.gif"/></a>
                                  </axis:visible>
                               </td>
                           </axis:visible>  
                            
                            
                            
                           <axis:visible f="axispro055" c="FBAJA" >
                               <td class="campocaja" colspan="1">
                                  <input type="text" 
                                  		 onblur="javascript:f_formatdate(this,'')" formato="fecha"  <axis:atr f="axispro055" c="FBAJA" a="modificable=true&isInputText=true&obligatorio=true"/> 
                                  		 alt="<axis:alt f="axispro055" c="FBAJA" lit="9001510"/>" title="<axis:alt f="axispro055" c="FBAJA" lit="9001510"/>"
                                         name="FBAJA" id="FBAJA"  value="<fmt:formatDate value="${__formdata.FBAJA}" pattern="dd/MM/yyyy" />" style="width:35%;" class="campowidthinput campo campotexto_ob"/>
                                           <axis:visible c="ICO_FBAJA" f="axispro055">
                                                <a id="icon_FBAJA" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axispro055" c="SELECT" lit="108341"/>" title="<axis:alt f="axispro055" c="ICO_FBAJA" lit="9001510" />" src="images/calendar.gif"/></a>
                                  </axis:visible>
                               </td>
                           </axis:visible> 
                           
                          
                       </tr>

                    </table>
                </td>
            </tr>
        </table>			

        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axispro055</c:param><c:param name="f">axispro055</c:param>
            <c:param name="__botones">salir,aceptar</c:param>
        </c:import>
    </form>
		
	<script type="text/javascript">
		Calendar.setup({
			inputField     :    "FALTA",
			ifFormat       :    "%d/%m/%Y",
			button         :    "icon_FALTA", 
			singleClick    :    true,
			firstDay       :    1
		});	
	</script>
	
	<script type="text/javascript">
		Calendar.setup({
			inputField     :    "FBAJA",
			ifFormat       :    "%d/%m/%Y",
			button         :    "icon_FBAJA", 
			singleClick    :    true,
			firstDay       :    1
		});
	</script>
	
        <c:import url="../include/mensajes.jsp" />
</div>
    </body>    

</html>