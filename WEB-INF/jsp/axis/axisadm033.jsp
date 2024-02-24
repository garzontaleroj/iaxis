<%/*
*  Fichero: axisadm033.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a> 
*
*  Fecha: 20/05/2009
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
    <title><axis:alt f="axisadm033" c="TITLE" lit="100905"/></title> <%-- CONSULTA DE RECIBOS --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="Stylesheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
    

    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {  
            f_cargar_propiedades_pantalla();
            var SGESCARTA = "${__formdata.SGESCARTA}";
            if (objUtiles.estaVacio(SGESCARTA)) 
                 f_but_buscar();
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm034", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            f_abrir_modal('axisadm034');
        }
        
        function f_aceptar_axisadm034(SGESCARTA){
            f_cerrar_modal('axisadm034');
            document.miForm.SGESCARTA.value = SGESCARTA;
            objUtiles.ejecutarFormulario("axis_axisadm033.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
         
  
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
            if (cual == 'axisadm034')
                objUtiles.ejecutarFormulario("axis_axisadm033.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
     
        function f_but_aceptar(){
          
          var cestimp = "${__formdata.CESTIMP}";
          if ( !objUtiles.estaVacio(document.miForm.CESTIMP.value ) &&  cestimp != document.miForm.CESTIMP.value){
             objUtiles.ejecutarFormulario("axis_axisadm033.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
          }else
          alert("<axis:alt f='axisadm033' c='ALERT' lit='9001647' />")
          
        }
       
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm033" c="TITULO" lit="9001634"/></c:param>     <%-- Gestión de devoluciones--%>
                <c:param name="formulario"><axis:alt f="axisadm033" c="FORM" lit="9001634"/></c:param> <%-- Gestión de devoluciones --%>
                <c:param name="form">axisadm033</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisadm033" c="TIT034" lit="9001638" /></c:param>
                <c:param name="nid" value="axisadm034" />
        </c:import>
     
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SGESCARTA" id="SGESCARTA" value="${__formdata.SGESCARTA}"/>
        <input type="hidden" name="SDEVOLU" id="SDEVOLU" value="${__formdata.SDEVOLU}"/>
        <div class="separador">&nbsp;</div>       
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="titulo">
                    <img src="images/flecha.gif"/><axis:alt f="axisadm033" c="MAIN" lit="9001644" />
                    <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisadm033" c="BUSCAR" lit="100797" />" onclick="f_but_buscar();" style="cursor:pointer"/>                
                    </div>
                    <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                           <axis:visible f="axisadm033" c="SGESCARTA" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm033" c="SGESCARTA" lit="9001729" /></b>
                                                </td>
                                             </axis:visible>	
                                             <axis:visible f="axisadm033" c="TTIPCAR" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm033" c="TTIPCAR" lit="9001640" /></b>
                                                </td>
                                             </axis:visible>
                                             <axis:visible f="axisadm033" c="NPOLIZA" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm033" c="NPOLIZA" lit="100836" /></b>
                                                </td>
                                             </axis:visible>
                                             <axis:visible f="axisadm033" c="NRECIBO" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm033" c="NRECIBO" lit="100895" /></b>
                                                </td>
                                             </axis:visible>                                             
                                           
	                                             
                                        </tr>
                                        <tr>
                                          <axis:visible f="axisadm033" c="SGESCARTA">
                                                     <td class="campocaja">
                                                    <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="SEQDEVOLU" name="SEQDEVOLU" size="15"
                                                    value="${__formdata.SGESCARTA}" <axis:atr f="axisadm033" c="SGESCARTA" a="modificable=false"/>/>
                                           </axis:visible>   
                                            <axis:visible f="axisadm033" c="TTIPCAR">
                                                     
                                                   <td class="campocaja">
                                                    <input style="width:94%" type="text" class="campowidthinput campo campotexto" id="TTIPCAR" name="TTIPCAR" size="15"
                                                    value="${__formdata.TTIPCAR}" <axis:atr f="axisadm033" c="TTIPCAR" a="modificable=false"/>/>
                                                    </td>  
                                                     
                                          </axis:visible> 
                                          <axis:visible f="axisadm033" c="NPOLIZA">
                                                 <td class="campocaja">
                                                        <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15"
                                                        value="${__formdata.NPOLIZA}" <axis:atr f="axisadm033" c="NPOLIZA" a="modificable=false"/>/>
                                                 </td>
                                             </axis:visible>
                                             <axis:visible f="axisadm033" c="NRECIBO">
                                                 <td class="campocaja">
                                                        <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="NRECIBO" name="NRECIBO" size="15"
                                                        value="${__formdata.NRECIBO}" <axis:atr f="axisadm033" c="NRECIBO" a="modificable=false"/>/>
                                                 </td>
                                             </axis:visible>                                           
                                            
                                         </tr>

                                     
                                         <tr>
                                            <axis:visible f="axisadm033" c="FSOLICI" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm033" c="FSOLICI" lit="9001192" /></b>
                                                </td>
                                             </axis:visible>
                                             <axis:visible f="axisadm033" c="USUSOL" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm033" c="USUSOL" lit="9001630" /></b>
                                                </td>
                                             </axis:visible>
                                         <axis:visible f="axisadm033" c="FIMPRES" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm033" c="FIMPRES" lit="9001642" /></b>
                                                </td>
                                             </axis:visible>
                                             <axis:visible f="axisadm033" c="USUIMP" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm033" c="USUIMP" lit="9001643" /></b>
                                                </td>
                                             </axis:visible>                                             
                                         </tr>
                                         
                                         <tr>
                                            <axis:visible f="axisadm033" c="FSOLICI">
                                                 <td class="campocaja">
                                                    <input style="width:50%" type="text" class="campowidthinput campo campotexto" id="FSOLICI" name="FSOLICI" size="15"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FSOLICI}"/>"  <axis:atr f="axisadm033" c="FSOLICI" a="modificable=false&formato=fecha"/>/>
                                                </td>
                                             </axis:visible>
                                                 
                                             <axis:visible f="axisadm033" c="USUSOL">
                                                <td class="campocaja">
                                                    <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="USUSOL" name="USUSOL" size="15"
                                                    value="${__formdata.USUSOL}" <axis:atr f="axisadm033" c="USUSOL" a="modificable=false"/>/>
                                                 </td>
                                             </axis:visible>
                                            <axis:visible f="axisadm033" c="FIMPRES">
                                                 <td class="campocaja">
                                                    <input style="width:50%" type="text" class="campowidthinput campo campotexto" id="FIMPRES" name="FIMPRES" size="15"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FIMPRES}"/>"  <axis:atr f="axisadm033" c="FIMPRES" a="modificable=false&formato=fecha"/>/>
                                                </td>
                                             </axis:visible>
                                                 
                                             <axis:visible f="axisadm033" c="USUIMP">
                                                <td class="campocaja">
                                                    <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="USUIMP" name="USUIMP" size="15"
                                                    value="${__formdata.USUIMP}" <axis:atr f="axisadm033" c="USUIMP" a="modificable=false"/>/>
                                                 </td>
                                             </axis:visible>                                             
                                         </tr>
                                                                            
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>   
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm033" c="SECCION2" lit="9001659" /></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                             <axis:visible f="axisadm033" c="CESTIMP" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm033" c="CESTIMP" lit="9001645" /></b>
                                                </td>
                                             </axis:visible>                                             
                                         </tr>
                                         <tr>
                                         <axis:visible f="axisadm033" c="CESTIMP" >
                                             <td class="campocaja">
                                                        <select name = "CESTIMP" id ="CESTIMP" size="1" <axis:atr f="axisadm033" c="CESTIMP" a="isInputText=false"/>
                                                            title="<axis:alt f="axisadm033" c="CESTIMP" lit="101619" />"
                                                            class="campowidthselect campo campotexto">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm033" c="MIN_VALUE" lit="108341"/> - </option> 
                                                            <c:forEach items="${__formdata.listValores.lstestados}" var="emp">
                                                                <option value = "${emp.CATRIBU}" <c:if test="${emp.CATRIBU  == __formdata.CESTIMP}">selected</c:if>>${emp.TATRIBU}</option>
                                                            </c:forEach>
                                                        </select>
                                             </td> 
                                            </axis:visible>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisadm033</c:param>
            <c:param name="__botones">salir<c:if test="${!empty __formdata.SGESCARTA}">,aceptar</c:if></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>