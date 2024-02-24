<%-- 
*  Fichero: axisper004.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 24/04/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<c:if test="${param.embedded != 'true'}"> 
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
 
    <c:import url="../include/carga_framework_js.jsp" />
</c:if>
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload_axisper004() {   
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper004');
					</c:if> 
            var grabarOK = '${requestScope.grabarOK}';
            var embedded = "${param.embedded}";
            var modo = '${param.MODO_IN}';
            if (embedded == "true")
                document.getElementById("but_salir").value = "<axis:alt f='axisper004' c='BUT_SALIR_ALT' lit='108211'/>";
                
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0")
                // Se ha grabado correctamente la CCC
                // Cerrar modal y volver a la pantalla padre
                //**if (embedded == "true")
                //**    f_aceptar_axisper004();            
                //**else
                    parent.f_aceptar_axisper004();     
                    
            if(modo=='NUEVO'){
             <axis:visible f="axisper004" c="CBANCAR">
                document.axisper004Form.CBANCAR.value = ''; 
             </axis:visible>   
            }
             
             f_cargar_propiedades_pantalla();         
        }
                
        function f_but_aceptar() {  //TODO:Habrá q añadir 
          
                if (objValidador.validaEntrada()) {
                
                  if(document.axisper004Form.FVENCIM && (document.axisper004Form.FVENCIM.value==null || document.axisper004Form.FVENCIM.value=='')){
                        alert("<axis:alt f="axisper004" c="CBANCAR_TIT1" lit="9902663"/>");
                  }else{
                    objUtiles.ejecutarFormulario("modal_axisper004.do", "grabarCCC", document.axisper004Form, "_self", objJsMessages.jslit_cargando);   
                  }  
                
                }
           
        }
        
        function f_but_salir() {
            //**var embedded = "${param.embedded}"; 
            //**if (embedded == "true")
                //**f_cerrar_axisper004();
            //**else
                parent.f_cerrar_axisper004();                
        }  
        function actualitzarCheckbox_1(obj){
           objDom.setValorPorId("CDEFECTO", ((objDom.getComponenteMarcado(obj))? "1" : "0" )); 
        }
        
         function actualitzarCheckbox_2(obj){
           objDom.setValorPorId("CPAGSIN", ((objDom.getComponenteMarcado(obj))? "1" : "0" )); 
        }
        
          function inicializaCBANCAR(){
           <axis:visible f="axisper004" c="CBANCAR">
            if(document.axisper004Form.CBANCAR){
                document.axisper004Form.CBANCAR.value = '';
            }
            </axis:visible>
        }
        
    </script>
  
  <c:if test="${param.embedded != 'true'}">   
  </head>
  <body onload="f_onload_axisper004()">
  
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  </c:if>
    <div id="wrapper" class="wrapper">
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
    
    <form name="axisper004Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SPERSON"  value="${__formdata.SPERSON}"/>
        <input type="hidden" name="CNORDBAN"  value="${__formdata.CNORDBAN}"/>
        <input type="hidden" name="faceptar" value="${__formdata.faceptar}"/>
        <input type="hidden" name="TIPCCC" value="${__formdata.TIPCCC}"/>
       
       
        <c:if test="${__formdata.TIPCCC=='1'}">
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper004" c="FORMULARIO_TITLE" lit="1000213" /></c:param>
                <c:param name="producto"><axis:alt f="axisper004" c="PANTALLA_TITLE" lit="1000213" /></c:param>   
                <c:param name="form">axisper004</c:param>    
            </c:import>
        </c:if>
        <c:if test="${__formdata.TIPCCC=='2'}">
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper004" c="FORM_AD" lit="9902653" /></c:param>
                <c:param name="producto"><axis:alt f="axisper004" c="PANT_AD" lit="9902653" /></c:param>
                <c:param name="form">axisper004</c:param> 
            </c:import>
        </c:if>
        
        
        

        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                    <%--table class="seccion">
                        <tr>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>

                        </tr>
                        <tr>
                            <td class="campocaja">
                                <b><axis:alt f="axisper004" c="M_UNO" lit="1000374"/></b>
                            </td>
                            <td class="campocaja">
                                <b><axis:alt f="axisper004" c="M_2" lit="100965"/></b>
                            </td>
                            <td class="campocaja">
                                <b><axis:alt f="axisper004" c="M_3" lit="100713"/></b>
                                <input onClick="javascript:actualitzarCheckbox(this)" <c:if test="${__formdata.CDEFECTO == 1}">checked="true"</c:if> 
                                type="checkbox" id="CDEFECTO" name="CDEFECTO" value="${__formdata.CDEFECTO}"/>
                            </td>
                             <td class="campocaja">
                                <b><axis:alt f="axisper004" c="M_4" lit="102853"/></b>
                            </td>
                        <tr>
                            <td class="campocaja">
                                <select name="CTIPBAN" id="CTIPBAN" size="1" class="campowidthselect campo campotexto_ob" style="width:90%;"
                                onchange="javascript:document.axisper004Form.CBANCAR.value = '';">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper004" c="M_5" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.tipCCC}">
                                        <option value = "${element.CTIPBAN}" 
                                        <c:if test="${element.CTIPBAN == __formdata.CTIPBAN}"> selected </c:if> />
                                            ${element.TTIPO} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td class="campocaja" colspan = "2">
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.CBANCAR}" name="CBANCAR" id="CBANCAR" style="width:91%;"/>
                            </td>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FBAJA}"/>" name="FBAJA" id="FBAJA" 
                                <axis:atr f="axisper005" c="FBAJA" a="modificable=true&formato=fecha"/> title="<axis:alt f="axisper004" c="M_6" lit="102853"/>" style="width:80%"
                                <c:if test="${!empty __formdata.SPEREAL}"> disabled </c:if>/><a style="vertical-align:middle;"><img id="popup_calendario_FBAJA" alt="<axis:alt f="axisper004" c="M_7" lit="108341"/>" title="<axis:alt f="axisper004" c="M_8" lit="102853" />" src="images/calendar.gif"/></a>
                            </td>
                        </tr>                
                    </table--%>
                    
                    
                    <!-- **************************************** CCC ******************************************* -->
                    <c:if test="${__formdata.TIPCCC=='1'}">
                    <input type="hidden" id="NLONGBANCO" name="NLONGBANCO" value="${__configform.axisper004__NLONGBANCO__valordefecto}"/>
                    <table class="seccion">
                        <tr>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                        </tr>
                        <tr>
                        
                            <axis:ocultar f="axisper004" c="CTIPCC" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisper004" c="CTIPCC_T" lit="1000374"/></b>
                            </td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisper004" c="CTIPBAN" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisper004" c="CTIPBAN_TIT" lit="1000374"/></b>
                            </td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisper004" c="CBANCAR" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisper004" c="CBANCAR" lit="100965"/></b>
                            </td>
                            </axis:ocultar>
                             
                            <axis:ocultar f="axisper004" c="CBANCO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper004" c="CBANCO" lit="9000964"/></b>  <!-- *** Banco *** -->
                                </td>
                            </axis:ocultar>
                                
                            <axis:ocultar f="axisper004" c="CCUENTA" dejarHueco="false">
                                 <td class="titulocaja" colspan="2" >
                                    <b><axis:alt f="axisper004" c="CCUENTA" lit="100965"/></b>  <!-- *** Cuenta Bancaria *** -->
                                </td>
                            </axis:ocultar> 
                            
                            <td class="titulocaja">
                                <b><axis:alt f="axisper004" c="CDEFECTO_TIT" lit="100713"/></b>
                                <input onClick="javascript:actualitzarCheckbox_1(this)" <c:if test="${__formdata.CDEFECTO == 1}">checked="true"</c:if> 
                                type="checkbox" id="CDEFECTO" name="CDEFECTO" value="${__formdata.CDEFECTO}"/>
                            </td>
                            <axis:ocultar f="axisper004" c="CPAGSIN" dejarHueco="false">
                            <td class="titulocaja">
                                <b id="label_CPAGSIN_TIT"><axis:alt f="axisper004" c="LIT_CPAGSIN_ALT" lit="100592"/></b>
                                <input onClick="javascript:actualitzarCheckbox_2(this)" <c:if test="${__formdata.CPAGSIN == 1}">checked="true"</c:if> 
                                type="checkbox" id="CPAGSIN" name="CPAGSIN" value="${__formdata.CPAGSIN}"/>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                        
                            <axis:ocultar f="axisper004" c="CTIPCC" dejarHueco="false">
                             <td class="campocaja" >
                                <select name="CTIPCC" id="CTIPCC" size="1" class="campowidthselect campo campotexto" style="width:99%;"
                                        onchange="javascript:inicializaCBANCAR();"
                                        title="<axis:alt f="axisper004" c="CTIPCC_LIT" lit="1000374"/>"
                                        <axis:atr f="axisper014" c="CTIPCC" a="obligatorio=true"/>>&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper014" c="CTIPCC_ALT2" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.tipBCC_cuentas}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.CTIPCC}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                        
                            <axis:ocultar f="axisper004" c="CTIPBAN" dejarHueco="false">
                            <td class="campocaja">
                                <select name="CTIPBAN" id="CTIPBAN" size="1" class="campowidthselect campo campotexto" style="width:98%;"
                                        onchange="javascript:inicializaCBANCAR();"
                                        title="<axis:alt f="axisper004" c="CTIPBAN_P" lit="1000374"/>"
                                        <axis:atr f="axisper004" c="CTIPBAN" a="obligatorio=true"/>>&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper004" c="CTIPBAN_ALT1" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.tipCCC}">
                                        <option value = "${element.CTIPBAN}" 
                                        <c:if test="${element.CTIPBAN == __formdata.CTIPBAN}"> selected </c:if> />
                                            ${element.TTIPO} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            
                            <axis:visible f="axisper004" c="CBANCAR">
                            <td class="campocaja" colspan="2">
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CBANCAR}" name="CBANCAR" id="CBANCAR" style="width:91%;"
                                       title="<axis:alt f="axisper004" c="CABANCAR_ALT" lit="100965"/>"
                                       <axis:atr f="axisper004" c="CBANCAR" a="obligatorio=true"/>/>
                            </td>
                            </axis:visible>
                            <axis:ocultar f="axisper004" c="CBANCO" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CBANCO" id="CBANCO"  <axis:atr f="axisper004" c="CBANCO" a="obligatorio=false"/> title="<axis:alt f="axisper004" c="CBANCO_ALT1" lit="9000964"/>" size="1" class="campowidthselect campo campotexto" style="width:99%;" >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper004" c="SNV_COMBO_CBANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipBANCO}">
                                            <option value = "${element.CBANCO}" 
                                            <c:if test="${element.CBANCO == __formdata.CBANCO}"> selected </c:if> />
                                                ${element.TBANCO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                                
                            <axis:ocultar f="axisper004" c="CCUENTA" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <input type="text"  <axis:atr f="axisper004" c="CCUENTA"  a="obligatorio=false"/>  title="<axis:alt f="axisper004" c="CCUENTA_ALT" lit="100965"/>"  class="campowidthinput campo campotexto" maxlength="20" size="15" value="${__formdata.CCUENTA}" name="CCUENTA" id="CCUENTA" style="width:99%;"/>
                                </td>
                            </axis:ocultar>
                          
                        </tr>                
                    </table>
                    </c:if>
                    <!--  ******************************** **************** ******************************************** -->
                    
                    <!--  ******************************** SECCION TARJETA  ******************************************** -->
                    <c:if test="${__formdata.TIPCCC=='2'}">
                    
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisper004" c="TARJETAS" lit="9902645"/></div>
                        <%-- Datos cuentas bancarias --%>
                        
                        <table class="seccion">
                            <tr>
                                <th style="width:4%;height:0px"></th>
                                <th style="width:19%;height:0px"></th>
                                <th style="width:19%;height:0px"></th>
                                <th style="width:19%;height:0px"></th>
                                <th style="width:19%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>    
                                <axis:ocultar f="axisper004" c="CTIPCC" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper004" c="CTIPCC_CC" lit="9902671"/></b> <!-- Tipo CC Tarjeta -->
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper004" c="CTIPBAN" dejarHueco="false">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper004" c="CTIPBAN_T" lit="9902671"/></b> <!-- Tipo Tarjeta -->
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper004" c="CBANCAR" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper004" c="CBANCAR" lit="9902646"/></b>  <!-- Num. Tarjeta -->
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisper004" c="CBANCO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper004" c="CBANCO" lit="9000964"/></b>  <!-- *** Banco *** -->
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisper004" c="CCUENTA" dejarHueco="false">
                                 <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper004" c="CCUENTA" lit="9902646"/></b>  <!-- *** Num. Tarjeta *** -->
                                </td>
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                
                                
                                <axis:ocultar f="axisper004" c="CTIPCC" dejarHueco="false">
                                 <td class="campocaja" >
                                   <select name="CTIPCC" id="CTIPCC" size="1" class="campowidthselect campo campotexto" style="width:99%;"
                                        onchange="javascript:inicializaCBANCAR();"
                                        title="<axis:alt f="axisper014" c="CTIPCC_LIT" lit="9902671"/>"
                                        <axis:atr f="axisper014" c="CTIPCC" a="obligatorio=true"/>>&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper014" c="CTIPCC_ALT2" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.tipBCC_tarjetas}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.CTIPCC}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                   </select>
                                </td>
                                </axis:ocultar>
                                
                                
                                <axis:ocultar f="axisper004" c="CTIPBAN" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <select name="CTIPBAN" id="CTIPBAN" size="1"  
                                    	<axis:atr f="axisper004" c="CTIPBAN" a="obligatorio=true"/>  title="<axis:alt f="axisper004" c="CTIPBAN_ALT2" lit="9902671"/>" class="campowidthselect campo campotexto" style="width:90%;"
                                    onchange="">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper004" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipTARJETA}">
                                            <option value = "${element.CTIPBAN}" 
                                            <c:if test="${element.CTIPBAN == __formdata.CTIPBAN}"> selected </c:if> />
                                                ${element.TTIPO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                
                                <axis:visible f="axisper004" c="CBANCAR">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto"  <axis:atr f="axisper004" c="CBANCAR" a="obligatorio=true"/> title="<axis:alt f="axisper004" c="CBANCAR_ALT" lit="9902646"/>" size="15" value="${__formdata.CBANCAR}" name="CBANCAR" id="CBANCAR" style="width:80%;"/>
                                </td>
                                </axis:visible>
                                
                                <axis:ocultar f="axisper004" c="CBANCO" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CBANCO" id="CBANCO"  <axis:atr f="axisper004" c="CBANCO" a="obligatorio=false"/> title="<axis:alt f="axisper004" c="CBANCO_ALT1" lit="9000964"/>" size="1" class="campowidthselect campo campotexto" style="width:99%;" >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper004" c="SNV_COMBO_CBANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipBANCO}">
                                            <option value = "${element.CBANCO}" 
                                            <c:if test="${element.CBANCO == __formdata.CBANCO}"> selected </c:if> />
                                                ${element.TBANCO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisper004" c="CCUENTA" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <input type="text"  <axis:atr f="axisper004" c="CCUENTA"  a="obligatorio=false"/>  title="<axis:alt f="axisper004" c="CCUENTA_ALT" lit="9902646"/>"  class="campowidthinput campo campotexto" maxlength="20" size="15" value="${__formdata.CCUENTA}" name="CCUENTA" id="CCUENTA" style="width:80%;"/>
                                </td>
                                </axis:ocultar>
                                
                                
                                
                                
                            </tr>
                            
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper004" c="FVENCIM" lit="100885"/></b> <!-- Fecha vencimiento -->
                                </td>
                                <axis:ocultar f="axisper004" c="TSEGURI" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper004" c="TSEGURI" lit="9902634"/></b>  <!-- Cod. Seguridad -->
                                </td>
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="campocaja">
                                    <input type="text"  class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="MM/yyyy" value="${__formdata.FVENCIM}"/>" name="FVENCIM" id="FVENCIM"  style="width:65%;"
                                    <axis:atr f="axisper004" c="FVENCIM" a="obligatorio=true"/> title="<axis:alt f="axisper004" c="FVENCIM_TIT" lit="100885"/>" readonly/> 
                                    <img id="popup_FVENCIM" alt="<axis:alt f="axisper004" c="SEL_FVENCIM" lit="100885"/>" title="<axis:alt f="axisper004" c="ALT_FVENCIM" lit="100885" />" src="images/calendar.gif"/></a>
                                </td>
                                <axis:ocultar f="axisper004" c="TSEGURI" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisper004" c="TSEGURI"/>  title="<axis:alt f="axisper004" c="TSEGURI_ALT" lit="9902634"/>" size="15" value="${__formdata.TSEGURI}" name="TSEGURI" id="TSEGURI" style="width:60%;"/>
                                </td>
                                </axis:ocultar>
                            </tr>
                            
                            
                        </table>                        
                        </c:if>
                    
                    <!--  ********************************************************************************************** -->
                    
                    
                    
                    
                    
                    
                </td>
            </tr>
        </table>			
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper004</c:param><c:param name="f">axisper004</c:param>
            <c:param name="__botones">salir,aceptar</c:param>
        </c:import>
       
    </form>
    
            <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FBAJA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FBAJA", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
        
        
         <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FVENCIM",     
                ifFormat       :    "%m/%Y",      
                button         :    "popup_FVENCIM", 
                singleClick    :    true,
                firstDay       :    1
            });    
        </script>

</div> 
<c:if test="${param.embedded != 'true'}">   
    <c:import url="../include/mensajes.jsp" />

   </body>
</html>
</c:if>

