<%/*
*  Fichero: axisadm094a.jsp
*  @author <a href = "mailto:jpacheco@csi-ti.com">Juan Carlos PAcheco</a> 
*     

*/
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />
        
        <script language="Javascript" type="text/javascript">
        
        function f_onload(){        
            try{
            document.miForm.ACCOUNT.focus();
            } catch (e) {	
            try{
               document.miForm.NOMBRECOMP.focus();
            }catch(e){ }
            }
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_cancelar() {
            parent.f_but_cerrar_axisadm094a();        
        }
        
        function f_but_aceptar(){
          
            var AUTHORIZE=objDom.getValorPorId("AUTHORIZE");
            var SEQCAJA=objDom.getValorPorId("SEQCAJA");
            var SPERSON=objDom.getValorPorId("SPERSON");
            var SSEGURO=objDom.getValorPorId("SSEGURO");
            
            if (objValidador.validaEntrada()) {
               parent.f_authorize(AUTHORIZE, SEQCAJA, SPERSON, SSEGURO);
            }
        }
       
        
        function f_cerrar_axisctr019(){
		objUtiles.cerrarModal("axisctr019");
	}

	function f_aceptar_axisctr019(SSEGURO){
		objDom.setValorPorId("SSEGURO_D", SSEGURO);
		f_cerrar_axisctr019();		
	}
        
        function f_buscar_poliza(){
             objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form");
        }
        
        </script>
        
    </head>
    
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_insertar() }">
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
         <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}" />
            <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}" />
            <input type="hidden" name="SNIP" id="SNIP" value="${__formdata.SNIP}" />
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" />
            <input type="hidden" name="MODO_SWPUBLI" id="MODO_SWPUBLI" value="${__formdata.MODO_SWPUBLI}" />
            <input type="hidden" name="MODO_BUSQUEDA" id="MODO_BUSQUEDA" value="${__formdata.MODO_BUSQUEDA}" />
            <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}" />
            <input type="hidden" name="CONDICION" id="CONDICION"  value="${__formdata.CONDICION}" />
            <input type="hidden" name="SEQCAJA" id="SEQCAJA"  value="${__formdata.SEQCAJA}" />
            
            <c:import url="../include/titulo_nt.jsp">            
                <c:param name="titulo">
                <axis:alt f="axiscob001" c="TITULO" lit="9907993"/>
                </c:param>
                <c:param name="formulario">
                <axis:alt f="axiscob001" c="FORM" lit="9907993"/>
                </c:param>
                <c:param name="form">axisadm094a</c:param>            
            </c:import>            
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo">
                <axis:alt f="axisctr019" c="TITULO" lit="9001558"/>
                </c:param>
                <c:param name="nid" value="axisctr019"/>
            </c:import> 
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo">
                <axis:alt f="axisadm094a" c="TITULO" lit="9907904"/>
                </c:param>
                <c:param name="nid" value="axisadm094a"/>
            </c:import>
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:20px;">
                    <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/>
                            <b><axis:alt f="axisadm094a" c="LIT32" lit="9902028"/></b>
                        </div>
                        
                        <table class="seccion" >
                            <tr>                        
                            <td align="left">
                                <table class="area" align="center">
                                    <tr> 
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    </tr> 
                                    
                                    <tr>
                                        <axis:ocultar f="axisadm094a" c="POLICY" dejarHueco="false"> 
                                            <td class="titulocaja" >
                                                <b><axis:alt f="axisadm094a" c="POLICY" lit="9907772"/></b>
                                            </td>                                            
                                        </axis:ocultar>
                                        
                                        <axis:ocultar f="axisadm094a" c="HOLDER" dejarHueco="false"> 
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm094a" c="HOLDER" lit="9907907"/></b>
                                            </td>                                            
                                        </axis:ocultar>
                                        
                                        <axis:ocultar f="axisadm094a" c="AMOUNT" dejarHueco="false"> 
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm094a" c="AMOUNT" lit="9907994"/></b>
                                            </td>                                            
                                        </axis:ocultar>
                                    </tr>
                                    
                                    <tr>
                                        <axis:visible f="axisadm094a" c="POLICY">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NPOLIZA_V}" name="NPOLIZA_V" id="NPOLIZA_V" size="10" disabled="true"/>
                                            </td>
                                        </axis:visible>   
                                        
                                        <axis:visible f="axisadm094a" c="NOMBRE">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NOMBRE}" name="NOMBRE" id="NOMBRE" size="10" disabled="true"/>
                                            </td>
                                        </axis:visible> 
                                        
                                        <axis:visible f="axisadm094a" c="AMOUNT">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${__formdata.AMOUNT}'/>" name="AMOUNT" id="AMOUNT" size="10" disabled="true"/>
                                            </td>
                                        </axis:visible> 
                                        
                                    </tr>
                                    
                                </table>
                            </td>                        
                            </tr>
                        </table>                      
                              
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/>
                            <b><axis:alt f="axisadm094a" c="flecha" lit="9907993"/></b>
                        </div> 
                        
                        <table class="seccion" >
                            <tr>                        
                            <td align="left">
                                <table class="area" align="center">
                                    <tr> 
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    </tr> 
                                    
                                    <tr>
                                        <axis:ocultar f="axisadm094a" c="REASON" dejarHueco="false"> 
                                            <td class="titulocaja" >
                                                <b><axis:alt f="axisadm094a" c="REASON" lit="9908008"/></b>
                                            </td>                                            
                                        </axis:ocultar>
                                        
                                        <axis:ocultar f="axisadm094a" c="AUTHORIZE" dejarHueco="false"> 
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm094a" c="AUTHORIZE" lit="9907998"/></b>
                                            </td>                                            
                                        </axis:ocultar>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <axis:visible f="axisadm094a" c="REASON">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CRAZON}" name="REASON" id="REASON" size="10" disabled="true"/>
                                            </td>
                                        </axis:visible>   
                                        
                                        <axis:visible f="axisadm094a" c="AUTHORIZE">
                                            <td class="campocaja">
                                                <select name="AUTHORIZE" id="AUTHORIZE" value="${__formdata.AUTHORIZE}"  class="campowidthselect campo campotexto" 
                                                <axis:atr f="axisadm094a" c="AUTHORIZE" a="obligatorio=true"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm094a" c="SNV_COMBO" lit="9907998"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listValores.autorize}">
                                                <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                                </option>
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
                
                <div class="separador">&nbsp;</div>
                
                <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm094a</c:param><c:param name="f">axisadm094a</c:param>
                    <c:param name="f">axisadm094a</c:param>
                    <c:param name="__botones">cancelar,aceptar</c:param>
                </c:import>
                
            </form>
        
        <c:import url="../include/mensajes.jsp" />
   </body>
   
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisadm095');
      </script>                   
    </c:if>   
   
</html>