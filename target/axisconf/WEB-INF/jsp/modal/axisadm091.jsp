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
            
            f_cargar_propiedades_pantalla();
              
        }
        
     
        
        function f_but_aceptar(){    
          if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisadm091.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
                
                
          }
         
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisadm091();
        }        
        
    </script>
  </head>
  
    <body class=" " onload="f_onload();" >
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="formulario" f="axisadm091" lit="9907696" /></c:param>
                <c:param name="producto"><axis:alt c="producto" f="axisadm091" lit="9907696" /></c:param>
                <c:param name="form">axisadm091</c:param>
            </c:import>
            
            <input type="hidden" id="CONDICION" name="CONDICION" value="${__formdata.CONDICION}"/> 
            <input type="hidden" id="PARTNER" name="PARTNER" value="${__formdata.PARTNER}"/> 
             <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
              <input type="hidden" name="GUARDAT"  id="GUARDAT" value="${__formdata.guardat}"/>
              
            <input type="hidden" name="PNORDEN"  id="PNORDEN" value="${__formdata.PNORDEN}"/>
            <input type="hidden" name="PCCAMPO"  id="PCCAMPO" value="${__formdata.PCCAMPO}"/>
            <input type="hidden" name="PCTIPCAM"  id="PCTIPCAM" value="${__formdata.PCTIPCAM}"/>
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
                               <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['PRONAME']}" readonly="true" 
                                    <axis:atr f="axisadm091" c="PRONAME" a="modificable=false"/>
                                    name="PRONAME" id="PRONAME" 
                                    style="width:30%" title="<axis:alt c="CAGENTE" f="axisadm091" lit="9000531"/>"/> 
                                </td>
                               
                            </tr>

                                                    
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="FIELD" f="axisadm091" lit="9907696" /></b>
                                </td>
                                
                                <td class="campocaja" id="td_FIELD" >
                                <select name = "FIELD" id ="FIELD" size="1" class="campowidthselect campo campotexto" style="width:30%" 
                                 title="<axis:alt c="FIELD" f="axisadm091" lit="9907696"/>"
                                <axis:atr f="axisper011" c="FIELD" a="obligatorio=true"/>>
                                       
                                        <option value="<%=Integer.MIN_VALUE%>">
                                           <axis:alt f="axisadm091" c="SNV_COMBO" lit="1000348"/>
                                        </option>
                                       
                                        <c:forEach items="${__formdata.listValores.FIELD_TYPE}" var="item">
                                            <option value = "${item.CATRIBU}"
                                            <c:if test="${item.CATRIBU == __formdata.CTIPCAM}"> selected </c:if>>
                                            ${item.TATRIBU}
                                            </option>
                                        </c:forEach>
                                        
                                 </select>
                                 </td>
                            
                            </tr>
                            
                            <tr>
                            
                                <td class="titulocaja">
                                        <b><axis:alt c="CAMPO" f="axisadm091" lit="9907697" /></b>
                                </td>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CCAMPO}" name="CAMPO" id="CAMPO" size="15"
                                    style="width:30%" title="<axis:alt c="CAMPO" f="axisadm091" lit="9907697"/>" <axis:atr f="axisper011" c="CAMPO" a="obligatorio=true"/>/>
                                </td>
                                
                            </tr>
                            
                            <tr>
                            
                                <td class="titulocaja">
                                        <b><axis:alt c="ORDER" f="axisadm091" lit="9907784" /></b>
                                </td>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NORDEN}" name="ORDER" id="ORDER" size="15"
                                    style="width:10%" title="<axis:alt c="ORDER" f="axisadm091" lit="9907784"/>" <axis:atr f="axisper011" c="ORDER" a="obligatorio=true"/>/>
                                </td>
                                
                            </tr>
                            
                             <tr>
                            
                                <td class="titulocaja">
                                        <b><axis:alt c="INICIAL" f="axisadm091" lit="9907698" /></b>
                                </td>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NPOSICI}" name="INICIAL" id="INICIAL" size="15"
                                    style="width:10%" title="<axis:alt c="INICIAL" f="axisadm091" lit="9907698"/>"/>
                                </td>
                                
                            </tr>
                            
                           <tr>                            
                                <td class="titulocaja">
                                        <b><axis:alt c="LONGITUD" f="axisadm091" lit="9907699" /></b>
                                </td>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NLONGITUD}" name="LONGITUD" id="LONGITUD" size="40"
                                    style="width:10%" title="<axis:alt c="LONGITUD" f="axisadm091" lit="9907699"/>"/>
                                </td>
                                
                            </tr>
                            
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="TYPE" f="axisadm091" lit="9907700" /></b>
                                </td>
                            
                            <td class="campocaja" id="td_TYPE" >
                                <select name = "TYPE" id ="TYPE" size="1" class="campowidthselect campo campotexto" style="width:30%" 
                                title="<axis:alt c="TYPE" f="axisadm091" lit="9907700"/>">
                                       
                                        <option value="<%=Integer.MIN_VALUE%>">
                                           <axis:alt f="axisadm091" c="SNV_COMBO" lit="1000348"/>
                                        </option>
                                       
                                        <c:forEach items="${__formdata.listValores.TYPE}" var="item">
                                            <option value = "${item.CATRIBU}"
                                            <c:if test="${item.CATRIBU == __formdata.NTIPO}"> 
                                            selected </c:if>/>${item.TATRIBU}</option>
                                        </c:forEach>
                                        
                                 </select>
                            </td>
                            
                           
                            </tr>
                            
                            
                            
                            <tr>
                            <td class="titulocaja">
                                    <b><axis:alt c="DECIMAL" f="axisadm091" lit="1000419" /></b>
                            </td>
                            
                            
                            
                            <td class="campocaja" id="td_DECIMAL" >
                                <select name = "DECIMAL" id ="DECIMAL" size="1"  class="campowidthselect campo campotexto" style="width:30%" 
                                title="<axis:alt c="DECIMAL" f="axisadm091" lit="1000419"/>">
                                       
                                        <option value="<%=Integer.MIN_VALUE%>">
                                           <axis:alt f="axisadm091" c="SNV_COMBO" lit="1000348"/>
                                        </option>
                                       
                                        <c:forEach items="${__formdata.listValores.DECIMAL}" var="item">
                                            <option value = "${item.CATRIBU}"
                                            <c:if test="${item.CATRIBU == __formdata.CDECIMAL}"> 
                                            selected </c:if>/>${item.TATRIBU}</option>
                                        </c:forEach>
                                        
                                 </select>
                            </td>
                            </tr>
                            
                            <tr>
                              <td class="titulocaja">
                                   <b><axis:alt c="MASK" f="axisadm091" lit="9908400" /></b>
                              </td>
                              <td class="campocaja">
                                   <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CMASK}" name="MASK" id="MASK" size="15"
                                    style="width:10%" title="<axis:alt c="MASK" f="axisadm091" lit="9908400"/>"/>
                              </td>
                            </tr>
                            
                            <tr>
                               <axis:ocultar f="axisadm091" c="CEDIT" dejarHueco="false">
                               <td class="titulocaja">
                                  <b><axis:alt c="CEDIT" f="axisadm091" lit="1000577"/></b>
                               </td>
                               </axis:ocultar>
                               
                               <axis:visible f="axisadm091" c="CEDIT">
                               <td class="campocaja">
                                    <input type="checkbox" class="campowidthinput campo campotexto" value="1" name="CEDIT" id="CEDIT" style="width:2%;"
                                    <c:if test="${__formdata.CEDIT == 1}">checked="true"</c:if>
                                     title="<axis:alt c="CEDIT" f="axisadm091" lit="1000577"/>"/>
                               </td>
                               </axis:visible>
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