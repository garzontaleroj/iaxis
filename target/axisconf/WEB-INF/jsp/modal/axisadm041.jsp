<%/*
*  Fichero: axisadm041.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a> 
*
*  Fecha: 12/01/2010
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

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
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
        
        
        <c:if test="${RESULT==0}">
            parent.f_aceptar_axisadm041('axisadm041');
        </c:if>
        
        f_cargar_propiedades_pantalla();
        }
                
        function f_but_aceptar () {
            if (objValidador.validaEntrada()) {
               objUtiles.ejecutarFormulario("modal_axisadm041.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
         }

        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisadm041');
        }
        
    
    </script>
  </head>
    <body onload="f_onload()"  >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
            
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
             <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>
             <input type="hidden" name="SIDPRODP" id="SIDPRODP" value="${__formdata.SIDPRODP}"/>
             <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisadm041" c="TIT_FORM" lit="9900933" /></c:param>
                <c:param name="producto"><axis:alt f="axisadm041" c="TIT_FORM" lit="9900933" /></c:param>
                <c:param name="form">axisadm041</c:param>
            </c:import>
            
                <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                       
                        <!--campos-->
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
                                           <axis:visible f="axisadm041" c="FINIEFE" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm041" c="FINIEFE" lit="9000526" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axisadm041" c="TIPNIMPAGAT" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm041" c="TIPNIMPAGAT" lit="9900932" /></b>
                                                </td>
                                             </axis:visible>	
                                            <axis:visible f="axisadm041" c="CTIPOIMP">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm041" c="CTIPOIMP" lit="102302" /></b>
                                                </td>
                                             </axis:visible>
                                            <td></td>
                                             
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisadm041" c="FINIEFE">
                                                <td class="campocaja">
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="FINIEFE" name="FINIEFE" size="15"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIEFE}"/>" title="<axis:alt f="axisadm041" c="FINIEFE" lit="9000526"/>" <axis:atr f="axisadm041" c="FINIEFE" a="obligatorio=true&modificable=true&formato=fecha"/>/>
                                                    <a id="icon_FINIEFE" style="vertical-align:middle;" href="#">
                                                    <img border="0" alt="<axis:alt f="axisadm041" c="ICO__FINIEFE" lit="108341" />" title="<axis:alt f="axisadm041" c="ICO_FINIEFE" lit="108341" />" src="images/calendar.gif"/>
                                                    </a>
                                                </td>
                                                     
                                          </axis:visible> 
                                        <axis:visible f="axisadm041" c="CTIPNIMP">
                                                    
                                                     <td class="campocaja">
                                                           <select name = "CTIPNIMP" id ="CTIPNIMP" size="1" onchange="f_cargar_ramos()" class="campowidthselect campo campotexto"  
                                                           title="<axis:alt f="axisadm041" c="TIPNIMPAGAT" lit="9900932" />" <axis:atr f="axisadm041" c="CTIPNIMP" a="modificable=true&obligatorio=true"/>>
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm041" c="CTIPNIMP" lit="108341" /> - </option>
                                                                <c:forEach items="${__formdata.listvalores.tipos_imp}" var="item">
                                                                    <option value = "${item.CATRIBU}" <c:if test="${__formdata['CTIPNIMP']==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                                                </c:forEach>
                                                            </select>
                                                     </td>     
                                        </axis:visible>     
                                     <axis:ocultar f="axisadm041" c="CTIPOIMP">
                                             <td class="campocaja">
                                                        <select name = "CTIPOIMP" id ="CTIPOIMP" size="1" <axis:atr f="axisadm063" c="CTIPOIMP" a="modificable=true&isInputText=false&obligatorio=true"/>
                                                            title="<axis:alt f="axisadm041" c="CTIPOIMP" lit="102302" />"
                                                            class="campowidthselect campo campotexto">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm041" c="SNV_COMBO" lit="108341"/> - </option> 
                                                            <c:forEach items="${__formdata.listvalores.lsttipos}" var="tip">
                                                                <option value = "${tip.CATRIBU}" <c:if test="${tip.CATRIBU  == __formdata.CTIPOIMP}">selected</c:if>>${tip.TATRIBU}</option>
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
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm041</c:param><c:param name="f">axisadm041</c:param>
                <c:param name="f">axisadm041</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FINIEFE",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FINIEFE", 
        singleClick    :    true,
        firstDay       :    1
    });
    

  

</script>    
    </body>
</html>

