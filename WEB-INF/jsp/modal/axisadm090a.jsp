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
            
            NNUMIDE = document.getElementById("PRONAME").value;
         
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0"){
            parent.f_aceptar_axisadm090a(NNUMIDE);  
            }        
              
        }
        
        
        
        
         function f_cargar(){
  
             /*   objDom.setDisabledPorId("but_aceptar",false);*/
                objUtiles.ejecutarFormulario("axisadm090a.do", "form", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);   //jslit_cargando
 
    
    }    
        
     
        
        function f_but_aceptar(){    
          if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisadm090a.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
                
          f_onload(); 
                
          }
         
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisadm090a();
        }        
        
        function f_but_buscar() {
            //Si la validación es correcta, ejecutamos la acción
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisadm090a.do", "busqueda_agente", document.miForm, "_self", objJsMessages.jslit_buscando_agentes);
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
                <c:param name="formulario"><axis:alt c="formulario" f="axisadm091" lit="1000062" /></c:param>
                <c:param name="producto"><axis:alt c="producto" f="axisadm091" lit="1000062" /></c:param>
                <c:param name="form">axisadm090a</c:param>
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
                                    <axis:atr f="axisadm090" c="PRONAME" a="modificable=false"/>formato="entero" name="PRONAME" id="PRONAME" 
                                    style="width:90%" title="<axis:alt c="CAGENTE" f="axisadm091" lit="9000531"/>"<axis:atr f="axisadm091" c="CAGENTE" />"/> 
                                </td>
                                
                               
                            </tr>
                                                    
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="DIVISA" f="axisadm091" lit="9907691"/></b>
                                </td>
                                
                  
                                 <td class="campocaja" id="td_FTYPE" >
                                        <select name = "FTYPE" style="width:20%" id ="FTYPE" size="1" onchange="f_cargar_propiedades_pantalla();" class="campowidthselect campo campotexto">
                                     
                                           <option value="<%=Integer.MIN_VALUE%>">
                                               <axis:alt f="axisadm090" c="SNV_COMBO" lit="1000348"/>
                                            </option>
                                           
                                            <c:forEach items="${__formdata.listValores.arch}" var="item">
                                                <option value = "${item.CATRIBU}"
                                                <c:if test="${item.CATRIBU == item.FTYPE}"> 
                                                selected </c:if>/>${item.TATRIBU}</option>
                                            </c:forEach>
                                            
                                        </select>
                                    </td> 
                         
                            </tr>
                            
                   
<tr>
                        <axis:ocultar f="axisadm090" c="FSTRUCT" dejarHueco="false">
                            <td class="titulocaja" >
                                <b>
                                    <axis:alt f="axisadm090" c="FSTRUCT" lit="9907694"/></b>
                            </td>
                            
                        </axis:ocultar> 
                            
                            
                            <axis:visible f="axisadm090" c="FSTRUCT">
                                    <td class="campocaja" id ="td_FSTRUCT">
                                        <select name = "FSTRUCT" style="width:20%" id ="FSTRUCT" size="1" onchange="f_cargar_propiedades_pantalla();" class="campo campotexto" style="width:90%">
                                           
                                           <option value="<%=Integer.MIN_VALUE%>">
                                               <axis:alt f="axisadm090" c="SNV_COMBO" lit="1000348"/>
                                            </option>
                                           
                                           <c:forEach items="${__formdata.listValores.proceso}" var="item">
                                            <option value = "${item.CATRIBU}"
                                            <c:if test="${__formdata.CATRIBU == item.FSTRUCT}"> 
                                            selected </c:if>/>${item.TATRIBU}</option>
                                           </c:forEach>
                                 
                                         </select>
                                    </td>
                                </axis:visible>
                            
</tr>                 
  
  


<tr>
                        
                        <axis:ocultar f="axisadm090" c="BCHAR" dejarHueco="false">
                            <td  class="titulocaja">
                                <b>
                                    <axis:alt f="axisadm090" c="BCHAR" lit="9907695"/></b>
                            </td>
                        </axis:ocultar>
                        
                         <axis:visible f="axisadm090" c="BCHAR">
                                <td class="campocaja" id="td_BCHAR" style="width:20%" >
                                    <input type="text" class="campo campotexto" value="${__formdata['BCHAR']}" name="BCHAR" id="BCHAR" size="5"
                                    style="width:5%"
                                    />
                                </td>
                            </axis:visible>
                        
</tr>

                           
                            
                       
            </table>
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisadm090a</c:param>        
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </table></form>
        <c:import url="../include/mensajes.jsp" />
        </div>
    </body>
</html>