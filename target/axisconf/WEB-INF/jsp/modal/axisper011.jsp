<%/* Revision:# Ac/xYePDBNEkIHtLBVnsNg== # */%>
<%-- 
*  Fichero: axisper011.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*
*  Fecha: 23/07/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
           <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        var nav4 = window.Event ? true : false;
		function ValidNum(evt) {
		    // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57
		    if(!($("#CTIPCON").val() == '3' || $("#CTIPCON").val()== '8')){
		    	var key = nav4 ? evt.which : evt.keyCode;
			    return (key <= 13 || (key >= 48 && key <= 57));
		    }
		    return true;
		}


        function correoValido(email) {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(email);
        }
        
        
        function f_onload() {
        	  <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper011');
			 </c:if>
         	 f_cargar_propiedades_pantalla();
           
            var SMODCONOUT = "${__formdata.SMODCONOUT}"; 
            if (!objUtiles.estaVacio(SMODCONOUT))
                parent.f_aceptar_axisper011("${__formdata.SPERSON}");
        }
        
        function f_but_aceptar() {
        	if(!correoValido($("#TVALCON").val()) && $("#CTIPCON").val() == '3'){
        		alert("Ingrese un correo valido.");
        	}else{
	            if (objValidador.validaEntrada()) {
	                objUtiles.ejecutarFormulario("modal_axisper011.do", "grabarPersona", document.miForm, "_self", objJsMessages.jslit_cargando);   
	            }
        	}
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisper011();
        }        
       
        function selectFlag(valor) {
            idFlag = document.miForm.COUNTRIES_PER011.options[valor].id;
            textFlag = document.miForm.COUNTRIES_PER011.options[valor].text;
            if (!objUtiles.estaVacio(idFlag)){
                document.getElementById('flagPais').src = "images/flagiso/" + idFlag + ".png";
                document.getElementById("TFLAG_span").innerHTML = "<b>" + textFlag + "</b>";
            }
            else{
                document.getElementById('flagPais').src = "images/flagiso/_unknown.png";
                document.getElementById("TFLAG_span").innerHTML = "";
            }
        }   
 
        function f_carga_dependencia(){
           f_cargar_propiedades_pantalla();
        }
        
         function validar(){
           if ((!objDom.getValorPorId("TVALCONPNEW") || objDom.getValorPorId("TVALCONPNEW")))
                return false;
            else            
                return true;
        }
	
	function cargar_pantalla_por_clase() {
		$("#TVALCON").val('');
    		f_cargar_propiedades_pantalla();    		
    	}
      
    </script>
  </head>
    <body onload="f_onload();">
        <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        
        <!--*********************************** -->
        <form name="miForm" action="" method="POST" onSubmit="return validar();">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="faceptar" value="${__formdata.faceptar}"/>
            <%-- Esto es necesario tenerlo como hidden para volverlo a enviar a servidor para grabar --%>
            <input type="hidden" name="isNew" value="${__formdata.isNew}"/>
            <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" name="SPEREAL" value="${__formdata.SPEREAL}"/>
            <input type="hidden" name="CESTPER" value="${__formdata.CESTPER}"/>
            <input type="hidden" name="CMODCON" value="${__formdata.CMODCON}"/>
            <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" name="CTIPPER" value="${__formdata.CTIPPER}"/>
            <input type="hidden" name="CTABLAS" value="${__formdata.CTABLAS}"/>
            
            
            <!-- 34583-203291  -->
            <input type="hidden" id="CPAIS" name="CPAIS" value="${__formdata.CPAIS}" />


            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper011" c="formulario" lit="9000414" /></c:param>
                <c:param name="producto"><axis:alt f="axisper011" c="formulario" lit="9000414" /></c:param>
                <c:param name="form">axisper011</c:param>
            </c:import>

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> <%-- CTIPPER == 2: Persona Jurídica --%>
                        <div class="separador">&nbsp;</div>
                        
                        <%-- Datos CONTACTOS--%>
                        
                        <table class="seccion">
                            <tr>
                                <th style="width:4%;height:0px"></th>
                                <th style="width:23%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:16%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisper011" c="CTIPCON">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper011" c="lit_CTIPPER" lit="1000616"/></b>
                                </td>
                                </axis:visible>
                                
                                 <axis:visible f="axisper011" c="COUNTRIES_PER011">
                                    <td class="titulocaja" id="tit_COUNTRIES_PER011">
                                        <b id="label_COUNTRIES_PER011"><axis:alt f="axisper011" c="lit_COUNTRIES_PER011" lit="9910954"/></b>
                                    </td>
                                 </axis:visible>
                                 
                                <axis:visible f="axisper011" c="TVALCON">
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisper011" c="lit_1000617" lit="1000617"/></b>
                                </td>
                                </axis:visible>
                                
                                 <axis:visible f="axisper011" c="TCOMCON">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper011" c="lit_9000759" lit="9000759"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper011" c="CDOMICI">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper011" c="lit_105889" lit="105889"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:visible f="axisper011" c="CTIPCON">
                                <td class="campocaja">
                                <c:choose>
                                 <c:when test="${empty __formdata.isNew || __formdata.isNew}">
                                <select name="CTIPCON" id="CTIPCON" size="1" class="campowidthselect campo campotexto" style="width:90%;" onchange="cargar_pantalla_por_clase();"
                                        title="<axis:alt f="axisper011" c="lit_CTIPPER" lit="1000616"/>"
                                        <axis:atr f="axisper011" c="CTIPCON" a="obligatorio=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper011" c="lit_1000348" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lsttipcontactos}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CTIPCON}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                    </c:when>
                                    <c:otherwise>
                                    <input type="text"  class="campowidthinput campo campotexto" value="${__formdata.TTIPCON}" name="TTIPCON" id="TTIPCON" style="width:90%;" readonly="true"/>                                
                                    <input type="hidden" class="campowidthinput campo campotexto" size="15" value="${__formdata.CTIPCON}" name="CTIPCON" id="CTIPCON" style="width:90%;"/>
                                    </c:otherwise>
                                    </c:choose>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper011" c="COUNTRIES_PER011">
                                <td class="campocaja" id="td_COUNTRIES_PER011">  
                                <c:choose>
                                 <c:when test="${empty __formdata.isNew || __formdata.isNew}">
                                        
                                        <select onchange="selectFlag(this.selectedIndex);" name="COUNTRIES_PER011" id="COUNTRIES_PER011" class="campowidthselect campo campotexto" style="width:80%;vertical-align: top;"  
                                            title="<axis:alt f="axisper011" c="lit_COUNTRIES" lit="9908159"/>"  <axis:atr f="axisper011" c="COUNTRIES_PER011" a="obligatorio=true"/>>
                                            
                                                <option value="<%= Integer.MIN_VALUE %>">- <axis:alt f="axisper011" c="lit_1000348" lit="1000348"/> -</option>
                                                
                                                <c:forEach var="element" items="${__formdata.listValores.listPrefijos}">
                                                
                                                    <option id="${element.CODISOIBAN}" value = "${element.CODISOTEL}"
                                                        <c:if test="${element.CODISOTEL == __formdata.CPREFIX}"> selected </c:if> >
                                                        ${element.TPAIS}   +${element.CODISOTEL} 
                                                    </option>
                                            
                                                </c:forEach>
                                                
                                        </select> 
                                        <img id="flagPais" src="images/flagiso/_unknown.png" onerror="this.src='images/flagiso/_unknown.png'" width="20px" height="20px"/>
                                        &nbsp;<span id="TFLAG_span"><b>${__formdata.TPAIS}</b></span>
                                 </c:when>
                                <c:otherwise> 
                                    <input type="text"  class="campowidthinput campo campotexto" value="${__formdata.CPREFIX}" name="COUNTRIES_PER011" id="COUNTRIES_PER011" style="width:90%;" readonly="true"/>
                                </c:otherwise>
                                </c:choose>
                                </td>
                                </axis:visible>
                                
                                 <td class="campocaja" >
                                 
                                 <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TVALCON}" name="TVALCON" id="TVALCON" style="width:90%;"
                                        title="<axis:alt f="axisper011" c="lit_1000617" lit="1000617"/>" onkeypress="return ValidNum(event);"
                                        <axis:atr f="axisper011" c="TVALCON" a="obligatorio=true"/> onpaste="return false" autocomplete="off"/>
                                 
                            </td>
                               <axis:visible f="axisper011" c="TCOMCON">
                                <td class="campocaja" >
                                 <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TCOMCON}" name="TCOMCON" id="TCOMCON" style="width:90%;"
                                        title="<axis:alt f="axisper011" c="lit_9000759" lit="9000759"/>"
                                        <axis:atr f="axisper011" c="TCOMCON" a="obligatorio=false"/>/>
                                 
                            </td>
                            </axis:visible>
                             <axis:visible f="axisper011" c="CDOMICI">
                               <td class="campocaja" colspan="2">
                                <select name="CDOMICI" id="CDOMICI" size="1" class="campowidthselect campo campotexto" 
                                <axis:atr f="axisper011" c="CDOMICI" a="isInputText=false"/>style="width:90%;">
                                           <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper011" c="lit_1000348" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.DIRECCIONES}">
                                                <option value = "${element.OB_IAX_DIRECCIONES.CDOMICI}" 
                                                  <c:if test="${element.OB_IAX_DIRECCIONES.CDOMICI == __formdata.CDOMICI}"> selected </c:if> />
                                                        ${element.OB_IAX_DIRECCIONES.TTIPDIR} - ${element.OB_IAX_DIRECCIONES.TDOMICI}
                                                </option>
                                            </c:forEach>
                               </select>
                                </td>
  
                            </axis:visible>
                            </tr>
                        </table>
                        </c:if>
                    </td>
                </tr>
            </table>			
            
            <div class="separador">&nbsp;</div>
            <div class="separador">&nbsp;</div>
            <div class="separador">&nbsp;</div>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper011</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
        </div>
    </body>
</html>
