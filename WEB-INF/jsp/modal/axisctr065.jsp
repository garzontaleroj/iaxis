<%/*
*  Fichero: axisctr065.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 05/03/2008
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


    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
       
        function f_but_aceptar(){
            objUtiles.ejecutarFormulario("modal_axisctr058.do", "guardarVersion",  document.axisctr058Form, "_self", objJsMessages.jslit_cargando);   
        }
        
        function f_but_cancelar() {
            var embedded = "${param.embedded}"; 
            if (embedded == "true")
                f_cerrar_axisctr065();
            else
                parent.f_cerrar_axisctr065();                
        }
        
        function f_llenar_usos(vctipveh){
            objAjax.invokeAsyncCGI("modal_axisctr065.do", callbackAjaxRecuperarClasesVeh, "operation=ajax_recuperar_clasesveh&CTIPVEH="+vctipveh, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function callbackAjaxRecuperarClasesVeh(ajaxResponseText){
            try {  
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {  
                    var elementos = doc.getElementsByTagName("element");
                    var modelocombo = document.axisctr058Form.TTCLAVEH;  
                    objDom.borrarOpcionesDeCombo(modelocombo);
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        var elementos = doc.getElementsByTagName("element");
                        var modelocombo = document.axisctr058Form.TTCLAVEH;     
                        objDom.borrarOpcionesDeCombo(modelocombo); 
                        for (i = 0; i < elementos.length; i++) {
                            var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CCLAVEH")[0]) ?
                                         objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CCLAVEH"), 0, 0) : "";
                            var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TCLAVEH")[0]) ?
                                         objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TCLAVEH"), 0, 0): "";         
                            objDom.addOpcionACombo(codigo, desc, modelocombo, i);
                        }
                    }
                    if (elementos.length == 0){
                        objDom.addOpcionACombo(null, "Seleccione", modelocombo, 0);
                        var elementos = doc.getElementsByTagName("element");
                        var versioncombo = document.axisctr058Form.TTCLAVEH;     
                        objDom.borrarOpcionesDeCombo(versioncombo);
                        objDom.addOpcionACombo(null, "Seleccione", versioncombo, 0);
                    }
                    
                } 
             } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
               }
            }
            
            
    </script>

    
            <input type="hidden" name="CMARCA" id="CMARCA" value="${axisctr065_Version.CMARCA}" />
            <input type="hidden" name="CMODELO" id="CMODELO" value="${axisctr065_Version.CMODELO}" />
            <input type="hidden" name="CVERSION" id="CVERSION" value="${axisctr065_Version.CVERSION}" />
        

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                          <table class="seccion" align="center">
                            <tr>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                            </tr>
                            <tr>
                                <!-- Marca -->
                                <td class="titulocaja" colspan=3>
                                    <b><fmt:message key="9001046" /></b>
                                </td>
                                <!-- Model -->
                                <td class="titulocaja" colspan=3>
                                    <b><fmt:message key="108515" /></b>
                                </td> 
                            </tr>
                            <tr>
                                <td class="campocaja" colspan=3>
                                        <input type="text" name="TMARCA" id="TMARCA"  readonly value="${axisctr065_Version.TMARCA}"  class="campowidthinput campo campotexto"/>
                                </td>
                                <td class="campocaja" colspan=3>
                                        <input type="text" name="TMODELO" id="TMODELO"  readonly value="${axisctr065_Version.TMODELO}" class="campowidthinput campo campotexto"/>
                                </td>
                            </tr>
                            <tr>
                                <!-- tipo vehicle -->
                                <td class="titulocaja" colspan=3>
                                    <b><fmt:message key="9001059" /></b>
                                </td>
                                <!-- clase vehicle -->
                                <td class="titulocaja" colspan=3>
                                    <b><fmt:message key="9001060" /></b>
                                </td> 
                            </tr>
                            <tr>
                                <td class="campocaja" colspan=3>
                                        <select name = "TTIPVEH" id="TTIPVEH" size="1" onchange="f_llenar_usos(this.value)" class="campowidthselect campo campotexto_ob">
                                            <option value = "${axisctr065_Version.CTIPVEH}"> - <fmt:message key="108341"/> - </option>
                                            <c:forEach var="tipveh" items="${LSTCTIPVEH}">
                                             <option value = "${tipveh.CTIPVEH}"
                                                   <c:if test="${axisctr065_Version.CTIPVEH != 'null' && tipveh.CTIPVEH == axisctr065_Version.CTIPVEH}"> selected </c:if>>
                                                    ${tipveh.TTIPVEH}</option>  
                                            </c:forEach>
                                         </select>
                                </td>
                                <td class="campocaja" colspan=3>
                                        <select name = "TTCLAVEH" id="TTCLAVEH" size="1"  class="campowidthselect campo campotexto_ob">
                                            <option value = "${axisctr065_Version.CCLAVEH}"> - <fmt:message key="108341"/> - </option>
                                            <c:forEach var="claveh" items="${LSTCCLAVEH}">
                                             <option value = "${claveh.CCLAVEH}"
                                                   <c:if test="${axisctr065_Version.CCLAVEH != 'null' && claveh.CCLAVEH == axisctr065_Version.CCLAVEH}"> selected </c:if>>
                                                    ${claveh.TCLAVEH}</option>  
                                            </c:forEach>
                                         </select>                                
                                 </td>
                            </tr>
                            <tr>
                                <!-- Version -->
                                <td class="titulocaja" colspan=4>
                                    <b><fmt:message key="9001146" /></b>
                                </td>
                                 <!-- Nº de puertas -->
                                <td class="titulocaja" colspan=2>
                                    <b><fmt:message key="9001053" /></b>
                                </td> 
                                <!-- Fecha lanzamiento -->
                                <td class="titulocaja" colspan=2>
                                    <b><fmt:message key="9001220" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja" colspan=4>
                                        <input type="text" name="TVERSION" id="TVERSION" value="${axisctr065_Version.TVERSION}"  class="campowidthinput campo campotexto"/>
                                </td>
                                <td class="campocaja" colspan=2>
                                    <input type="text" name="NPUERTA" id="NPUERTA" value="${axisctr065_Version.NPUERTA}" style="width:75px;" class="campowidthinput campo campotexto"/>
                                </td>
                                <td class="campocaja" colspan=2>
                                    <input type="text" formato="fecha" name="FLANZAM" id="FLANZAM" value="<fmt:formatDate value="${axisctr065_Version.FLANZAM}" pattern="dd/MM/yyyy" />" style="width:75px;"  class="campowidthinput campo campotexto"/>
                                    <a id="icon_FLANZAM" style="vertical-align:middle;"><img alt="<fmt:message key="108341"/>" title="<fmt:message key="100883" />" src="images/calendar.gif"/></a>
                                </td> 
                            </tr>
                           <tr>
                                <!-- Peso en vacío  -->
                                <td class="titulocaja" colspan=2>
                                    <b><fmt:message key="9001064" /></b>
                                </td> 
                                <!-- Peso Máximo Admitido -->
                                <td class="titulocaja" colspan=2>
                                    <b><fmt:message key="9001063" /></b>
                                </td>
                                <!-- Número  Máximo de plazas   -->
                                <td class="titulocaja" colspan=2>
                                    <b><fmt:message key="9001065" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja" colspan=2>
                                    <input type="text" name="NTARA" id="NTARA" value="${axisctr065_Version.NTARA}" style="width:75px;" class="campowidthinput campo campotexto"/>
                                </td>
                                <td class="campocaja" colspan=2>
                                    <input type="text" name="NPMA" id="NPMA" value="${axisctr065_Version.NPMA}" style="width:75px;" class="campowidthinput campo campotexto"/>
                                </td>
                                <td class="campocaja" colspan=2>
                                        <input type="text" name="NPLAZAS" id="NPLAZAS" value="${axisctr065_Version.NPLAZAS}" style="width:100px;" class="campowidthinput campo campotexto"/>
                                </td>
                            </tr> 
                            <tr>
                                <!-- Combustible -->
                                <td class="titulocaja" colspan=2>
                                    <b><fmt:message key="9001054" /></b>
                                </td>
                                 <!-- Cilindrada del motor  -->
                                <td class="titulocaja" colspan=2>
                                    <b><fmt:message key="9001235" /></b>
                                </td>
                                 <!-- Potencia del vehículo fiscal  -->
                                <td class="titulocaja" colspan=2>
                                    <b><fmt:message key="9001233" /></b>
                                </td>
                                 <!-- Potencia del vehículo real  -->
                                <td class="titulocaja" colspan=2>
                                    <b><fmt:message key="9001234" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja" colspan=2>
                                        <select name = "CMOTOR" id="CMOTOR"  id ="CMOTOR" size="1" onchange="" class="campowidthselect campo campotexto_ob">
                                            <option value = "${axisctr065_Version.CMOTOR}"> - <fmt:message key="108341"/> - </option>
                                            <c:forEach var="combustible" items="${COMBUSTIBLE}">
                                                <option value = "${combustible.CATRIBU}"
                                                   <c:if test="${axisctr065_Version.CMOTOR != 'null' && combustible.CATRIBU == axisctr065_Version.CMOTOR}"> selected </c:if>>
                                                    ${combustible.TATRIBU}</option>  
                                            </c:forEach>
                                        </select>
                                </td>
                                <td class="campocaja" colspan=2>
                                        <input type="text" name="NCILIND" id="NCILIND" value="${axisctr065_Version.NCILIND}" style="width:100px;" class="campowidthinput campo campotexto"/>
                                </td>
                                <td class="campocaja" colspan=2>
                                        <input type="text" name="NPOTECV" id="NPOTECV" value="${axisctr065_Version.NPOTECV}" style="width:100px;" class="campowidthinput campo campotexto"/>
                                </td>
                                <td class="campocaja" colspan=2>
                                        <input type="text" name="NPOTEKW" id="NPOTEKW" value="${axisctr065_Version.NPOTEKW}" style="width:100px;" class="campowidthinput campo campotexto"/>
                                </td>
                            </tr>
                       </td>
                    </tr>
                  </table>						
                </td>
             </tr>
        </table>
        
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>

    
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FLANZAM",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FLANZAM", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    


