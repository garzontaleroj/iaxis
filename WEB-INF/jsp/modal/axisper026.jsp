<%/* Revision:# v+EhxztxPgVDFiZy9n1gPQ== # */%>
<%-- 
*  Fichero: axisper026.jsp
*
*  Fecha: 26/07/2011
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
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

        function f_onload() {    
           
            var REGFISCOUT = "${__formdata.REGFISCOUT}"; 
            if (!objUtiles.estaVacio(REGFISCOUT))
            {
                parent.f_aceptar_axisper026("${__formdata.SPERSON}");
            }
            f_cargar_propiedades_pantalla();   
        }
        
        function f_onchange_CREGFISCAL() {
            f_cargar_propiedades_pantalla();            
            if (objDom.getValorPorId("selectedCTIPPER") != 2) {                
                objDom.setVisibilidadPorId("label_CREGFISEXEIVA", "hidden");
                document.getElementById("CREGFISEXEIVA").style.visibility = "hidden";
            }            
        }
        
        function f_onclickCheckbox(obj){
            var marcat = obj.checked ? 1 : 0;
            objDom.setValorPorId('CREGFISEXEIVA_CHECK', marcat);            
        }
                
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisper026.do", "grabarPersona", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
       
	function f_but_cancelar() {
            parent.f_cerrar_axisper026();
        }      
        
        
        function f_formatdate(entrada,title){
             var jDate = new JsFecha();
                if(entrada.value.length>0){
                    entrada.value=jDate.formateaFecha(entrada.value);
                
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        alert("<axis:alt f="axisctr090" c="ALER_ERR" lit="1000421"/>");
                    }
                }
            }            
      
        
        
      
      
    </script>
  </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="faceptar" name="faceptar" value="${__formdata.faceptar}"/>
            <%-- Esto es necesario tenerlo como hidden para volverlo a enviar a servidor para grabar --%>
            <input type="hidden" id="isNew"  name="isNew" value="${__formdata.isNew}"/>
            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" id="SPEREAL" name="SPEREAL" value="${__formdata.SPEREAL}"/>
            <input type="hidden" id="selectedCTIPPER" name="selectedCTIPPER" value="${__formdata.selectedCTIPPER}"/>
            <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" id="ORIGEN" name="ORIGEN" id="ORIGEN" value="" />
            <input type="hidden" id="SNIP" name="SNIP" id="SNIP" value="" />
            <input type="hidden" id="CAGENTE_VISIO" name="CAGENTE_VISIO" id="CAGENTE_VISIO" value="" />
            <input type="hidden" id="REGFISCOUT" name="REGFISCOUT" value="${__formdata.REGFISCOUT}"/>
            <input type="hidden" id="CREGFISEXEIVA_CHECK" name="CREGFISEXEIVA_CHECK" value="${__formdata.CREGFISEXEIVA}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper026" c="TIT026" lit="9902257" /></c:param>
                <c:param name="producto"><axis:alt f="axisper026" c="TIT026" lit="9902257" /></c:param>
                <c:param name="form">axisper026</c:param>
            </c:import>

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">
            
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        
                        <table class="seccion">
                            <tr>                                
                                <th style="width:15%;height:0px"></th>
                                <th style="width:55%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:5%;height:0px"></th>
                            </tr>
                            <tr>          
                            
                                <axis:visible f="axisper026" c="FEFECTO">
                                        <td class="titulocaja" id="LIT_FEFECTO">
                                            <b><axis:alt f="axisper026" c="FEFECTO" lit="100883"/></b>
                                        </td>
                                </axis:visible>                                
                                <axis:visible f="axisper026" c="CREGFISCAL">
                                    <td class="titulocaja"> <b><axis:alt f="axisper026" c="LIT_CREGFISCAL" lit="9902257"/></b></td><!-- Regimen fiscal -->  
                                </axis:visible>  
                                
                            </tr>
                            <tr>
                              <axis:visible f="axisper026" c="FEFECTO" >
                                    <td class="campocaja">
                                                        <input type="text" onblur="javascript:f_formatdate(this,'')" formato="fecha" <axis:atr f="axisper026" c="FEFECTO" a="modificable=true&isInputText=true&obligatorio=true"/>  alt="<axis:alt f="axisper026" c="FEFECTO" lit="100883"/>" title="<axis:alt f="axisper026" c="FEFECTO" lit="100883"/>"
                                                        name="FEFECTO" id="FEFECTO"  value="<fmt:formatDate value="${__formdata.FEFECTO}" pattern="dd/MM/yyyy" />" style="width:100px;" class="campowidthinput campo campotexto_ob"/>
                                                        <axis:visible c="ICO_FEFECTO" f="axisper026">
                                                            <a id="icon_FEFECTO" style="vertical-align:middle;">
                                                            <img alt="<axis:alt f="axisper026" c="SELECT" lit="108341"/>" title="<axis:alt f="axisper026" c="ICO_FEFECTO" lit="100883" />" src="images/calendar.gif"/></a>
                                                        </axis:visible>
                                    </td>
                                </axis:visible>
                                <axis:visible f="axisper026" c="CREGFISCAL">
                                    <td class="campocaja" colspan="2">
                                        <select name="CREGFISCAL" id="CREGFISCAL" onchange="f_onchange_CREGFISCAL()" 
                                            <axis:atr f="axisper026" c="CREGFISCAL" a="modificable=true&obligatorio=true"/> 
                                            size="1" class="campowidthselect campo campotexto_ob" style="width:80%;">&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper026" c="SNV_COMBO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.regFisc}">
                                                <option value = "${element.CREGFISCAL}" 
                                                <c:if test="${element.CREGFISCAL == __formdata.CREGFISCAL}"> selected </c:if> />
                                                    ${element.TREGFISCAL} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>                                                           
                            </tr> 
                           
                        
                          <c:set var="CLASS">
                              <c:if test="${__formdata.CTIPPER != '2'}">visibility: hidden;</c:if>
                          </c:set>                        
                         
                          <tr>
                            <axis:ocultar f="axisage003" c="CTIPIVA" dejarHueco="false">
                            <td class="titulocaja" colspan="2" id="tit_CTIPIVA" >
                                <b><axis:alt f="axisage003" c="CTIPIVA" lit="101340"/></b>   
                            </td>
                             </axis:ocultar>                     
                              
                        </tr>
                          <tr >
                            <axis:ocultar f="axisper026" c="CTIPIVA" dejarHueco="false">
                            <td class="campocaja" colspan="2" id="td_CTIPIVA" >
                                <select name="CTIPIVA" id="CTIPIVA" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                <axis:atr f="axisper026" c="CTIPIVA" a="obligatorio=true&isInputText=false"/> 
                                title="<axis:alt f="axisper026" c="CTIPIVA" lit="101340"/>" alt="<axis:alt f="axisper026" c="CTIPIVA" lit="101340"/>">&nbsp;
                                    <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper026" c="SELEC" lit="1000348"/> - </option></c:if>
                                    <c:forEach var="element" items="${__formdata.listValores.LSTTIPOIVA}">
                                        <option value = "${element.CTIPIVA}"
                                        <c:if test="${__formdata.CTIPIVA == element.CTIPIVA}"> selected = "selected"</c:if> 
                                        <c:if test="${__formdata.CTIPIVA == element.CTIPIVA}"> selected = "selected"</c:if>>
                                            ${element.TTIPIVA} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>			
            
            <div class="separador">&nbsp;</div>
           
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisper026</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>


<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FEFECTO",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FEFECTO", 
        singleClick    :    true,
        firstDay       :    1,
        /* For IAXIS-4728 -- PK -- 09/07/2019 */
        dateStatusFunc :    function (date) {
            var now = new Date();
            if(date.getFullYear()	<	now.getFullYear()) { return true; }
            if(date.getFullYear()	==	now.getFullYear()) { if(date.getMonth() < now.getMonth()) { return true; } }
            if(date.getMonth()		==	now.getMonth()) { if(date.getDate() < now.getDate()) { return true; } }
        }
    	/* For IAXIS-4728 -- PK -- 09/07/2019 */
    });
</script>
        
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

