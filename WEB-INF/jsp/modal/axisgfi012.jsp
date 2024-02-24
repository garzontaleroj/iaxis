<%
/**
*  Fichero: axisgfi012.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  Fecha: 06/07/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    
    <script language="Javascript" type="text/javascript">
        function doPaste(obj){     
       maxLength = 50;
       var oTR = obj.document.selection.createRange();
       var iInsertLength = maxLength - obj.value.length + oTR.text.length;   
       try {
          var sData = window.clipboardData.getData("Text").substr(0,iInsertLength);           
          oTR.text = sData;          
          }
          catch (err) {           
          }
         
          if (window.event) { //IE
            window.event.returnValue = null;
          } else {
            //not IE
            obj.value = obj.value.substr(0,maxLength);
            return false;
          }    
        } 
        function f_onload() {
           
            
            var ver="${ERROR}";
            var salir = 0;
            if (!objUtiles.estaVacio(ver) && '${ERROR}' == 0){
                salir = 1;

                parent.f_aceptar_axisgfi012("${__formdata.TERMINO}");
            }
            
            f_cargar_propiedades_pantalla();
            
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisgfi012();
        }        
         
        function f_but_aceptar() {  
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario ("modal_axisgfi012.do","aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
         
    
         
    </script>
  </head>
    <body class=" " onload="f_onload()" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="TERMINO_OLD" name="TERMINO_OLD" value="${TERMINO[0].TERMINO}"/>
            <input type="hidden" id="ISNEW" name="ISNEW" value="${ISNEW}" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisgfi012" c="FORM" lit="9001991" /></c:param>
                <c:param name="producto"><axis:alt f="axisgfi012" c="PRODUCTO" lit="9001991"/></c:param>
                <c:param name="form">axisgfi012</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:5%;height:0px"></th>
                                
                                <th style="width:80%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                            </tr>
                            <tr><td><div class="separador">&nbsp;</div></td></tr>
                            <tr>
                                <td></td>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisgfi012" c="TERMINO" lit="9001991" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${TERMINO[0].TERMINO}" name="TERMINO" id="TERMINO" title="<axis:alt f="axisgfi012" c="TERMINO" lit="9001991"/>" size="15" 
                                           <axis:atr f="axisgfi012" c="TERMINO" a="modificable=true&obligatorio=true"/> 
                                           <c:if test="${ISNEW eq 0}"> disabled</c:if>/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisgfi012" c="TIPO" lit="100565" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="campocaja">
                                    <select name="TIPO" id ="TIPO" size="1" class="campowidthselect campo campotexto" onchange="" <axis:atr f="axisgfi012" c="TIPO" a="modificable=true&obligatorio=true"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisgfi012" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="TIPO" items="${TIPOS}">
                                            <option value="${TIPO.CODIGO}"
                                                <c:if test="${TERMINO[0].TIPO != 'null' && TIPO.CODIGO == TERMINO[0].TIPO}"> selected </c:if>>
                                                    ${TIPO.DESCRIP}</option>
                                        </c:forEach>
                                    </select>
                                </td> 
                            </tr>
                            <tr>
                                <td></td>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisgfi012" c="ORIGEN" lit="9000443"/></b>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="campocaja">
                                    <select name="ORIGEN" id ="ORIGEN" size="1" class="campowidthselect campo campotexto" onchange="" <axis:atr f="axisgfi012" c="ORIGEN" a="modificable=true&obligatorio=false"/> >
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisgfi012" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="ORIGEN" items="${ORIGENES}">
                                            <option value="${ORIGEN.NUMTAB}"
                                                <c:if test="${!empty TERMINO[0].ORIGEN  && ORIGEN.NUMTAB == TERMINO[0].ORIGEN}"> selected </c:if>>
                                                    ${ORIGEN.NOMTAB}</option>
                                        </c:forEach>
                                    </select>
                                </td> 
                            </tr>
                             <tr>
                                <td></td>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisgfi012" c="DESCRIPCION" lit="100588" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="campocaja">
                                    <textarea class="campo campotexto" name="DESCRIPCION" id="DESCRIPCION" rows="4" cols="1" value="${TERMINO[0].TDESC}" 
                                    	onpaste= "doPaste(this)" onkeydown=" if(this.value.length>= 50 && event.keyCode != 32 && event.keyCode != 13 && event.keyCode > 47){return false;}"
                                    <axis:atr f="axisgfi012" c="DESCRIPCION" a="modificable=true&obligatorio=false"/> >${TERMINO[0].TDESC}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisgfi012" c="OPERADOR" lit="9001992" /></b>
                                </td>
                                </tr>
                            <tr>
                                <td></td>
                                <td class="campocaja">
                                    <select name="OPERADOR" id ="OPERADOR" size="1" class="campowidthselect campo campotexto" onchange="" style="width:25%;"
                                    <axis:atr f="axisgfi012" c="OPERADOR" a="modificable=true&obligatorio=false"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisgfi012" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="OPERADOR" items="${OPERADORES}">
                                            <option value="${OPERADOR.CATRIBU}"
                                                <c:if test="${ !empty TERMINO[0].OPERADOR && OPERADOR.CATRIBU == TERMINO[0].OPERADOR}"> selected </c:if>>
                                                    ${OPERADOR.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td> 
                            </tr>
                            <tr><td><div class="separador">&nbsp;</div></td></tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        
                        
                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisgfi012</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
     </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

