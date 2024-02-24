<%/*
*  Fichero: axisctr091.jsp
*
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*
*  Fecha: 14/11/2007
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"></style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
            
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
                                        <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
							retocarPAGE_CSS('axisadm091');
					</c:if>
            
            document.miForm.PRONAME.focus();
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            
            var grabarOK = '${requestScope.grabarOK}';
            
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0"){
            parent.f_aceptar_axisadm091();  
            }        
              
        }
        
     
        
        function f_but_aceptar(){    
          if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisadm092.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
                
          f_onload(); 
                
          }
         
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisadm092();
        }        
        
        function f_but_buscar() {
            //Si la validación es correcta, ejecutamos la acción
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisadm091.do", "busqueda_agente", document.miForm, "_self", objJsMessages.jslit_buscando_agentes);
            }
        }
         
        function f_seleccionar_agente(CODI){
            if (objUtiles.estaVacio(CODI))
                alert (objJsMessages.jslit_error_de_seleccion);
            else{
                parent.f_aceptar_axisadm091 (CODI);
            }
         }
    </script>
  </head>
  
    <body class=" " onload="f_onload()" >
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="formulario" f="axisadm091" lit="9907702" /></c:param>
                <c:param name="producto"><axis:alt c="producto" f="axisadm091" lit="9907702" /></c:param>
                <c:param name="form">axisadm092</c:param>
            </c:import>
            
            <input type="hidden" id="CONDICION" name="CONDICION" value="${__formdata.CONDICION}"/> 
            <input type="hidden" id="PARTNER" name="PARTNER" value="${__formdata.PARTNER}"/> 
             <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
              <input type="hidden" name="GUARDAT"  id="GUARDAT" value="${__formdata.guardat}"/>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:15%;height:0%;"/>
                                <th style="width:65%;height:0%;"/>
                                <th style="width:20%;height:0%;"/>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="PRONAME" f="axisadm091" lit="9908025" /></b>
                                </td>
                               
                               
                            </tr>
                            <tr>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['PRONAME']}" 
                                    <axis:atr f="axisadm090" c="PRONAME" a="modificable=false"/>
                                    formato="entero" name="PRONAME" id="PRONAME" 
                                    style="width:90%" title="<axis:alt c="CAGENTE" f="axisadm091" lit="9000531"/>"<axis:atr f="axisadm091" c="CAGENTE" />"/> 
                                </td>
                                
                               
                            </tr>
                                                    
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="DIVISA" f="axisadm091" lit="9907703"/></b>
                                </td>
                                
                                </td>
                                
                                <td class="campocaja" >
                                <select name = "CAMP" id ="CAMP" size="1" onchange="f_cargar_propiedades_pantalla();" class="campowidthselect campo campotexto" style="width:30%" >
                                       
                                        <option value="<%=Integer.MIN_VALUE%>">
                                           <axis:alt f="axisadm091" c="SNV_COMBO" lit="1000348"/>
                                        </option>
                                       
                                        <c:forEach items="${__formdata.listValores.FIELD_TYPE}" var="item">
                                            <option value = "${item.CATRIBU}"
                                            <c:if test="${item.CATRIBU == item.FIELD}"> 
                                            selected </c:if>/>${item.TATRIBU}</option>
                                        </c:forEach>
                                        
                                 </select>
                                 </td>
                                
                                
                               
                            </tr>
                            
                            <tr>
                            
                                <td class="titulocaja">
                                        <b><axis:alt c="DIVISA" f="axisadm091" lit="9908023" /></b>
                                </td>
                                
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value=" " name="TCAMP1" id="TCAMP1" size="25"
                                    style="width:30%" title="<axis:alt c="NOMBRE" f="axisadm091" lit="9907697"/>"/>
                                </td>
                                
                            </tr>
                   
                            <tr>
                            
                                <td class="titulocaja">
                                        <b><axis:alt c="DIVISA" f="axisadm091" lit="9907704" /></b>
                                </td>
                             
                                
                                <td class="campocaja" >
                                <select name = "OPERADOR" id ="OPERADOR" size="1" onchange="f_cargar_propiedades_pantalla();" class="campowidthselect campo campotexto" style="width:30%" >
                                       
                                        <option value="<%=Integer.MIN_VALUE%>">
                                           <axis:alt f="axisadm091" c="SNV_COMBO" lit="1000348"/>
                                        </option>
                                       
                                        <c:forEach items="${__formdata.listValores.FIELD_VALIDA}" var="item">
                                            <option value = "${item.CATRIBU}"
                                            <c:if test="${item.CATRIBU == item.FIELD}"> 
                                            selected </c:if>/>${item.TATRIBU}</option>
                                        </c:forEach>
                                        
                                 </select>
                                 </td>
                                
                            </tr>
                            
                             <tr>
                            
                                <td class="titulocaja">
                                        <b><axis:alt c="DIVISA" f="axisadm091" lit="9907705"  /></b>
                                </td>
                                
                                 <td class="campocaja" >
                                <select name = "CAMPS" id ="CAMPS" size="1" onchange="f_cargar_propiedades_pantalla();" class="campowidthselect campo campotexto" style="width:30%" >
                                       
                                        <option value="<%=Integer.MIN_VALUE%>">
                                           <axis:alt f="axisadm091" c="SNV_COMBO" lit="1000348"/>
                                        </option>
                                       
                                        <c:forEach items="${__formdata.listValores.FIELD_CONTENT}" var="item">
                                            <option value = "${item.CATRIBU}"
                                            <c:if test="${item.CATRIBU == item.FIELD}"> 
                                            selected </c:if>/>${item.TATRIBU}</option>
                                        </c:forEach>
                                        
                                 </select>
                                 </td>
                                
                                
                                
                                
                                
                            </tr>
                            
                           <tr>                            
                                <td class="titulocaja">
                                        <b><axis:alt c="DIVISA" f="axisadm091" lit="9908021"  /></b>
                                </td>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="" name="TCAMP2" id="TCAMP2" size="15"
                                    style="width:10%" title="<axis:alt c="NOMBRE" f="axisadm091" lit="9907699"/>"/>
                                </td>
                                
                            </tr>
     
            </table>
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisadm091</c:param>        
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </table></form>
        <c:import url="../include/mensajes.jsp" />
        </div>
    </body>
</html>