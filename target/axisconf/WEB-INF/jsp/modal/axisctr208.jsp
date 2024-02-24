<%/*
*  Fichero: axisctr208.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 31/03/2008
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
        function f_but_aceptar(){
          if (objValidador.validaEntrada()) {
            f_habilitar_campos();
            objUtiles.ejecutarFormulario("modal_axisctr206.do", "guardarDispositivo",  document.axisctr206Form, "_self", objJsMessages.jslit_cargando);   
          }  
        }
        
        function f_but_cancelar() {
            var embedded = "${param.embedded}"; 
            if (embedded == "true")
                f_cerrar_axisctr208();
            else
                parent.f_cerrar_axisctr208();                
        }
        
        function f_actualizar_cfg() {
            f_cargar_propiedades_pantalla();
        }
        
        function f_habilitar_campos(){
            var selects = document.getElementsByTagName("select");
            for(var i=0;i<selects.length;i++){
                if(selects[i].attributes.length>0) {
                   var selectId = selects[i].getAttribute("id");
                     try{
                         if (document.getElementById(selectId).style.visibility != 'hidden' ){
                             if(selects[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(selectId))
                                    objDom.setDisabledPorId(selectId,false);
                         }
                     }catch(e){}
                }
            }
             
        }
        
    </script>

        <input type="hidden" name="XCVERSION" id="XCVERSION" value="${CVERSION}" />
        
        <!-- Area de campos  -->
       
                    <div class="separador">&nbsp;</div>
                        <table class="seccion" align="center">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                
                            </tr>
                            <tr>
                             <axis:ocultar f="axisctr208" c="CDISPOSITIVO" dejarHueco="false">
                                <!-- Accesorio -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr208" c="CDISPOSITIVO" lit="9904763" /></b>
                                </td>
                                </axis:ocultar>
                             <axis:ocultar f="axisctr208" c="CPROPDISP" dejarHueco="false">
                                <!-- Tipo -->
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisctr208" c="CPROPDISP" lit="9904764" /></b>
                                </td>
                                </axis:ocultar>
                                
                                 <axis:ocultar f="axisctr208" c="FINICONTRATO" dejarHueco="false">
                                <!-- Accesorio -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr208" c="FINICONTRATO" lit="9000537" /></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr208" c="NCONTRATO" dejarHueco="false">
                                <!-- Accesorio -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr208" c="NCONTRATO" lit="9000536" /></b>
                                </td>
                                </axis:ocultar>
                                
                                  <%--axis:ocultar f="axisctr208" c="IIVALPUBL" dejarHueco="false">
                                <!-- Valor -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr208" c="IIVALPUBL" lit="9001365" /></b>
                                </td> 
                                </axis:ocultar--%>
                                
                            </tr>
                            <tr>
                             <axis:ocultar f="axisctr208" c="CDISPOSITIVO" dejarHueco="false">
                                  <td class="campocaja">
                                     <select name = "CDISPOSITIVO" id="CDISPOSITIVO"   size="1" 
                                     title="<axis:alt c="CDISPOSITIVO" f="CDISPOSITIVO" lit="9904763" />"
                                     class="campowidthselect campo campotexto"  onchange="f_actualizar_cfg()" 
                                     <c:if test="${!empty __formdata.CMODO && __formdata.CMODO == 'NUEVO' }">
                                     <axis:atr f="axisctr208" c="CDISPOSITIVO" a="modificable=true&isInputText=false&obligatorio=true"/> 
                                     </c:if>
                                     <c:if test="${!empty __formdata.CMODO && __formdata.CMODO == 'EDITAR'}">
                                     <axis:atr f="axisctr208" c="CDISPOSITIVO" a="modificable=false&isInputText=false&obligatorio=true"/> 
                                     </c:if>>
                                      <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="CDISPOSITIVO" c="SELECCIONAR" lit="108341"/> - </option>                              
                                          <c:forEach var="tipo" items="${lstdispositivos}">
                                                <option value = "${tipo.CDISPOSITIVO}"
                                                <c:if test="${(!empty __formdata.CDISPOSITIVO)&& tipo.CDISPOSITIVO == __formdata.CDISPOSITIVO}"> selected </c:if>>
                                                    ${tipo.TDISPOSITIVO}</option>  
                                            </c:forEach>
                                     </select>
                                  </td>
                            </axis:ocultar> 
                             <axis:ocultar f="axisctr208" c="CPROPDISP" dejarHueco="false">
                                  <td class="campocaja">
                                     <select name = "CPROPDISP" id="CPROPDISP"   size="1" 
                                     title="<axis:alt c="CPROPDISP" f="axisctr208" lit="9904764" />"
                                     class="campowidthselect campo campotexto"  
                                     <axis:atr f="axisctr208" c="CPROPDISP" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                      <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr208" c="SELECCIONAR" lit="108341"/> - </option>                              
                                          <c:forEach var="tipo" items="${TIPO}">
                                                <option value = "${tipo.CATRIBU}"
                                                <c:if test="${(!empty __formdata.CPROPDISP)&& tipo.CATRIBU == __formdata.CPROPDISP}"> selected </c:if>>
                                                    ${tipo.TATRIBU}</option>  
                                            </c:forEach>
                                     </select>
                                  </td>
                            </axis:ocultar> 
                           
                            <axis:ocultar f="axisctr208" c="FINICONTRATO" dejarHueco="false">
                            
                                <td class="campocaja">
                                        <input type="text" name="FINICONTRATO" id="FINICONTRATO"   style="width:70%"
                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICONTRATO}"/>"  class="campowidthinput campo campotexto"
                                         title="<axis:alt f="axisctr208" c="FINICONTRATO" lit="9000537" />"
                                        <axis:atr f="axisctr208" c="FINICONTRATO" a="modificable=true&obligatorio=false&formato=fecha"/> />
                                        <a id="icon_FINICONTRATO" style="vertical-align:middle;"><img 
                                        alt="<axis:alt f="axisctr208" c="LIT_108341" lit="108341"/>" title="<axis:alt f="axisctr208" c="LIT_100883" lit="100883" />" src="images/calendar.gif"/></a>
                                </td>
                            </axis:ocultar>
                          
                            <axis:ocultar f="axisctr208" c="NCONTRATO" dejarHueco="false">
                            
                                <td class="campocaja">
                                        <input type="text" <axis:atr f="axisctr208" c="NCONTRATO" a="modificable=true&obligatorio=false&formato=entero"/> 
                                         title="<axis:alt f="axisctr208" c="NCONTRATO" lit="9000536" />" maxlength="15"  size="15"
                                        name="NCONTRATO" id="NCONTRATO"  value="${__formdata.NCONTRATO}" class="campowidthinput campo campotexto"/>
                                </td>
                            </axis:ocultar>
                               
                                
                                
                            </tr>
                        </table>						
                
        <div class="separador">&nbsp;</div>
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr208</c:param><c:param name="f">axisctr208</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    
<script language="Javascript" type="text/javascript">

<axis:visible f="axisctr004" c="FINICONTRATO" >
    Calendar.setup({
        inputField     :    "FINICONTRATO",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FINICONTRATO",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>
</script>