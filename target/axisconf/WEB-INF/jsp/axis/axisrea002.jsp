<%/* Revision:# bbik5+wS4LkFr+s0W9nnXQ== # */%>
<%/**
*  Fichero: axisrea002.jsp
*  Pantalla Detalle Contrato Reaseguro
*  @author <a href = "mailto:jtorres@csi-ti.com">Jorge Torres</a>  
*  Fecha: 29/10/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<style type="text/css">


.seccion_informacion1{
    border: 1px solid #006000;
    background-color:#ffffff; 
    border-top-width: 2px; 
    border-right-width: 2px;
    border-bottom-width: 2px; 
    border-left-width:2px; 
    position:absolute;
    width:800px; 
    height:405px;
    top:1;
    left:75px;
    visibility:hidden;
    z-index:9999999;
    
}


.seccion_informacion2{
    border: 1px solid #006000;
    background-color:#ffffff; 
    border-top-width: 2px; 
    border-right-width: 2px;
    border-bottom-width: 2px; 
    border-left-width:2px; 
    position:absolute;
    width:800px; 
    height:80px;
    top:1;
    left:75px;
    visibility:hidden;
    z-index:9999999;
    
}


</style>

<html>
    <head>
        <title><axis:alt f="axisrea002" c="LIT_NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {    
               f_cargar_propiedades_pantalla();
               var numContrato = 0;
               <c:if test="${! empty __formdata.SCONTRA}">numContrato=${__formdata.SCONTRA};</c:if>              
               if (numContrato == 0 || document.miForm.NOU.value == 1) {   
                
                  f_abrir_axisrea001();
                 
               }
               
               <c:if test="${! empty __formdata.SCONTRA_ON}">
                    f_abrir_axisrea001_contrato('${__formdata.SCONTRA_ON}');
               </c:if>    
               
               objEstilos.toggleDisplay('contratos', document.getElementById('contratos_parent'));               
               objEstilos.toggleDisplay('tramos', document.getElementById('tramos_parent'));
               objEstilos.toggleDisplay('cuadroces', document.getElementById('cuadroces_parent'));   
               objEstilos.toggleDisplay('tramosinbono', document.getElementById('tramosinbono_parent'));   
               
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisrea002", "cancelar", document.miForm, "_self");
            }
            
             function f_but_editar(NACCION) { // EDBR - IAXIS4529 - 28/06/2019 - se agrega parametro a la funcion para determinar si es edicion (NULL) o nueva version (1)
			 
			 //INI -  EDBR - IAXIS4529 - 28/06/2019 - se agrega variable y condicion para determinar si es edicion o nueva version
            	 var parNVERSIO = objUtiles.f_GuardaCasillasChecked("radioNVERSIO");
	           	 if (NACCION>0){           		 
	           		parNVERSIO = null;	           		
	           }
	           //INI -  EDBR - IAXIS4529 - 28/06/2019 - se agrega variable y condicion para determinar si es edicion o nueva version
             
			 
                var PERMITE_EDICION = '${requestScope.OB_IAX_CODICONTRATO_REA.CVALID}';   //1: No se puede modificar, porque lo hemos validado, y ha de ser procesado por el proceso batch
                if(PERMITE_EDICION!=null && PERMITE_EDICION!='1'){
                    f_cerrar_axisrea001();
                    var param = "SCONTRA_MOD="+objDom.getValorPorId("SCONTRA_AUX")+"&NVERSIO="+parNVERSIO; // EDBR - IAXIS4529 - 26/06/2019 - se agrega parametro NVERSIO para la edicion del contrato;
                    //alert(param);
                    objUtiles.ejecutarFormulario("axis_axisrea003.do?" + param, "ModificarContrato", document.miForm, "_self", objJsMessages.jslit_cargando);             
                }else{
                    alert("<axis:alt f="axisrea005" c="LIT_CCOMPANI" lit="9902171"/>");
                }
            }
            
            /****************************************************************************************/
            /********************************** MODAL AXPLANTILLAJSP_MODAL **************************/
            /****************************************************************************************/
            var ptho=null;
            function f_abrir_axisrea001() {
                
                objUtiles.abrirModal("axisrea001", "src", "modal_axisrea001.do?operation=form");  
            }
            
             function f_abrir_axisrea001_contrato(SCONTRA) {
                //alert(SCONTRA);
                objUtiles.abrirModal("axisrea001", "src", "modal_axisrea001.do?operation=form&SCONTRA="+SCONTRA);  
            }
            
            function f_cerrar_axisrea001() {
                objUtiles.cerrarModal('axisrea001');
                
            }   
            
            function f_nuevo_axisrea003(pNUEVO) {                     
                document.miForm.NOU.value = pNUEVO;
                f_cerrar_axisrea001();               
                document.miForm.FCONINI.value = "";
                document.miForm.FCONFIN.value = "";
                document.miForm.TCONTRA.value = "";              
                document.miForm.SCONQP.value = "";
                document.miForm.PCEDIDO.value = "";
                document.miForm.ICAPACI.value = "";
                document.miForm.TOBSERV.value = "";
                document.miForm.ISUBLIMITE.value = "";
              
                objUtiles.ejecutarFormulario("axis_axisrea003.do", "BorrarObjCache", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_axisrea001(pSCONTRA) {
               document.miForm.SCONTRA_AUX.value = pSCONTRA;
               f_cerrar_axisrea001();           
               objUtiles.ejecutarFormulario("axis_axisrea002.do?SCONTRA="+document.miForm.SCONTRA_AUX.value+"&obtenerDatos=0", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_seleccionar_version() {
                objUtiles.ejecutarFormulario("axis_axisrea002.do?SCONTRA="+document.miForm.SCONTRA_AUX.value+"&NVERSIO="+objUtiles.f_GuardaCasillasChecked("radioNVERSIO")+"&obtenerDatos=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_seleccionar_tramo() {
                objUtiles.ejecutarFormulario("axis_axisrea002.do?SCONTRA="+document.miForm.SCONTRA_AUX.value+"&NVERSIO="+objUtiles.f_GuardaCasillasChecked("radioNVERSIO")+"&CTRAMO="+objUtiles.f_GuardaCasillasChecked("radioCTRAMO")+"&obtenerDatos=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando);

            }
			
			// INI - ML- 4559 - FUNCTION PARA ACTIVAR CONTRATO
            function f_but_9000656() {
            	objUtiles.ejecutarFormulario("axis_axisrea002.do?SCONTRA="+document.miForm.SCONTRA_AUX.value, "activar", document.miForm, "_self", objJsMessages.jslit_cargando);            	
            }
            // FIN - ML- 4559 - FUNCTION PARA ACTIVAR CONTRATO
         
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            // TODO Implementar CallBack Ajax
            
            
         /* ********************************************************************************************************* */
         /* *********************************** OCULTAR/MOSTRAR  SECCIONES ****************************************** */
         /* ********************************************************************************************************* */
         
function mostrar(nombreCapa,nombreDIV){ 
  objUtiles.scrollPoll(nombreCapa,nombreDIV);
} 

function ocultar(nombreCapa){             
    document.getElementById(nombreCapa).style.visibility="hidden"; 
} 
         /* ********************************************************************************************************* */
         /* ********************************************************************************************************* */
         /* ********************************************************************************************************* */
         <%/*BRSP*/%>
          function f_but_gedox(CCOMPANI) {              
              objUtiles.abrirModal("axisgedox", "src","modal_axisgedox.do?dt="+document.miForm.DTGDOC.value+"&operation=form&CCOMPANI="+CCOMPANI);
          }   
          function f_cerrar_axisgedox() {
              objUtiles.cerrarModal("axisgedox");
          }
          <%/*BRSP*/%>     
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
        <% /*BRSP*/%>
        <input type="hidden" id="DTGDOC" name="DTGDOC" value="<%=new java.util.Date().getTime()%>"/> 
        <% /*BRSP*/%>
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" id="NOU" name="NOU" value="${__formdata.NOU}"/> 
            <input type="hidden" id="CEMPRES" name="CEMPRES" value="${__formdata.CEMPRES}"/> 
            <input type="hidden" id="CTIPREA" name="CTIPREA" value="${requestScope.OB_IAX_CODICONTRATO_REA.CTIPREA}"/> 
         <!-- Pantalla modal -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea001|<axis:alt f="axisrea002" c="LIT_MODAL_AXISREA001" lit="9000575" /></c:param>
            </c:import>
 			<%/*BRSP*/ %>        
                    
	        <c:import url="../include/modal_estandar.jsp">
				<c:param name="titulo">
					<axis:alt f="axisrea002" c="TITULO" lit="1000614" />
				</c:param>
				<c:param name="nid" value="axisgedox" />
			</c:import>
	        <%/*BRSP*/ %>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisrea002" c="LIT_NOMBRE_FOMRULARIO" lit="9000576" /></c:param>
                   <%--bug:26133 2013/02/19 amj 0026133: LCOL_A002- QT 504-515 - Dar nombre a pantallas --%>
                     <%--bug:26133 2013/02/19 amj nota: 141357 se cambia literal 9000576--%>
                   <c:param name="producto"><axis:alt f="axisrea002" c="PRODUCTO" lit="9905217"/></c:param>
                <c:param name="form">axisrea002</c:param>
            </c:import>
           
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>
               
                  <div class="titulo">&nbsp;<axis:alt f="axisrea002" c="LIT_TIT_DATOS_GENERALES" lit="9001754" />&nbsp;<axis:alt f="axisrea002" c="LIT_TIT_DATOS_GENERALES_CONTRA" lit="104813" />&nbsp;
                    <img src="images/flecha.gif"/>
                    <c:if test="${! empty requestScope.OB_IAX_CODICONTRATO_REA.SCONTRA}"><b>${requestScope.OB_IAX_CODICONTRATO_REA.SCONTRA} - ${requestScope.OB_IAX_CODICONTRATO_REA.TTIPREA} - ${requestScope.OB_IAX_CODICONTRATO_REA.TPRODUC}</b></c:if>
                    <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisrea002" c="LIT_IMG_BUSCAR" lit="100002" />" onclick="f_abrir_axisrea001();" style="cursor:pointer"/>
                        
                  </div>
                  <!-- Detalle cabecera de contrato -->
                  <table class="seccion">
                    <tr>
                  
                      <td> 
                        <!-- Campos detalle de cabecera de contrato _ Area 1 _ -->
                        <table class="area" align="center">
                          <tr> <!-- Se establecen las columnas -->
                            <th style="width:33%;height:0px">
                        &nbsp;
                      </th>
                            <th style="width:33%;height:0px">
                        &nbsp;
                      </th>
                            <th style="width:33%;height:0px">
                        &nbsp;
                      </th>
                          </tr>
                          <tr> <!-- Area 1. Línea 1. Títulos de campos -->
                          <axis:visible f="axisrea002" c="SCONTRA">
                            <td class="titulocaja" ><!--NUM CONTRATO -->
                              <b><axis:alt f="axisrea002" c="LIT_SCONTRA" lit="9000536"/></b>
                            </td>
                          </axis:visible>  
                          <axis:visible f="axisrea002" c="TTIPREA">
                            <td class="titulocaja" ><!--TTIPREA -->
                              <b><axis:alt f="axisrea002" c="LIT_TTIPREA" lit="9902261"/></b>
                            </td>
                          </axis:visible>  
                          <axis:visible f="axisrea002" c="CEMPRES">
                            <td class="titulocaja" ><!--TEMPRES -->
                              <b><axis:alt f="axisrea002" c="LIT_CEMPRES" lit="101619"/></b>
                            </td>
                          </axis:visible>  
                          </tr>
                          <tr> <!-- Area 1. Línea 1. Valores de campos -->
                            <axis:visible f="axisrea002" c="SCONTRA"> <!-- Linia 1. Columna 1. -->
                              <td class="campocaja"> <%-- NUM CONTRATO --%>  
                                <input type="text" class="campo campotexto" id="SCONTRA_AUX" name="SCONTRA_AUX" size="5" style="width:25%"
                                value="${requestScope.OB_IAX_CODICONTRATO_REA.SCONTRA}" <axis:atr f="axisrea002" c="SCONTRA" a="modificable=false"/>/>    
                              </td>
                            </axis:visible>
                            <axis:visible f="axisrea002" c="TTIPREA"> <!-- Linia 1. Columna 2. -->   
                              <td class="campocaja"> <%-- TTIPREA --%>
                               <input type="text" class="campo campotexto" id="TTIPREA" name="TTIPREA" style="width:80%"
                                value="${requestScope.OB_IAX_CODICONTRATO_REA.TTIPREA}" <axis:atr f="axisrea002" c="TTIPREA" a="modificable=false"/>/>
                              </td>
                            </axis:visible>                         
                            <axis:visible f="axisrea002" c="CEMPRES"> <!-- Linia 1. Columna 3. -->   
	                            <td class="campocaja"> <%-- TEMPRES --%>
	                                <!--input type="text" class="campo campotexto" id="CEMPRES" name="CEMPRES" style="width:10%"
	                                value="${requestScope.OB_IAX_CODICONTRATO_REA.CEMPRES}" <axis:atr f="axisrea002" c="CEMPRES" a="modificable=false&obligatorio=true"/>/-->
                                <input type="text" class="campo campotexto" id="TEMPRES" name="TEMPRES" style="width:80%"
                                value="${requestScope.OB_IAX_CODICONTRATO_REA.TEMPRES}" <axis:atr f="axisrea002" c="TEMPRES" a="modificable=false"/>/>
                                </td>
                            </axis:visible>    
                          </tr>
                          <tr>
                            <axis:ocultar f="axisrea002" c="TMONEDA" dejarHueco="false">                            
                                    <td class="titulocaja" colspan="1" ><!--CMONEDA -->
                                      <b id="label_TMONEDA"><axis:alt f="axisrea002" c="LIT_CMONEDA" lit="108645"/></b>
                                    </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisrea002" c="TDESCRIPCION" dejarHueco="false">
                                    <td class="titulocaja" colspan="2" ><!--TDESCRIPCION -->
                                      <b><axis:alt f="axisrea002" c="LIT_TDESCRIPCION" lit="100588"/></b>
                                    </td>                            
                            </axis:ocultar>
                          </tr>
                          <tr>
                             <axis:visible f="axisrea002" c="TMONEDA"> <!-- Linia 1. Columna 3. -->
                              <td class="campocaja"> <%-- TMONEDA --%>
                                <input type="text" class="campo campotexto" id="TMONEDA" name="TMONEDA" style="width:80%"
                                value="${requestScope.OB_IAX_CODICONTRATO_REA.TMONEDA}" <axis:atr f="axisrea002" c="TMONEDA" a="modificable=false"/>/>
                              </td>
                             </axis:visible>
                             <axis:visible f="axisrea002" c="TDESCRIPCION"> <!-- Linia 1. Columna 3. --> 
                               <td class="campocaja" colspan="2"> <%-- TDESCRIPCION --%>    
	                               <input type="text" class="campo campotexto" id="TDESCRIPCION" name="TDESCRIPCION" style="width:80%"
	                                value="${requestScope.OB_IAX_CODICONTRATO_REA.TDESCRIPCION}" <axis:atr f="axisrea002" c="TDESCRIPCION" a="modificable=false"/>/>
	                           </td>     
                             </axis:visible>    
                          </tr>
                          <tr> <!-- Area 1. Línea 2. Valores de campos -->
                            <!-- INI - CJAD - 21/JUNIO2019 - IAXIS4427 - Cambio de producto a ramo -->
                            <axis:visible f="axisrea002" c="TRAMO">
                            <td class="titulocaja" ><!--RAMO -->
                              <b><axis:alt f="axisrea002" c="LIT_TRAMO" lit="100784"/></b>
                            </td>
                            </axis:visible>
                           	<!-- FIN - CJAD - 21/JUNIO2019 - IAXIS4427 - Cambio de producto a ramo -->
                            <axis:visible f="axisrea002" c="ACTIVIDAD">
                            <td class="titulocaja" ><!--ACTIVIDAD -->
                              <b><axis:alt f="axisrea002" c="LIT_ACTIVIDAD" lit="103481"/></b>
                            </td>
                            </axis:visible>
                            <axis:visible f="axisrea002" c="GARANTIA">
                            <td class="titulocaja" ><!--GARANTIA -->
                              <b><axis:alt f="axisrea002" c="LIT_GARANTIA" lit="100561"/></b>
                            </td>
                            </axis:visible>
                          </tr>
                          <tr> <!-- Area 1. Línea 2. Valores de campos -->
                              <axis:visible f="axisrea002" c="TPRODUC"> <!-- Linia 2. Columna 1. -->
                               <td class="campocaja"> <%-- PRODUCTO --%>
                                <!-- CRAMO -->
                                <!--input type="text" class="campo campotexto" id="CRAMO" name="CRAMO" size="5" style="width:5%"
                                value="${requestScope.OB_IAX_CODICONTRATO_REA.CRAMO}" <axis:atr f="axisrea002" c="CRAMO" a="modificable=false&obligatorio=true"/>/-->
                                <!-- CMODALI -->
                                <!--input type="text" class="campo campotexto" id="CMODALI" name="CMODALI" size="5" style="width:5%"
                                value="${requestScope.OB_IAX_CODICONTRATO_REA.CMODALI}" <axis:atr f="axisrea002" c="CMODALI" a="modificable=false&obligatorio=true"/>/-->
                                <!-- CTIPSEG -->
                                <!--input type="text" class="campo campotexto" id="CTIPSEG" name="CTIPSEG" size="5" style="width:5%"
                                value="${requestScope.OB_IAX_CODICONTRATO_REA.CTIPSEG}" <axis:atr f="axisrea002" c="CTIPSEG" a="modificable=false&obligatorio=true"/>/-->
                                <!-- CCOLECT -->
                                <!--input type="text" class="campo campotexto" id="CCOLECT" name="CCOLECT" size="5" style="width:5%"
                                value="${requestScope.OB_IAX_CODICONTRATO_REA.CCOLECT}" <axis:atr f="axisrea002" c="CCOLECT" a="modificable=false&obligatorio=true"/>/-->
                                <!-- TSPRODUC -->
                                <input type="text" class="campo campotexto" id="TPRODUC" name="TPRODUC" size="5" style="width:70%"
                                value="${requestScope.OB_IAX_CODICONTRATO_REA.TPRODUC}" <axis:atr f="axisrea002" c="TPRODUC" a="modificable=false"/>/>
                               </td>
                              </axis:visible>    
                           <axis:visible f="axisrea002" c="CACTIVI"> <!-- Linia 2. Columna 2. -->
                             <td class="campocaja"> <%-- ACTIVIDAD --%>
                                <%-- CACTIVI --%>
                                <!--input type="text" class="campo campotexto" id="CACTIVI" name="CACTIVI" style="width:10%"
                                value="${requestScope.OB_IAX_CODICONTRATO_REA.CACTIVI}" <axis:atr f="axisrea002" c="CACTIVI" a="modificable=false&obligatorio=true"/>/-->
                                <%-- TACTIVI --%>
                                <input type="text" class="campo campotexto" id="TACTIVI" name="TACTIVI" style="width:80%"
                                value="${requestScope.OB_IAX_CODICONTRATO_REA.TACTIVI}" <axis:atr f="axisrea002" c="TACTIVI" a="modificable=false"/>/>
                              </td>
                           </axis:visible>    
                           <axis:visible f="axisrea002" c="CGARANT"> 
                            <td class="campocaja"> <%-- GARANTIA --%>
                               <!-- Linia 2. Columna 3. -->
                                <%-- CGARANT --%>
                                <!--input type="text" class="campo campotexto" id="CGARANT" name="CGARANT" style="width:10%"
                                value="${requestScope.OB_IAX_CODICONTRATO_REA.CGARANT}" <axis:atr f="axisrea002" c="CGARANT" a="modificable=false&obligatorio=true"/>/-->
                                <%-- TGARANT --%>
                                <input type="text" class="campo campotexto" id="TGARANT" name="TGARANT" style="width:80%"
                                value="${requestScope.OB_IAX_CODICONTRATO_REA.TGARANT}" <axis:atr f="axisrea002" c="TGARANT" a="modificable=false"/>/>
                            </td>
                          </axis:visible>    
                          </tr>
                        
                           <!-- Tipos de cumulo -->
                          <tr> 
                           <axis:ocultar f="axisrea002" c="CTIPCUM">
                            <td class="titulocaja" colspan="1" ><!--CTIPCUM -->
                              <b><axis:alt f="axisrea002" c="LIT_CTIPCUM" lit="150965"/></b>
                            </td>
                           </axis:ocultar>  
                           <axis:visible f="axisrea002" c="SCONAGR">
                              <td class="titulocaja" id="LIT_SCONAGR"  colspan="1" ><!--SCONAGR -->
                              <b><axis:alt f="axisrea002" c="LIT_TCONAGR" lit="180009"/></b>
                              </td>
                           </axis:visible>  
                            
                            <!-- Mostraremos el campo cdevento, solo si el tipo de contrato es el 3 (XL) -->
                            <c:if test="${requestScope.OB_IAX_CODICONTRATO_REA.CTIPREA == 3}">
                                <axis:visible f="axisrea002" c="CDEVENTO" >  
	                                <td class="titulocaja" id="td_CDEVENTO">
	                                    <b id="label_CDEVENTO"><axis:alt f="axisrea002" c="LIT_CDEVENTO" lit="9906253"/></b>
	                                </td>
                               </axis:visible>
                            </c:if>                          
                          </tr>
                          
                          <tr> <!-- Area 1. Línea 3. Valores de campos -->
                            <axis:ocultar f="axisrea002" c="CTIPCUM"> <!-- Linia 2. Columna 1. -->         
                              <td class="campocaja" colspan="1"> <%-- CTIPCUM --%>                              
                                <input type="text" class="campo campotexto" id="TTIPCUM" name="TTIPCUM" style="width:70%"
                                value="${requestScope.OB_IAX_CODICONTRATO_REA.TTIPCUM}" <axis:atr f="axisrea002" c="TTIPCUM" a="modificable=false"/>/>                                    
                              </td>     
                            </axis:ocultar>
                            <axis:ocultar f="axisrea002" c="SCONAGR"> <!-- Linia 2. Columna 1. -->  
                              <td class="campocaja" colspan="1"> <%-- SCONAGR --%>                                    
                                <input type="text" class="campo campotexto" id="TCONAGR" name="TCONAGR" style="width:80%"
                                value="${requestScope.OB_IAX_CODICONTRATO_REA.TCONAGR}" <axis:atr f="axisrea002" c="TCONAGR" a="modificable=false"/>/>                                    
                              </td>
                            </axis:ocultar>
                              
                              <!-- Mostraremos el campo cdevento, solo si el tipo de contrato es el 3 (XL) -->
                              <c:if test="${requestScope.OB_IAX_CODICONTRATO_REA.CTIPREA == 3}"> 
                                    <td class="campocaja" colspan="1" id="td_CDEVENTO">
                                    
                                        <c:choose>
                                            <c:when  test="${requestScope.OB_IAX_CODICONTRATO_REA.CDEVENTO == 0}">
                                                    <c:set var="TEVENTO">Por Riesgo</c:set>
                                            </c:when>
                                            <c:when  test="${requestScope.OB_IAX_CODICONTRATO_REA.CDEVENTO == 1}">
                                                    <c:set var="TEVENTO">Por Evento</c:set>
                                            </c:when>
                                            <c:otherwise>
                                                    <c:set var="TEVENTO"></c:set>
                                            </c:otherwise>
                                        </c:choose>
                                            <input type="hidden" id="CDEVENTO" name="CDEVENTO" value="${requestScope.OB_IAX_CODICONTRATO_REA.CDEVENTO}"/> 
                                          <axis:ocultar f="axisrea002" c="CDEVENTO">                                       
                                            <input type="text" class="campo campotexto" id="TDEVENTO" name="TDEVENTO" style="width:80%"
                                            value="${TEVENTO}" <axis:atr f="axisrea002" c="CDEVENTO" a="modificable=false"/>/>                                
                                          </axis:ocultar>    
                                    </td>
                               </c:if>
                            
                            
                        
                          <!-- Area 1. Lista de versiones de contratos ( tabla CONTRATOS ) -->
                          <tr>  
                            <td colspan=3>   
                              <table class="area">
                                <tr>
                                  <td>
                                
                                    <!-- Area 2 -->
                                    <table class="area" align="left"> <!-- Area 2 -->
                                      <tr>
                                        <div class="separador">&nbsp;</div>
                                        <div class="contratos_parent"><img id="contratos_parent" name="contratos_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('contratos', this)" style="cursor:pointer"/>
                                        <b><axis:alt f="axisrea002" c="ALT_TITULO_DATOS" lit="9000583"/></b><c:if test="${! empty requestScope.OB_IAX_CODICONTRATO_REA.SCONTRA}">:  &nbsp; ${requestScope.OB_IAX_CODICONTRATO_REA.SCONTRA} &nbsp;&nbsp; ${requestScope.OB_IAX_CODICONTRATO_REA.TTIPREA} &nbsp;&nbsp; ${requestScope.OB_IAX_CODICONTRATO_REA.TPRODUC}</b></c:if>
                                        </div>
										<!--	INI -  EDBR - IAXIS4529 - 25/06/2019 - se agrega icono nueva version -->
                                       <axis:visible f="axisrea002" c="NUEVA_VERSION">
                                        	<div style="float:right;" id="NUEVA_VERSION"> <a href="javascript:f_but_editar(1)"><img border="0" alt="<axis:alt f="axisrea002" c="ALT_IMG_NUEVO" lit="9001184"/>" title="<axis:alt f="axisrea002" c="ALT_IMG_NUEVO_OP" lit="9001184"/>" src="images/new.gif"/></a></div>
                                        </axis:visible>
                                        <!--	INI -  EDBR - IAXIS4529 - 25/06/2019 - se agrega icono nueva version -->
                                        <hr class="titulo"/>
                                      </tr>
                                      <tr id="contratos_children" style="display:none">                                                       
                                        <td> 
                                          <!-- Area 2. Marco de veriones de contratos --> 
                                          <!-- Títulos de columnas -->
                                          <c:set var="title1"><axis:alt f="axisrea002" c="ALT_NVERSION" lit="9000577"/></c:set>  <%-- Num. versión --%>
                                          <c:set var="title2"><axis:alt f="axisrea002" c="ALT_FINI" lit="100883"/></c:set>   <%-- Fecha inicial (efecto) --%>
                                          <c:set var="title3"><axis:alt f="axisrea002" c="ALT_FFIN" lit="100885"/></c:set>   <%-- Fecha final (vencimiento)--%>
                                          <c:set var="title4"><axis:alt f="axisrea002" c="ALT_CEDIDO" lit="9000618"/></c:set>   <%-- % cedido --%>
                                          <c:set var="title5"><axis:alt f="axisrea002" c="ALT_DESCRIPCION" lit="100588"/></c:set>   <%-- Descripción --%>
                                          <c:set var="title6"><axis:alt f="axisrea002" c="ALT_OBSERVACIONES" lit="101162"/></c:set>  <%-- Obervaciones --%>
           
                                          <!-- Valores de columnas -->
                                          <div class="displayspace">                                               
                                            <display:table name="${listaContratos}" id="T_IAX_CONTRATO_REA" export="false" class="dsptgtable" 
                                            pagesize="-1" defaultsort="3" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                            requestURI="axis_axisrea002.do?operation=form&paginar=true">
                                              <%@ include file="../include/displaytag.jsp"%>
                                              <!-- Check versión -->
                                              <display:column headerClass="headwidth5 sortable fixed" title="" media="html" autolink="false" >
                                                <div class="dspIcons">
                                                  <input value="${T_IAX_CONTRATO_REA.OB_IAX_CONTRATO_REA.NVERSIO}"  <c:if test="${T_IAX_CONTRATO_REA.OB_IAX_CONTRATO_REA.NVERSIO==__formdata.OB_IAX_CONTRATO_REA.NVERSIO}">checked</c:if> onclick="javascript:f_seleccionar_version()" type="radio" id="radioNVERSIO" name="radioNVERSIO" selected="true"/>
                                                </div>
                                              </display:column>
                                              <!-- Número de versión versión -->
                                              <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CONTRATO_REA.NVERSIO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                <div class="dspText">${T_IAX_CONTRATO_REA.OB_IAX_CONTRATO_REA.NVERSIO}</div>
                                              </display:column>
                                              <!-- Fecha inicio contrato ( Fecha de efecto ) -->
                                              <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_CONTRATO_REA.FCONINI" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                <div class="dspDate"><fmt:formatDate value="${T_IAX_CONTRATO_REA.OB_IAX_CONTRATO_REA.FCONINI}" pattern="dd/MM/yyyy"/></div>
                                              </display:column>
                                              <!-- Fecha de fin de contrato ( Fecha de vencimiento ) -->
                                              <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_CONTRATO_REA.FCONFIN" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                <div class="dspDate"><fmt:formatDate value="${T_IAX_CONTRATO_REA.OB_IAX_CONTRATO_REA.FCONFIN}" pattern="dd/MM/yyyy"/></div>
                                              </display:column>
                                              <!-- Porcentaje cedido -->
                                              <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_CONTRATO_REA.PCEDIDO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                <div class="dspText">${T_IAX_CONTRATO_REA.OB_IAX_CONTRATO_REA.PCEDIDO} <c:if test="${! empty T_IAX_CONTRATO_REA.OB_IAX_CONTRATO_REA.PCEDIDO}"> %</c:if></div>
                                              </display:column>                                        
                                              <!-- Descripción del contrato -->
                                              <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_CONTRATO_REA.TCONTRA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                <div class="dspDate">${T_IAX_CONTRATO_REA.OB_IAX_CONTRATO_REA.TCONTRA}</div>
                                              </display:column>                
                                              <!-- Observaciones del contrato -->
                                              <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_CONTRATO_REA.TOBSERV" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                <div class="dspText">${T_IAX_CONTRATO_REA.OB_IAX_CONTRATO_REA.TOBSERV}</div>
                                              </display:column>              
                                            </display:table>
                                          </div>   
                                          <table class="area" align="center">
                                            <tr>       
                                            <td>

                                              <!-- Area 2. Campos del detalle de la versión  -->
                                              <table class="area" align="left">
                                                <tr>
                                                  <div class="separador">&nbsp;</div>
                                                  <div class="detalleVers_parent"><img id="detalleVers_parent" name="detalleVers_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('detalleVers', this)" style="cursor:pointer"/>
                                                    <b><axis:alt f="axisrea002" c="ALT_TITULO_DATOS2" lit="9000585"/></b> 
                                                        <c:if test="${! empty requestScope.OB_IAX_CODICONTRATO_REA.SCONTRA}">
                                                            : &nbsp;&nbsp; ${requestScope.OB_IAX_CODICONTRATO_REA.TCONTRA}/${__formdata.OB_IAX_CONTRATO_REA.TVERSIO} &nbsp;&nbsp; ${requestScope.OB_IAX_CODICONTRATO_REA.TTIPREA} &nbsp;&nbsp; <axis:alt f="axisrea002" c="ALT_FCONINI" lit="100883"/>:<fmt:formatDate value="${__formdata.OB_IAX_CONTRATO_REA.FCONINI}" pattern="dd/MM/yyyy"/> 
                                                                <c:if test="${! empty __formdata.OB_IAX_CONTRATO_REA.FCONFIN}">&nbsp;&nbsp; <axis:alt f="axisrea002" c="ALT_NVERSIO" lit="100885"/>:<fmt:formatDate value="${__formdata.OB_IAX_CONTRATO_REA.FCONFIN}" pattern="dd/MM/yyyy"/></c:if>
                                                        </c:if>
                                                  </div>
                                                  <hr class="titulo"/>
                                                </tr>
                                                <tr id="detalleVers_children" style="display:none">
                                                  <td>
                                                    <table class="area" align="left"> 
                                                      <tr> <!-- Se establecen las 3 columnas dentro de la tabla -->
                                                        <th style="width:33%;height:0px">
                                          &nbsp;
                                        </th>                                     
                                                        <th style="width:33%;height:0px">
                                          &nbsp;
                                        </th>                                     
                                                        <th style="width:33%;height:0px">
                                          &nbsp;
                                        </th>                                     
                                                      </tr>
                                                      <tr> <!-- Area 2. Línea 1. Títulos de campos -->
                                                      <axis:visible f="axisrea002" c="NVERSIO">
                                                        <td class="titulocaja" ><!--Num version -->
                                                          <b><axis:alt f="axisrea002" c="LIT_NVERSIO" lit="9000577"/></b>
                                                        </td>
                                                      </axis:visible>
                                                      <axis:visible f="axisrea002" c="FCONINI">
                                                        <td class="titulocaja" ><!-- Fecha efecto  -->
                                                          <b><axis:alt f="axisrea002" c="LIT_FCONINI" lit="100883"/></b>
                                                        </td>
                                                      </axis:visible>
                                                      <axis:visible f="axisrea002" c="FCONFIN">
                                                        <td class="titulocaja" ><!--Fecha vencimiento -->
                                                          <b><axis:alt f="axisrea002" c="LIT_FCONFIN" lit="100885"/></b>
                                                        </td>
                                                      </axis:visible>
                                                      </tr> <!-- FIN Area 2. Línea 1. Títulos de campos -->
                                                      <tr> <!-- Area 2. Línea 1. Valores de campos -->
                                                        <td class="campocaja"> <!-- Area 2. Linea 1. Columna 1. Número de versión -->
                                                          <axis:visible f="axisrea002" c="NVERSIO">
                                                            <input type="text" class="campo campotexto" id="NVERSIO_AUX" name="NVERSIO_AUX" style="width:10%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.NVERSIO}" <axis:atr f="axisrea002" c="NVERSIO" a="modificable=false"/>/>
                                                          </axis:visible>    
                                                        </td>
                                                        <td class="campocaja"> <!-- Area 2. Linea 1. Columna 2. Fecha inicio versión ( Fecha efecto ) -->
                                                          <axis:visible f="axisrea002" c="FCONINI">
                                                            <input type="dspDate" class="campo campotexto" id="FCONINI" name="FCONINI" style="width:40%"
                                                            value="<fmt:formatDate value='${__formdata.OB_IAX_CONTRATO_REA.FCONINI}' pattern="dd/MM/yyyy"/>" <axis:atr f="axisrea002" c="FCONINI" a="modificable=false"/>/>
                                                          </axis:visible>    
                                                        </td>
                                                        <td class="campocaja"> <!-- Area 2. Linea 1. Columna 3. Fecha fin versión ( Fecha vencimiento ) -->
                                                          <axis:visible f="axisrea002" c="FCONFIN">
                                                            <input type="dspDate" class="campo campotexto" id="FCONFIN" name="FCONFIN" style="width:40%"
                                                            value="<fmt:formatDate value='${__formdata.OB_IAX_CONTRATO_REA.FCONFIN}' pattern="dd/MM/yyyy"/>" <axis:atr f="axisrea002" c="FCONFIN" a="modificable=false"/>/>
                                                          </axis:visible>    
                                                        </td> 
                                                      </tr> <!-- FIN Area 2. Línea 1. Valores de campos -->
                                                      <tr> <!-- Area 2. Línea 2. Títulos de campos -->
                                                      <axis:visible f="axisrea002" c="TCONTRA">
                                                        <td class="titulocaja" colspan="2" ><!--Descripción de la versión -->
                                                          <b><axis:alt f="axisrea002" c="LIT_TCONTRA" lit="100588"/></b>
                                                        </td>
                                                      </axis:visible>
                                                      <axis:visible f="axisrea002" c="SCONQP">
                                                        <td class="titulocaja" ><!--Contrato de protección / Núm. versión -->
                                                          <b><axis:alt f="axisrea002" c="LIT_SCONQP" lit="9001594"/></b>
                                                        </td>
                                                      </axis:visible>
                                                        
                                                      </tr> <!-- FIN Area 2. Línea 2. Títulos de campos -->
                                                      <tr> <!-- Area 2. Línea 2. Valores de campos -->
                                                        <td class="campocaja" colspan="2"> <!-- Area 2. Linea 2. Columna 1. Forma de cálculo -->
                                                          <axis:visible f="axisrea002" c="TCONTRA">
                                                            <input type="text" class="campo campotexto" id="TCONTRA" name="TCONTRA" style="width:50%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.TCONTRA}" <axis:atr f="axisrea002" c="TCONTRA" a="modificable=false"/>/> 
                                                             <!--input type="text" class="campo campotexto" id="TDESCRIPCION_REA" name="TDESCRIPCION_REA" style="width:25%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.TDESCRIPCION}" <axis:atr f="axisrea002" c="TDESCRIPCION_REA" a="modificable=false"/>/-->
                                                          </axis:visible>    
                                                        </td>                                                                                  
                                                        <td class="campocaja"> <!-- Area 2. Linea 2. Columna 2. Forma de cálculo -->
                                                          <axis:visible f="axisrea002" c="SCONQP">
                                                            <input type="text" class="campo campotexto" id="SCONQP" name="SCONQP" style="width:25%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.SCONQP}" <axis:atr f="axisrea002" c="SCONQP" a="modificable=false"/>/>
                                                            <input type="text" class="campo campotexto" id="NVERQP" name="NVERQP" style="width:10%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.NVERQP}" <axis:atr f="axisrea002" c="NVERQP" a="modificable=false"/>/>
                                                          </axis:visible>    
                                                        </td>
                                                  
                                                      </tr> <!-- FIN Area 2. Línea 2. Valores de campos -->
                                                      <tr> <!-- Area 2. Línea 3. Títulos de campos -->
                                                      <axis:visible f="axisrea002" c="CVIDAGA">
                                                        <td class="titulocaja" ><!--Num version -->
                                                          <b><axis:alt f="axisrea002" c="LIT_CVIDAGA" lit="9000601"/></b>
                                                        </td>
                                                      </axis:visible>
                                                      <axis:visible f="axisrea002" c="ICAPACI">
                                                        <td class="titulocaja" ><!-- Fecha efecto  -->
                                                            <b><axis:alt f="axisrea002" c="LIT_ICAPACI" lit="9000602"/></b>
                                                        </td>
                                                      </axis:visible>
                                                      <axis:visible f="axisrea002" c="PCEDIDO">
                                                        <td class="titulocaja" ><!--Fecha vencimiento -->
                                                          <b><axis:alt f="axisrea002" c="LIT_PCEDIDO" lit="9001595"/></b>
                                                        </td>
                                                      </axis:visible>
                                                      </tr> <!-- FIN Area 2. Línea 3. Títulos de campos -->
                                                                                             
                                                      <tr> <!-- Area 2. Línea 3. Valores de campos -->
                                                        <td class="campocaja"> <!-- Area 2. Linea 3. Columna 1. Forma de cálculo -->
                                                          <axis:visible f="axisrea002" c="CVIDAGA">
                                                            <input type="text" class="campo campotexto" id="TVIDAGA" name="TVIDAGA" style="width:80%"
                                                            value="${requestScope.OB_IAX_CODICONTRATO_REA.TVIDAGA}" <axis:atr f="axisrea002" c="TVIDAGA" a="modificable=false"/>/>
                                                          </axis:visible>    
                                                        </td>
                                                        <td class="campocaja"> <!-- Area 2. Linea 2. Columna 2. Capacidad -->
                                                          <axis:visible f="axisrea002" c="ICAPACI">
                                                            <input type="text" class="campo campotexto" id="ICAPACI" name="ICAPACI" style="width:70%"
                                                            value="<fmt:formatNumber pattern="###,##0.00" value='${__formdata.OB_IAX_CONTRATO_REA.ICAPACI}'/>" <axis:atr f="axisrea002" c="ICAPACI" a="modificable=false"/>/>
                                                          </axis:visible>    
                                                        </td>
                                                        <td class="campocaja"> <!-- Area 2. Linea 3. Columna 3. % Cedido / Obervaciones -->
                                                          <axis:visible f="axisrea002" c="PCEDIDO">
                                                            <input type="text" class="campo campotexto" id="PCEDIDO" name="PCEDIDO" style="width:10%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.PCEDIDO}" <axis:atr f="axisrea002" c="PCEDIDO" a="modificable=false"/>/>
                                                          </axis:visible>    
                                                          <axis:visible f="axisrea002" c="TOBSERV">
                                                            <input type="text" class="campo campotexto" id="TOBSERV" name="TOBSERV" style="width:80%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.TOBSERV}" <axis:atr f="axisrea002" c="TOBSERV" a="modificable=false"/>/>
                                                          </axis:visible>    
                                                        </td> 
                                                      </tr> <!-- FIN Area 2. Línea 3. Valores de campos -->
                                                      
                                                      <tr> <!-- Area 2. Línea 3. Títulos de campos -->
                                                      <%--axis:visible f="axisrea002" c="TMONEDA">
                                                        <td class="titulocaja" ><!--Num version -->
                                                          <b><axis:alt f="axisrea002" c="LIT_TMONEDA" lit="108645"/></b>
                                                        </td>
                                                      </axis:visible--%>
                                                     <axis:ocultar f="axisrea002" c="IRETENC" dejarHueco="false">  
                                                      <td class="titulocaja" ><!--Descripción de la versión -->
                                                          <b id="label_IRETENC"><axis:alt f="axisrea002" c="LIT_VAL2_TTIPREA" lit="101714"/></b>
                                                      </td>
                                                       </axis:ocultar>                                                       
                                                      <axis:ocultar f="axisrea002" c="IPRIOXL" dejarHueco="false">  
                                                      <td class="titulocaja" id="td_IPRIOXL">
                                                            <b id="label_IPRIOXL"><axis:alt f="axisrea002" c="LIT_VAL3_TTIPREA" lit="9000607"/></b>
                                                      </td>
                                                      </axis:ocultar>
                                                      </tr>
                                                      <tr>
                                                         <%--axis:visible f="axisrea002" c="TMONEDA">
                                                          <td class="campocaja">
                                                            <input type="text" class="campo campotexto" id="TMONEDA" name="TMONEDA" style="width:90%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.TMONEDA}" <axis:atr f="axisrea002" c="TMONEDA" a="modificable=false"/>/>
                                                           </td>
                                                        </axis:visible--%> 
                                                           
                                                         <axis:ocultar f="axisrea002" c="IRETENC" dejarHueco="false">  
                                                         <td class="campocaja"> <!-- Area 2. Linea 2. Columna 3. Forma de cálculo -->
                                                            <input type="text" class="campo campotexto" id="IRETENC" name="IRETENC" style="width:70%"
                                                            value="<fmt:formatNumber pattern="###,##0.00" value='${__formdata.OB_IAX_CONTRATO_REA.IRETENC}'/>" <axis:atr f="axisrea002" c="IRETENC" a="modificable=false"/>/>
                                                         </td>
                                                         </axis:ocultar>    
                                                         <axis:ocultar f="axisrea002" c="IPRIOXL" dejarHueco="false">
                                                        <td id="td_IPRIOXL">
                                                        
                                                           
                                                              <input type="text" class="campo campotexto" id="IPRIOXL" name="IPRIOXL" style="width:70%"
                                                              value="<fmt:formatNumber pattern="###,##0.00" value='${__formdata.OB_IAX_CONTRATO_REA.IPRIOXL}'/>" <axis:atr f="axisrea002" c="IPRIOXL" a="modificable=false"/>/>
                                                           
                                                         
                                                        </td>
                                                         </axis:ocultar>       
                                                           
                                                      </tr>
                                                      
                                                   
                                                      
                                         <!-- ****************************************** NUEVOS CAMPOS ************************************** -->
                                         <!-- *********************************************************************************************** -->
                                         <!-- *********************************************************************************************** -->
                                         
                                         <tr> 
                                            <axis:ocultar f="axisrea002" c="TERCARTERA" dejarHueco="false"> 
                                            <td class="titulocaja" colespan="1" ><!--Cartera primas -->
                                              <b id="label_TERCARTERA"><axis:alt f="axisrea002" c="LIT_TERCARTERA" lit="9902212"/></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea002" c="IPRIMAESPERADAS" dejarHueco="false"> 
                                              <td class="titulocaja" colespan="1"  ><!--Primas esperadas -->
                                              <b><axis:alt f="axisrea002" c="LIT_PRIMASESPERADAS" lit="9902213"/></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea002" c="NANYOSLOSS" dejarHueco="false"> 
                                              <td class="titulocaja" colespan="1"  ><!--Años arrastre siniestros -->
                                              <b><axis:alt f="axisrea002" c="LIT_ANYOSLOSS" lit="9902191"/></b>
                                            </td>
                                            </axis:ocultar>
                                        
                                        </tr>
                                        
                                        <tr>
                                        <!-- E/R Cartera primas -->
                                            <td class="campocaja" colspan="1" > 
                                                    <axis:ocultar f="axisrea002" c="TERCARTERA">
                                                        <input type="text" class="campo campotexto" id="TERCARTERA" name="TERCARTERA" size="1" style="width:62.5%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.TERCARTERA}" <axis:atr f="axisrea002" c="TERCARTERA" a="readOnly=true&obligatorio=false"/> />
                                                    </axis:ocultar>   
                                            </td>
                                        <!-- E/R Cartera primas -->
                                        <!-- Primas esperadas -->
                                        <td class="campocaja" colspan="1" >
                                        <axis:ocultar f="axisrea002" c="IPRIMAESPERADAS">
                                            <input type="text" class="campo campotexto" id="IPRIMAESPERADAS" name="IPRIMAESPERADAS" size="1" style="width:62.5%"
                                            value="${__formdata.OB_IAX_CONTRATO_REA.IPRIMAESPERADAS}" <axis:atr f="axisrea002" c="IPRIMAESPERADAS" a="readOnly=true&obligatorio=false"/> />
                                        </axis:ocultar>   
                                        </td>
                                        <!-- Primas esperadas -->
                                        <!-- Años arrastre Siniestros -->
                                        <td class="campocaja" colspan="1" >
                                        <axis:ocultar f="axisrea002" c="NANYOSLOSS">
                                            <input type="text" class="campo campotexto" id="NANYOSLOSS" name="NANYOSLOSS" size="1" style="width:62.5%"
                                            value="${__formdata.OB_IAX_CONTRATO_REA.NANYOSLOSS}" <axis:atr f="axisrea002" c="NANYOSLOSS" a="readOnly=true&obligatorio=false"/> />
                                        </axis:ocultar>   
                                        </td>
                                        <!--  Años arrastre Siniestros -->
                                       
                                        </tr>
                                        
                                        <tr> 
                                            <axis:ocultar f="axisrea002" c="TBASEXL" dejarHueco="false"> 
                                            <td class="titulocaja" colespan="1" id="td_TBASEXL"><!-- Base cobertura XL -->
                                              <b id="label_TBASEXL"><axis:alt f="axisrea002" c="LIT_TBASEXL" lit="9902214"/></b>
                                            </td>
                                            </axis:ocultar>

                                            <axis:ocultar f="axisrea002" c="TLOSSCORRIDOR_CON" dejarHueco="false"> 
                                            <td class="titulocaja" colespan="1" ><!--Loss Corridor -->
                                              <b id="label_TLOSSCORRIDOR_CON"><axis:alt f="axisrea002" c="LIT_CLOSSCORRIDOR_CON" lit="9902197"/></b>
                                            </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisrea002" c="TCAPPEDRATIO_CON" dejarHueco="false"> 
                                              <td class="titulocaja" colespan="1"  ><!-- Capped Ratio -->
                                              <b id="label_TCAPPEDRATIO_CON"><axis:alt f="axisrea002" c="LIT_CCAPPEDRATIO_CON" lit="9902198"/></b>
                                            </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                        <tr>
                                        <!-- Base Cobertura XL -->
                                  
                                         <axis:ocultar f="axisrea002" c="TBASEXL" dejarHueco="false">
                                                    <td class="campocaja" colspan="1" id="td_TBASEXL">
                                                          <input type="text" class="campo campotexto" id="TBASEXL" name="TBASEXL" size="1" style="width:62.5%"
                                                          value="${__formdata.OB_IAX_CONTRATO_REA.TBASEXL}" <axis:atr f="axisrea002" c="TBASEXL" a="readOnly=true&obligatorio=false"/> />
                                                          <input type="hidden" value="${__formdata.OB_IAX_CONTRATO_REA.CBASEXL}" id="CBASEXL" name="CBASEXL"/>

                                                    </td>        
                                         </axis:ocultar>   
                                        <!--  Base Cobertura XL -->
                                        <!-- Loss Corridor -->
                                         <axis:ocultar f="axisrea002" c="TLOSSCORRIDOR_CON" dejarHueco="false">
                                                 <td class="campocaja" colspan="1" >
                                                       <input type="text" class="campo campotexto" id="TLOSSCORRIDOR_CON" name="TLOSSCORRIDOR_CON" size="1" style="width:62.5%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.TLOSSCORRIDOR_CON}" <axis:atr f="axisrea002" c="TLOSSCORRIDOR_CON" a="readOnly=true&obligatorio=false"/> />
                                                       <input type="hidden"  id="CLOSSCORRIDOR_CON" name="CLOSSCORRIDOR_CON" size="1" style="width:62.5%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.CLOSSCORRIDOR_CON}" <axis:atr f="axisrea002" c="CLOSSCORRIDOR_CON" a="readOnly=true&obligatorio=false"/> />
                                                </td>
                                          </axis:ocultar>   
                                        <!--  Loss Corridor -->
                                        
                                        <!-- Capped Ratio -->
                                        <axis:ocultar f="axisrea002" c="TCAPPEDRATIO_CON" dejarHueco="false">
                                                 <td class="campocaja" colspan="1" >
                                                    
                                                        <input type="text" class="campo campotexto" id="TCAPPEDRATIO_CON" name="TCAPPEDRATIO_CON" size="1" style="width:62.5%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.TCAPPEDRATIO_CON}" <axis:atr f="axisrea002" c="CCAPPEDRATIO_CON" a="readOnly=true&obligatorio=false"/> />
                                                        <input type="hidden"  id="CCAPPEDRATIO_CON" name="CCAPPEDRATIO_CON" size="1" style="width:62.5%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.CCAPPEDRATIO_CON}" <axis:atr f="axisrea002" c="CCAPPEDRATIO_CON" a="readOnly=true&obligatorio=false"/> />
                                                   
                                                  </td>
                                         </axis:ocultar>   
                                        <!--  Capped Ratio -->

                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisrea002" c="TSCONTRAPROT" dejarHueco="false"> 
                                              <td class="titulocaja" colespan="2"  ><!-- Contrato de protección -->
                                              <b id="label_TSCONTRAPROT"><axis:alt f="axisrea002" c="LIT_TSCONTRAPROT1" lit="9000612"/>/<axis:alt f="axisrea002" c="LIT_LIT_TSCONTRAPROT2" lit="9902216"/></b>
                                            </td>
                                            </axis:ocultar>
                                            
                                        <td>&nbsp;</td>
                                        <axis:ocultar f="axisrea002" c="PCOMEXT" dejarHueco="false"> 
                                              <td class="titulocaja" colespan="1"  ><!--% Comisión extra prima -->
                                              <b id="label_PCOMEXT"><axis:alt f="axisrea002" c="LIT_PCOMEXT" lit="9906742"/></b>
                                            </td>
                                            </axis:ocultar>
                                            </tr>
                                        <tr>
                                             <!-- Contrato protección -->
                                                 <td class="campocaja" colspan="2" >
                                                    <axis:ocultar f="axisrea002" c="TSCONTRAPROT">
                                                        <input type="text" class="campo campotexto" id="TSCONTRATOPROT" name="TSCONTRATOPROT" size="1" style="width:62.5%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.TSCONTRAPROT}" <axis:atr f="axisrea002" c="TSCONTRATOPROT" a="readOnly=true&obligatorio=false"/> />
                                                        <input type="hidden" class="campo campotexto" id="SCONTRATOPROT" name="SCONTRATOPROT" size="1" style="width:62.5%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.SCONTRAPROT}" <axis:atr f="axisrea002" c="SCONTRAPROT" a="readOnly=true&obligatorio=false"/> />
                                                        <input type="hidden" class="campo campotexto" id="NVERSIOPROT" name="NVERSIOPROT" size="1" style="width:62.5%"
                                                            value="${__formdata.OB_IAX_CONTRATO_REA.NVERSIOPROT}" <axis:atr f="axisrea002" c="NVERSIOPROT" a="readOnly=true&obligatorio=false"/> />
                                                    </axis:ocultar>   
                                                  </td>
                                            <!--  Contrato protección -->
                                            
                                              <td class="campocaja" colspan="1"> <%-- PCOMEXT --%>
                              <axis:ocultar f="axisrea002" c="PCOMEXT"> <!-- Linia 2. Columna 1. -->                                      
                                <input type="text" class="campo campotexto" id="PCOMEXT" name="PCOMEXT" style="width:80%"
                                value="${__formdata.OB_IAX_CONTRATO_REA.PCOMEXT}" <axis:atr f="axisrea002" c="PCOMEXT" a="modificable=false"/> />                                                                
                              </axis:ocultar>    
                              </td>
                                        </tr>
										
										<!-- INI - EDBR - 11/06/2019 - IAXIS3338 - se agregan los campo de Retencion por poliza NRETPOL y Retencion por Cumulo NRETCUL -->
                                        <tr>
                                        	<axis:ocultar f="axisrea002" c="IRETPOL" dejarHueco="false"> 
                                            <td class="titulocaja" colspan="1" ><!--Retención por poliza -->
                                              <b id="label_IRETPOL"><axis:alt f="axisrea002" c="LIT_IRETPOL" lit="89906319"/></b>
                                            </td>
                                            </axis:ocultar> 
                                            
                                            <axis:ocultar f="axisrea002" c="IRETCUL" dejarHueco="false"> 
                                                <td class="titulocaja" colspan="1"  ><!-- Retención por cúmulo -->
                                                    <b><axis:alt f="axisrea003" c="LIT_PRETCUL" lit="89906320"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea002" c="ISUBLIMITE" dejarHueco="false"> 
                                                <td class="titulocaja" colspan="1"  ><!-- Retención por cúmulo -->
                                                    <b><axis:alt f="axisrea003" c="LIT_ISUBLIMITE" lit="89908032"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                        
                                        
                                        
                                     
                                      <axis:ocultar f="axisrea002" c="NRETPOL" dejarHueco="false">
                                       <td class="campocaja" colspan="1" >
                                             <input type="text" class="campo campotexto" id="TLOSSCORRIDOR_CON" name="NRETPOL" size="1" style="width:62.5%"
                                                  value="${__formdata.OB_IAX_CONTRATO_REA.NRETPOL}" <axis:atr f="axisrea002" c="NRETPOL" a="readOnly=true&obligatorio=false"/> />                                             
                                         </td>
                                      </axis:ocultar> 
                                           
                                           
                                           
                                           <axis:ocultar f="axisrea002" c="NRETCUL" dejarHueco="false">
                                       <td class="campocaja" colspan="1" >
                                             <input type="text" class="campo campotexto" id="NRETCUL" name="NRETCUL" size="1" style="width:62.5%"
                                                  value="${__formdata.OB_IAX_CONTRATO_REA.NRETCUL}" <axis:atr f="axisrea002" c="NRETCUL" a="readOnly=true&obligatorio=false"/> />                                             
                                         </td>
                                        <td class="campocaja"> <!-- Area 2. Linea 2. Columna 2. Capacidad -->
                                                          <axis:visible f="axisrea002" c="ISUBLIMITE">
                                                            <input type="text" class="campo campotexto" id="ISUBLIMITE" name="ISUBLIMITE" style="width:70%"
                                                            value="<fmt:formatNumber pattern="###,##0.00" value='${__formdata.OB_IAX_CONTRATO_REA.ISUBLIMITE}'/>" <axis:atr f="axisrea002" c="ISUBLIMITE" a="modificable=false"/>/>
                                                          </axis:visible>    
                                         </td>
                                      </axis:ocultar>   
                                           </td>
                                        </tr>
                                        <!-- FIN - EDBR - 11/06/2019 - IAXIS3338 - se agregan los campo de Retencion por poliza NRETPOL y Retencion por Cumulo NRETCUL -->
                                         <!-- *********************************************************************************************** -->
                                         <!-- *********************************************************************************************** -->
                                                      
                                                      
                                                      
                                                      
                                                      
                                                    </table>                                                                          
                                                  </td>
                                                </tr>
                                              </table>
                                              <!-- FIN Area 2. Campos del detalle de la versión  -->
                                            </td>
                                            </tr>
                                            <tr>                                                              
                                            <td>

                                              <table class="area" align="left">
                                                <tr>
                                                  <div class="separador">&nbsp;</div>
                                                  <div class="tramos_parent"><img src="images/mes.gif" id="tramos_parent" name="tramos_parent" onclick="objEstilos.toggleDisplay('tramos', this)" style="cursor:pointer"/>
                                                  <b><axis:alt f="axisrea002" c="ALT_SCONTRA_TIT" lit="108676"/></b>
                                                    <c:if test="${! empty requestScope.OB_IAX_CODICONTRATO_REA.SCONTRA}">
                                                        : &nbsp;&nbsp; ${requestScope.OB_IAX_CODICONTRATO_REA.SCONTRA}/${__formdata.OB_IAX_CONTRATO_REA.NVERSIO} &nbsp;&nbsp; ${requestScope.OB_IAX_CODICONTRATO_REA.TTIPREA} &nbsp;&nbsp; <axis:alt f="axisrea002" c="ALT_FCONFIN_LIST" lit="100883"/>:<fmt:formatDate value="${__formdata.OB_IAX_CONTRATO_REA.FCONINI}" pattern="dd/MM/yyyy"/> 
                                                        <c:if test="${! empty __formdata.OB_IAX_CONTRATO_REA.FCONFIN}"> <axis:alt f="axisrea002" c="ALT_FCONFIN_DESC" lit="100885"/>:<fmt:formatDate value="${__formdata.OB_IAX_CONTRATO_REA.FCONFIN}" pattern="dd/MM/yyyy"/></c:if>
                                                    </c:if>
                                                  </div>
                                                  <hr class="titulo"/>
                                                </tr>
                                                <tr id="tramos_children" style="display:none">
                                                  <td>                                                                     
                                                    <!-- Area 2. Multirregistro de tramos -->
                                                          <!-- Área 1 -->
                                                          <table class="area" align="left"> <!-- multirregistro de tramos -->
                                                            <tr>
                                                              <td>
                                                                <c:set var="title1"><axis:alt f="axisrea002" c="ALT_TRAMO" lit="9000609"/></c:set>  <%-- Tramo --%>
                                                                <c:set var="title2"><axis:alt f="axisrea002" c="ALT_NRODEN" lit="500102"/></c:set>   <%-- Num. Orden --%>
                                                                <c:set var="title3"><axis:alt f="axisrea002" c="ALT_BORDERO" lit="9000610"/></c:set>   <%-- Borderó --%>
                                                                <c:set var="title4"><axis:alt f="axisrea002" c="ALT_IMPTRAMO" lit="9000474"/></c:set>   <%-- Importe tramo --%>
                                                                <c:set var="title5"><axis:alt f="axisrea002" c="ALT_IPRIOTRAMO" lit="89906330"/></c:set>   <%-- Nuevo campo prioridad TRAMO IAXIS-4611 tramo --%>
                                                                <c:set var="title6"><axis:alt f="axisrea002" c="ALT_QUOTE" lit="9000611"/></c:set>   <%-- % Cuota Parte --%>
                                                                <c:set var="title7"><axis:alt f="axisrea002" c="ALT_PROTECCION" lit="9000612"/></c:set>   <%-- Contrato protección --%>
                                                                <c:set var="title8"><axis:alt f="axisrea002" c="ALT_VERS_PROTECCION" lit="9000577"/></c:set>   <%-- Versión contrato protección --%>

                                                                
                                                                
                                                            
                                                               <div class="displayspace" id="dt_tramos">
                                                                  <display:table name="${listaTramos}" id="T_IAX_TRAMOS_REA" export="false" class="dsptgtable" 
                                                                  pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                                  requestURI="axis_axisrea002.do?operation=form&paginar=true">
                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                    <display:column headerClass="headwidth5 sortable" title="" media="html" autolink="false" >
                                                                      <div class="dspIcons">
                                                                        <input value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.CTRAMO }" <c:if test="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.CTRAMO==__formdata.OB_IAX_TRAMOS_REA.CTRAMO}">checked</c:if> onclick="javascript:f_seleccionar_tramo()" type="radio" id="radioCTRAMO" name="radioCTRAMO" selected="true"/>
                                                                      </div>
                                                                    </display:column>                                                                       
                                                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.TTRAMO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                      <div class="dspText">${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.TTRAMO}</div>
                                                                    </display:column>
                                                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.NORDEN" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                      <div class="dspText">${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.NORDEN}</div>
                                                                    </display:column>
                                                                    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.TFREBOR" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                      <div class="dspText">${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.TFREBOR}</div>
                                                                    </display:column>
                                                                    <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.ITOTTRA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                      <div class="dspText"><fmt:formatNumber pattern="###,##0.00" value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.ITOTTRA}"/></div>
                                                                    </display:column>
                                                                    <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.IXLPRIO" headerClass="sortable fixed"  media="html" autolink="false" >      <!--IAXIS-4611:Campo para grabar la prioridad por tramo y el limite por tramo -->                             
                                                                      <div class="dspText"><fmt:formatNumber pattern="###,##0.00" value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.IXLPRIO}"/></div>
                                                                    </display:column>
                                                                    <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.PLOCAL" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                      <div class="dspText">${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.PLOCAL} <c:if test="${! empty T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.PLOCAL}"> %</c:if></div>
                                                                    </display:column>
                                                                    <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.SCTRXL" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                      <div class="dspText">${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.SCTRXL}</div>
                                                                    </display:column>
                                                                    <display:column title="${title8}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.NVERXL" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                      <div class="dspText">${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.NVERXL}</div>
                                                                    </display:column>             <!--     **************************************** SECCION INFORMACION *********************************** -->
                                                                            <!--     ************************************************************************************************ -->
                                                                                    <axis:visible f="axisrea002" c="SECCION_TRAMOS">    
                                                                                        <display:column headerClass="headwidth5 sortable fixed" title="${title14}" media="html" autolink="false" >
                                                                                        <!-- COLUMNA GESTION SECCION -->
                                                                                       <div class="dspIcons">
                                                                                          <a href="javascript:void(0)">
                                                                                            <img id="icono_SECCION_${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.NORDEN}" onmouseout="ocultar('SECCION_${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.NORDEN}')" onmouseover="mostrar('SECCION_${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.NORDEN}','dt_tramos')"
                                                                                            border="0" alt="<axis:alt f="axisrea002" c="LIT_IMG_VAL" lit="1000577"/>" title="${title14}" src="images/informacion.gif"/>
                                                                                          </a>
                                                                                        </div>
                                                                                        </display:column>
                                                                                    </axis:visible>
                                                                                <!-- COLUMNA GESTION SECCION -->
                                                                                        <display:column class="seccion_informacion1">
                                                                                            <div id="SECCION_${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.NORDEN}" class="seccion_informacion1" >
                                                                                                <!-- INICIO SECCION -->
                                                                                                <table class="area" align="center">
                                                                                                     <tr>
                                                                                                        <th style="width:15%;height:0px">
                                                  &nbsp;
                                                </th>
                                                                                                        <th style="width:15%;height:0px">
                                                  &nbsp;
                                                </th>
                                                                                                        <th style="width:15%;height:0px">
                                                  &nbsp;
                                                </th>
                                                                                                        <th style="width:15%;height:0px">
                                                  &nbsp;
                                                </th>
                                                                                                        <th style="width:15%;height:0px">
                                                  &nbsp;
                                                </th>
                                                                                                        <th style="width:15%;height:0px">
                                                  &nbsp;
                                                </th>                                                                          
                                                                                                                                                          
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <%-- Capacidad --%>
                                                                                                        <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_ITOTTRA" lit="9000602"/></b>
                                                                                                        </td>
                                                                                                         <%-- % Cedente --%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_PLOCAL" lit="9902199"/></b>
                                                                                                        </td> 
                                                                                                        <%-- Idaa --%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_IDAA" lit="9902178"/></b>
                                                                                                        </td>   
                                                                                                        <c:if test="${requestScope.OB_IAX_CODICONTRATO_REA.CTIPREA == 3}">                                               
                                                                                                         <%-- Ilaa --%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_ILAA" lit="9902179"/></b>
                                                                                                        </td> 
                                                                                                        </c:if>
                                                                                                        <%-- TprimaXl --%>
                                                                                                        <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_CTPRIMAXL" lit="9902181"/></b>
                                                                                                        </td>
                                                                                                        <%-- PrimaFija --%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_IPRIMAFIJAXL" lit="9902182"/></b>
                                                                                                        </td>                                                  
                                                                                                         <%-- Prima Estimada --%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_IPRIMAESTIMADA" lit="9902183"/></b>
                                                                                                        </td>   
                                                                                               
                                                                                                        
         
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                         <%-- Capacidad --%>
                                                                                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="ITOTTRA_AUX" name="ITOTTRA_AUX" size="15" style="width:99%"
                                                                                                            value="<fmt:formatNumber pattern='###,#00.00' value='${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.ITOTTRA}' />" readonly="readonly"/>
                                                                                                        </td>
                                                                                                         <%-- Cedente --%>
                                                                                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="PLOCAL_AUX" name="PLOCAL_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.PLOCAL}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <%-- Idaa --%>
                                                                                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="IDAA_AUX" name="IDAA_AUX" size="15" style="width:90%"
                                                                                                            value="<fmt:formatNumber pattern='###,#00.00' value='${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.IDAA}' />" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <c:if test="${requestScope.OB_IAX_CODICONTRATO_REA.CTIPREA == 3}">
                                                                                                         <%-- Ilaa--%>
                                                                                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="ILAA_AUX" name="ILAA_AUX" size="15" style="width:99%"
                                                                                                            value="<fmt:formatNumber pattern='###,#00.00' value='${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.ILAA}' />" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        </c:if>
                                                                                                     
                                                                                                        <%-- Prima XL --%>
                                                                                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="CTPRIMAXL_AUX" name="CTPRIMAXL_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.CTPRIMAXL}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                         <%-- Prima Fija --%>
                                                                                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="IPRIMAFIJAXL_AUX" name="IPRIMAFIJAXL_AUX" size="15" style="width:90%"
                                                                                                            value="<fmt:formatNumber pattern='###,#00.00' value='${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.IPRIMAFIJAXL}' />" readonly="readonly"/>
                                                                                                        </td>
                        
                                                                                                         <%-- prima estimada --%>
                                                                                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="IPRIMAESTIMADA_AUX" name="IPRIMAESTIMADA_AUX" size="15" style="width:90%"
                                                                                                            value="<fmt:formatNumber pattern='###,#00.00' value='${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.IPRIMAESTIMADA}' />" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <%-- Aplic TAsa --%>
                                                                                                        <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_CAPLICTASAXL" lit="9902184"/></b>
                                                                                                        </td>
                                                                                                        <%-- Tipo Tasa --%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                           <b><axis:alt f="axisrea002" c="LIT_TTIPTASAXL" lit="9902180"/></b>
                                                                                                        </td>                                                  
                                                                                                        <%-- % Tasa Fija --%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_PTASAXL" lit="9902185"/></b>
                                                                                                        </td>   
                                                                                                         <%-- Tasa variable --%>
                                                                                                        <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_TTRAMOTASAXL" lit="9902186"/></b>
                                                                                                        </td>
                                                                                                        <%-- PB --%>
                                                                                                        <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_PCTPB_SEC" lit="9902488"/></b>
                                                                                                        </td>
                                                                                                        <%-- Prima depósito --%>
                                                                                                         <%--td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                           <b><axis:alt f="axisrea004" c="LIT_IDEPXL" lit="9902187"/></b>
                                                                                                        </td--%>                                                  
                                                                                                        <%-- % PD --%>
                                                                                                         <%--td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                           <b><axis:alt f="axisrea004" c="LIT_DCTPDXL" lit="9902188"/></b>
                                                                                                        </td--%>        
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <!-- Aplic Tasa -->
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="CAPLICTASAXL_AUX" name="CPALICTASAXL_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.TAPLICTASAXL}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <!-- Tipo tasa -->
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="CTIPTASAXL_AUX" name="CTIPTASAXL_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.TTIPTASAXL}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <!-- Tasa fija -->
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="PTASAXL_AUX" name="PTASAXL_AUX" size="15" style="width:90%"
                                                                                                            value="<fmt:formatNumber pattern='###,##0.000##' value='${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.PTASAXL}'/>" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <!-- Tasa variable -->
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="CTRAMOTASAXL_AUX" name="CTRAMOTASAXL_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.CTRAMOTASAXL}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="PCTPB_AUX" name="PCTPB_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.PCTPB}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <!-- Prima deposito -->
                                                                                                         <%--td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="IDEPXL_AUX" name="IDEPXL_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.IDEPXL}" readonly="readonly"/>
                                                                                                        </td--%>
                                                                                                        <!-- % PD -->
                                                                                                        <%--td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="PCTPDXL_AUX" name="PCTPDXL_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.PCTPDXL}" readonly="readonly"/>
                                                                                                        </td--%>
                                                                                                    </tr>
                                                                                                    
                                                                                                    <tr>
                                                                                                        <%-- Forma de pago --%>
                                                                                                        <%--td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea004" c="LIT_CFORPAGPXL" lit="100712"/></b>
                                                                                                        </td--%>
                                                                                                        <%-- Prima mínima --%>
                                                                                                         <%--td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                           <b><axis:alt f="axisrea004" c="LIT_IMINXL_AUX" lit="9902189"/></b>
                                                                                                        </td--%>                                                  
                                                                                                        <%-- % P Min --%>
                                                                                                         <%--td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea004" c="LIT_PCTMINXL_AUX" lit="9902190"/></b>
                                                                                                        </td--%>   
                                                                                                         <%-- Participación Beneficios --%>
                                                                                                          <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_IPMD" lit="9902486"/></b>
                                                                                                        </td>
                                                                                                         <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_CFREPMD" lit="9902487"/></b>
                                                                                                        </td>
                                                                                                        <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_PCTPB" lit="1000495"/></b>
                                                                                                        </td>
                                                                                                        <%-- Bordero --%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                           <b><axis:alt f="axisrea002" c="LIT_TFREBOR_AUX" lit="9000610"/></b>
                                                                                                        </td>                                                  
                                                                                                        <%-- Anyos arrastre Siniestros --%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                           <b><axis:alt f="axisrea002" c="LIT_ANYOSLOSS" lit="9902191"/></b>
                                                                                                        </td>        
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <!-- Forma de pago -->
                                                                                                        <%--td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="CFORPAGPXL_AUX" name="CFORPAGPXL_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.CFORPAGPXL}" readonly="readonly"/>
                                                                                                        </td--%>
                                                                                                        <!-- Prima minima -->
                                                                                                        <%--td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="IMINXL_AUX" name="IMINXL_AUX" size="15" style="width:90%"
                                                                                                            value="<fmt:formatNumber pattern='###,#00.00' value='${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.IMINXL}' />" readonly="readonly"/>
                                                                                                        </td--%>
                                                                                                        <!-- % Min -->
                                                                                                        <%--td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="PCTMINXL_AUX" name="PCTMINXL_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.PCTMINXL}" readonly="readonly"/>
                                                                                                        </td--%>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="IPMD_AUX" name="IPMD_AUX" size="15" style="width:90%"
                                                                                                            value="<fmt:formatNumber pattern='###,#00.00' value='${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.IPMD}' />" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="CFREPMD_AUX" name="CFREPMD_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.TFREPMD}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="PCTPB_AUX" name="PCTPB_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.PCTPB}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <!-- Participacion beneficiarios -->
                                                                                                    
                                                                                                        <!-- Bordero -->
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="CFREBORX_AUX" name="CFREBORX_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.TFREBORX}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <!-- Años arrastre siniestros-->
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="NANYOSLOSS_AUX" name="NANYOSLOSS_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.NANYOSLOSS}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                     </tr>
                                                                                                     
                                                                                                     <tr>
                                                                                                        <%-- Bono reclamacion --%>
                                                                                                        <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_BONOREC" lit="9902192"/></b>
                                                                                                        </td>
                                                                                                        <%-- Reposiciones --%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                           <b><axis:alt f="axisrea002" c="LIT_IMINXL" lit="9902193"/></b>
                                                                                                        </td>                                                  
                                                                                                        <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                           <b><axis:alt f="axisrea002" c="LIT_IMINXL" lit="100899"/> <axis:alt f="axisrea002" c="LIT_IMINXL" lit="9902193"/></b>
                                                                                                        </td>                                                  
                                                                                                        <%-- Importe pagos contado --%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_PCTMINXL" lit="9902194"/></b>
                                                                                                        </td>   
                                                                                                         <%-- % Pagos contado --%>
                                                                                                        <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_PCTPB_AUX" lit="9902191"/></b>
                                                                                                        </td>
                                                                                                        <%-- Avisos siniestros --%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                           <b><axis:alt f="axisrea002" c="LIT_TFREBOR" lit="9902192"/></b>
                                                                                                        </td>                                                  
                                                                                                              
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                         <%-- Bono reclamacion --%>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="IBONOREC_AUX" name="IBONOREC_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.IBONOREC}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                       <%-- Reposiciones --%>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="TREPOS_AUX" name="TREPOS_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.TREPOS}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="NREPOS_AUX" name="NREPOS_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.NREPOS}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                       <%-- Importe pagos contado --%>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="IMPCONTADO_AUX" name="IMPCONTADO_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.IMPCONTADO}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                         <%-- % Pagos contado --%>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="PCTCONTADO_AUX" name="PCTCONTADO_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.PCTCONTADO}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <%-- Avisos siniestros --%>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="IMPAVISO_AUX" name="IMPAVISO_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.IMPAVIS}" readonly="readonly"/>
                                                                                                        </td>
                                                                                            
                                                                                                     </tr>
                                                                                                     
                                                                                                      <tr>
                                                                                                        <%-- Loss Corridor --%>
                                                                                                        <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_LOSSCORRIDOR" lit="9902197"/></b>
                                                                                                        </td>
                                                                                                        <%-- Capped Ratio--%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                           <b><axis:alt f="axisrea002" c="LIT_CAPPEDRATIO" lit="9902198"/></b>
                                                                                                        </td>
																									    <%-- Contador Anhos Arrastre de perdidas CONF-587 --%>
                                                                                                        <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                           <b><axis:alt f="axisrea002" c="LIT_CARRASTRECONT" lit="9902190"/></b>
                                                                                                        </td> 			
                                                                                                       </tr>
                                                                                                       
                                                                                                     <tr>
                                                                                                         <%-- Loss Corridor --%>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="CLOSSCORRIDOR_AUX" name="CLOSSCORRIDOR_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.TLOSSCORRIDOR}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                       <%-- Capped Ratio --%>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="CCAPPEDRATIO_AUX" name="CCAPPEDRATIO_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.TCAPPEDRATIO}" readonly="readonly"/>
                                                                                                        </td>
																									   <%-- Contador Anhos Arrastre de perdidas CONF-587 --%>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="CARRASTRECONT_AUX" name="CARRASTRECONT_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.NARRASTRECONT}" readonly="readonly"/>
                                                                                                        </td>	
                                                                                                    </tr>
                                                                                                    <!-- TODO ANYADIR CAMPOS VERSION 2 -->
                                                                                                      <tr>
                                                                                                        
                                                                                                        <%-- % Gastos --%> 
                                                                                                        <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_PCTGASTOS" lit="9902215"/></b>
                                                                                                        </td>
                                                                                                        <%-- Tasa de Ajuste --%>
                                                                                                        <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_PTASAAJUSTE" lit="9902205"/></b>
                                                                                                        </td>
                                                                                                        <%-- Capacidad/Coaseguro --%>
                                                                                                        <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_ICAPCOASEG" lit="9902211"/></b>
                                                                                                        </td>
                                                                                                        
                                                                                                        <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_ICOSTOFIJO" lit="9906805"/></b>
                                                                                                        </td>
                                                                                                        
                                                                                                        <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_PCOMISINTERM" lit="9905559"/></b>
                                                                                                        </td>
                                                                                                       </tr>
                                                                                                       <tr>
                                                                                                       
                                                                                                        <%-- % Gastos --%> 
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="PCTGASTOS_AUX" name="PCTGASTOS_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.PCTGASTOS}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <%-- Tasa de Ajuste --%>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="PTASAAJUSTE_AUX" name="PTASAAJUSTE_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.PTASAAJUSTE}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <%-- Capacidad/Coaseguro --%>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="ICAPCOASEG_AUX" name="ICAPCOASEG_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.ICAPCOASEG}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        
                                                                                                         <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="ICOSTOFIJO_AUX" name="ICOSTOFIJO_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.ICOSTOFIJO}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        
                                                                                                         <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="PCOMISINTERM_AUX" name="PCOMISINTERM_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.PCOMISINTERM}" readonly="readonly"/>
                                                                                                          
                                                                                                        </td>                                                                                                                                                                                                        
                                                                                                       </tr>
                                                                                                    </table>
                                                                                                     <!-- FIN SECCION -->                                                                        
                                                                                            </div>
                                                                                        </display:column>
                                                                           
                                                                            <!--     ************************************************************************************************ -->
                                                                            <!--     ************************************************************************************************ -->
                                                                    
                                                                           
                                                                    
                                                                  </display:table>                                                                                                    
                                                                </div>  
                                                              </td>
                                                            </tr>
                                                                              
                                                            <!-- CUADROCES -->
                                                            <tr>
                                                              <td>
                                                                <table class="area" align="center"> <!-- cuadros -->
                                                                  <tr>
                                                                  <td>
                                                                  <table class="area" align="left">
                                                                    <tr>
                                                                      <div class="separador">&nbsp;</div>
                                                                      <div class="cuadroces_parent"><img id="cuadroces_parent" name="cuadroces_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('cuadroces', this)" style="cursor:pointer"/>
                                                                        <b><axis:alt f="axisrea002" c="ALT_SECC_CUADROS" lit="9000617"/></b>
                                                                        <c:if test="${! empty requestScope.OB_IAX_CODICONTRATO_REA.SCONTRA}">
                                                                            : &nbsp;&nbsp; ${requestScope.OB_IAX_CODICONTRATO_REA.SCONTRA}/${__formdata.OB_IAX_CONTRATO_REA.NVERSIO} &nbsp;&nbsp;
                                                                            ${requestScope.OB_IAX_CODICONTRATO_REA.TTIPREA} &nbsp;&nbsp;
                                                                            <axis:alt f="axisrea002" c="ALT_TTRAMO" lit="9000609"/>:${__formdata.OB_IAX_TRAMOS_REA.TTRAMO}&nbsp;&nbsp;
                                                                            <axis:alt f="axisrea002" c="ALT_ITRAMO" lit="9000474"/>:<fmt:formatNumber pattern="###,##0.00" value="${__formdata.OB_IAX_TRAMOS_REA.ITOTTRA}"/>
                                                                        </c:if>
                                                                      </div>
                                                                      <hr class="titulo"/>
                                                                    </tr>
                                                                    <tr id="cuadroces_children" style="display:none"> <!-- multirregistro de cuadros -->
                                                                      <td>
                                                                        <c:set var="title1"><axis:alt f="axisrea002" c="ALT_CIA" lit="9000600"/></c:set>  <%-- Compañía --%>
                                                                        <c:set var="title2"><axis:alt f="axisrea002" c="ALT_PCESION" lit="9000613"/></c:set>   <%-- Porcentaje cesion --%>
                                                                        <c:set var="title3"><axis:alt f="axisrea002" c="ALT_COMISI" lit="9000619"/></c:set>   <%-- Cuadro Comisiones --%>
                                                                        <c:set var="title4"><axis:alt f="axisrea002" c="ALT_CORR" lit="9000614"/></c:set>   <%-- Corredor --%>
                                                                        <c:set var="title6"><axis:alt f="axisrea002" c="ALT_RESERVAS" lit="9000615"/></c:set>   <%-- Reservas --%>
                                                                        <c:set var="title7"><axis:alt f="axisrea002" c="ALT_SINIESTROS" lit="9000616"/></c:set>   <%-- Siniestros al contado --%>
                      
                                                                        <div class="displayspace" id="dt_cuadros">
                                                                          <display:table name="${listaCuadroces}" id="T_IAX_CUADROCES_REA" export="false" class="dsptgtable" 
                                                                          pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                                          requestURI="axis_axisrea002.do?operation=form&paginar=true">
                                                                            <%@ include file="../include/displaytag.jsp"%>
                                                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CUADROCES_REA.CCOMPANI" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                              <div class="dspText">${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.CCOMPANI}.-${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.TCOMPANI}</div>
                                                                            </display:column>
                                                                            <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_CUADROCES_REA.PCESION" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                              <div class="dspText">${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.PCESION}<c:if test="${! empty T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.PCESION}"> %</c:if></div>
                                                                            </display:column>
                                                                            <!-- INI - AXIS 4849 - 21/08/2019 - AABG - SE MUESTRA EL PORCENTAJE DE COMISION --> 
                                                                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_CUADROCES_REA.COMISION" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                              <c:if test="${! empty T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.PCTCOMIS}">
                                                                                <div class="dspText">${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.PCTCOMIS}</div>
                                                                              </c:if>
                                                                              <c:if test="${empty T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.CCOMREA && ! empty T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.ICOMFIJ}">
                                                                                <div class="dspText"><fmt:formatNumber pattern="###,##0.00" value="${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.ICOMFIJ}"/></div>
                                                                              </c:if>
                                                                            </display:column>
                                                                            <!-- FIN - AXIS 4849 - 21/08/2019 - AABG - SE MUESTRA EL PORCENTAJE DE COMISION --> 
                                                                            <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_CUADROCES_REA.DESCORRED" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                              <div class="dspText">${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.DESCORRED}</div>
                                                                            </display:column>
                                                                            <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_CUADROCES_REA.PRESERV" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                              <c:if test="${! empty T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.PRESERV}">
                                                                                <div class="dspText">${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.PRESERV}<c:if test="${! empty T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.PRESERV}"> %</c:if></div>
                                                                              </c:if>
                                                                              <c:if test="${empty T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.PRESERV && ! empty T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.IRESERV}">
                                                                                <div class="dspText"><fmt:formatNumber pattern="###,##0.00" value="${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.IRESERV}"/></div>
                                                                              </c:if>
                                                                              <c:if test="${empty T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.PRESERV &&! empty T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.IRESERV && ! empty T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.CRESREF}">
                                                                                <div class="dspText">${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.CRESREF}</div>
                                                                              </c:if>
                                                                            </display:column>
                                                                            <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_CUADROCES_REA.ISCONTA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                              <div class="dspText">${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.ISCONTA}</div>
                                                                            </display:column>
                                                                            <!--     **************************************** SECCION INFORMACION *********************************** -->
                                                                            <!--     ************************************************************************************************ -->
                                                                                <axis:visible f="axisrea002" c="SECCION_CUADROS">    
                                                                                <display:column headerClass="headwidth5 sortable fixed" title="${title14}" media="html" autolink="false" >
                                                                                <!-- COLUMNA GESTION SECCION -->
                                                                                       <div class="dspIcons">
                                                                                          <a href="javascript:void(0)">
                                                                                            <img id="icono_SECCIONC_${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.CCOMPANI}" onmouseout="ocultar('SECCIONC_${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.CCOMPANI}')" onmouseover="mostrar('SECCIONC_${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.CCOMPANI}','dt_tramos')"
                                                                                            border="0" alt="<axis:alt f="axisrea002" c="LIT_IMG_VAL" lit="1000577"/>" title="${title14}" src="images/informacion.gif"/>
                                                                                          </a>
                                                                                        </div>
                                                                                        </display:column>
                                                                                </axis:visible>
                                                                                 <%/*BRSP*/ %>
                                                                                    <axis:visible f="axisrea002" c="SECCION_DOCUMENTOS">    
                                                                                        <display:column headerClass="headwidth5 sortable fixed" media="html" autolink="false" >
                                                                                        <!-- COLUMNA GESTION SECCION -->
                                                                                       <div class="dspIcons">
                                                                                          <a href="javascript:f_but_gedox('${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.CCOMPANI}')">
                                                                                            <img  
                                                                                            border="0" alt="<axis:alt f="axisrea002" c="LIT_IMG_VAL" lit="1000577"/>" title="${title14}" src="images/gdocumental.gif"/>
                                                                                          </a>
                                                                                        </div>
                                                                                        </display:column>
                                                                                    </axis:visible>
                                                                                    <%/*BRSP*/ %>
                                                                                <!-- COLUMNA GESTION SECCION -->
                                                                                        <display:column class="seccion_informacion2">
                                                                                            <div id="SECCIONC_${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.CCOMPANI}" class="seccion_informacion2" style="width:650px;height:170px">
                                                                                                <!-- INICIO SECCION -->
                                                                                                <table class="area" align="center">
                                                                                                     <tr>
                                                                                                        <th style="width:20%;height:0px">
                                                        &nbsp;
                                                      </th>
                                                                                                        <th style="width:20%;height:0px">
                                                        &nbsp;
                                                      </th>
                                                                                                        <th style="width:20%;height:0px">
                                                        &nbsp;
                                                      </th>
                                                                                                        <th style="width:20%;height:0px">
                                                        &nbsp;
                                                      </th>
                                                                                                        <th style="width:20%;height:0px">
                                                        &nbsp;
                                                      </th>
                                                                                                                                                    
                                                                                                                                                          
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <%-- Tipo comision --%>
                                                                                                        <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_CTIPCOMIS" lit="9902149"/></b>
                                                                                                        </td>
                                                                                                         <%-- % Comisión --%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b id="label_PCOMISI"><axis:alt f="axisrea005" c="LIT_PCTCOMIS" lit="9001923"/></b>
                                                                                                        </td> 
                                                                                                        <%-- Tramos comisión --%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >
                                                                                                            <b id="label_TRAMOSCOMISION"><axis:alt f="axisrea005" c="LIT_CTRAMOCOMISION" lit="9902207"/></b>
                                                                                                        </td>                                                  
                                                                                                         <%-- Broker --%>
                                                                                                         <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b id="label_CCORRED"><axis:alt f="axisrea005" c="LIT_CCORRED" lit="9000752"/></b>
                                                                                                        </td> 
                                                                                                       
                                                                                                                                                              
                                                                                                        
         
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                         <%-- Tipo comision --%>
                                                                                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="CTIPCOMIS_AUX" name="CTIPCOMIS_AUX" size="15" style="width:90%"
                                                                                                            value="<fmt:formatNumber pattern='###,#00.00' value='${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.CTIPCOMIS}' />" readonly="readonly"/>
                                                                                                        </td>
                                                                                                         <%-- % Comisión --%>
                                                                                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="PCTCOMIS_AUX" name="PCTCOMIS_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.PCTCOMIS}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <%-- Tramos comisión--%>
                                                                                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="CTRAMOCOMISION_AUX" name="CTRAMOCOMISION_AUX" size="15" style="width:90%"
                                                                                                            value="<fmt:formatNumber pattern='###,#00.00' value='${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.CTRAMOCOMISION}' />" readonly="readonly"/>
                                                                                                        </td>
                                                                                                         <%--Broker --%>
                                                                                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="CCORRED_AUX" name="CCORRED_AUX" size="15" style="width:90%"
                                                                                                            value="<fmt:formatNumber pattern='###,#00.00' value='${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.CCORRED}' />" readonly="readonly"/>
                                                                                                        </td>
                                                                                                     
                                                                                                
                        
                                                                                                         
                                                                                                        
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <%-- Depósito --%>
                                                                                                        <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_PRESERV" lit="9002231"/></b>
                                                                                                        </td>
                                                                                                        <%-- Per. Devolucion Dep. --%>
                                                                                                        <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_PINTDEP" lit="9902204"/></b>
                                                                                                        </td>
                                                                                                        <%-- % Gastos --%> <%-- CONF-587 --%>
                                                                                                        <td class="titulocaja" colspan="1" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                            <b><axis:alt f="axisrea002" c="LIT_PCTGASTOSREA" lit="9902215"/></b>
                                                                                                        </td>
                                                                                                     
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                    <%-- %Depósito --%>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="PRESERVP_AUX" name="PRESERV_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.PRESERV}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <%-- Per. Devolucion Dep. --%>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="CFORPAGDEP_AUX" name="CFORPAGDEP_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.PINTRES}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                        <%-- % Gastos --%> <%-- CONF-587 --%>
                                                                                                        <td class="campocaja" colspan="1" style="background-color:white;border-right-width: 0px;">
                                                                                                            <input type="text" class="campo campotexto" id="PCTGASTOSREA_AUX" name="PCTGASTOSREA_AUX" size="15" style="width:90%"
                                                                                                            value="${T_IAX_CUADROCES_REA.OB_IAX_CUADROCES_REA.PCTGASTOS}" readonly="readonly"/>
                                                                                                        </td>
                                                                                                   
                                                                                                    </tr>
                                                                                                     
                                                                                                    </table>
                                                                                                     <!-- FIN SECCION -->                                                                        
                                                                                            </div>
                                                                                        </display:column>
                                                                            
                                                                            <!--     ************************************************************************************************ -->
                                                                            <!--     ************************************************************************************************ -->
                                                                            
                                                                          </display:table>
                                                                        </div>                       
                                                                      </td>
                                                                    </tr> <!-- fin multirregistro de cuadros -->
                                                                </table> <!-- fin cuadros -->  
                                                                </td>
                                                                </tr>
                                                              </td>
                                                            </tr> <!-- CUADROCES -->
                                                          </td>
                                                </tr>
                                              </table>
                                              <!-- Fin seccion --> 
                                                            
                                                              <!-- TRAMO_SIN_BONO -->
                                                        <axis:visible f="axisrea002" c="DSP_TRAMOSINBONO">
                                                            <tr>
                                                              <td>
                                                                <table class="area" align="center"> <!-- sin_bono -->
                                                                  <tr>
                                                                  <td>
                                                                  <table class="area" align="left">
                                                                    <tr>
                                                                      <div class="separador">&nbsp;</div>
                                                                      <div class="tramosinbono_parent"><img id="tramosinbono_parent" name="tramosinbono_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('tramosinbono', this)" style="cursor:pointer"/>
                                                                        <b><axis:alt f="axisrea002" c="ALT_SECC_TRAMOSINBONO" lit="9906802"/></b>
                                                                        <c:if test="${! empty requestScope.OB_IAX_CODICONTRATO_REA.SCONTRA}">
                                                                            : &nbsp;&nbsp; ${requestScope.OB_IAX_CODICONTRATO_REA.SCONTRA}/${__formdata.OB_IAX_CONTRATO_REA.NVERSIO} &nbsp;&nbsp;
                                                                            ${requestScope.OB_IAX_CODICONTRATO_REA.TTIPREA} &nbsp;&nbsp;
                                                                            <axis:alt f="axisrea002" c="ALT_TTRAMO" lit="9000609"/>:${__formdata.OB_IAX_TRAMOS_REA.TTRAMO}&nbsp;&nbsp;                                                                            
                                                                        </c:if>
                                                                      </div>
                                                                      <hr class="titulo"/>
                                                                    </tr>
                                                                    <tr id="tramosinbono_children" style="display:none"> <!-- multirregistro de tsbs -->
                                                                      <td>
                                                                        <c:set var="title1"><axis:alt f="axisrea002" c="ALT_PSINIESTRA" lit="9906803"/></c:set>  <%-- psiniestra --%>
                                                                        <c:set var="title2"><axis:alt f="axisrea002" c="ALT_PBONOREC" lit="9906804"/></c:set>   <%-- pbonorec --%>                                                                       
                      
                                                                        <div class="displayspace" id="dt_tramosinbono">
                                                                          <display:table name="${listaTramosinbono}" id="T_IAX_TRAMO_SIN_BONO" export="false" class="dsptgtable" 
                                                                          pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                                          requestURI="axis_axisrea002.do?operation=form&paginar=true">
                                                                            <%@ include file="../include/displaytag.jsp"%>
                                                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_TRAMO_SIN_BONO.PSINIESTRA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                              <div class="dspText">${T_IAX_TRAMO_SIN_BONO.OB_IAX_TRAMO_SIN_BONO.PSINIESTRA}<c:if test="${! empty T_IAX_TRAMO_SIN_BONO.OB_IAX_TRAMO_SIN_BONO.PSINIESTRA}"> %</c:if></div>
                                                                            </display:column>
                                                                            <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_TRAMO_SIN_BONO.PBONOREC" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                              <div class="dspText">${T_IAX_TRAMO_SIN_BONO.OB_IAX_TRAMO_SIN_BONO.PBONOREC}<c:if test="${! empty T_IAX_TRAMO_SIN_BONO.OB_IAX_TRAMO_SIN_BONO.PBONOREC}"> %</c:if></div>
                                                                            </display:column>
                                                                            
                                                                              
                                                                          </display:table>
                                                                        </div>                       
                                                                      </td>
                                                                    </tr> <!-- fin multirregistro de tramosinbono -->
                                                                </table> <!-- fin tramo sin bono -->  
                                                                </td>
                                                                </tr>
                                                                </table>
                                                                
                                                              </td>
                                                            </tr> <!-- TRAMOSINBONO -->
                                                             </axis:visible>
                                                             
                                             </table>
                                              
                                            </td>  
                                            </tr>
                                          </table>
                                        </td>
                                      </tr>
                                    </table>
                                  </td>
                                </tr>
                              </table>
                              <!-- fin tercera seccion-->
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                  <!-- fin tercera seccion-->
                </td>
              </tr>
            </table>

            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea002</c:param><c:param name="f">axisrea002</c:param>
            <c:param name="__botones">salir<axis:visible f="axisrea002" c="BT_EDITAR">,editar</axis:visible><axis:visible f="axisrea002" c="BT_ACTIVAR">,9000656</axis:visible></c:param> 
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
